#!/usr/bin/env bash

# Função para exibir mensagens formatadas
inform() {
    local message=$1
    local color=$2
    echo -e "\e[${color}m$message\e[m"
}

# Escolher idioma
echo "Choose your language / Escolha seu idioma:"
echo "1. Português"
echo "2. English"
read -p "Enter your choice / Digite sua escolha: " language_choice

if [[ $language_choice == 1 ]]; then
    # Definir mensagens padrão em português
    mensagem_inicial="\n       ############################################################\n       #                  Tweaks pós instalação Debian 12            #\n       ############################################################ \n"
    mensagem_projeto="Para mais informações, visite o link do projeto:\nhttps://github.com/phaleixo/after_install_debian_12"
    mensagem_continuar="Você deseja prosseguir? (y/n): "
    mensagem_distribuicao="Distribuição Debian 12 detectada."
    mensagem_internet="Conexão com a internet OK."
    mensagem_sem_internet="Você não está conectado à internet. Verifique sua conexão antes de prosseguir."
    mensagem_sudo="Sudo está autenticado. Continuando com o script..."
    mensagem_nao_sudo="O usuário atual não possui permissões de sudo ou o sudo pode não estar instalado."
    mensagem_sem_driver="Não foi possível detectar o driver de vídeo AMDGPU ou Radeon no sistema."
    mensagem_concluido="Configuração concluída. Pressione qualquer tecla para fechar o terminal."
elif [[ $language_choice == 2 ]]; then
    # Definir mensagens em inglês
    mensagem_inicial="\n       ############################################################\n       #                  Debian 12 Post-Install Tweaks            #\n       ############################################################ \n"
    mensagem_projeto="For more information, visit the project link:\nhttps://github.com/phaleixo/after_install_debian_12"
    mensagem_continuar="Do you want to proceed? (y/n): "
    mensagem_distribuicao="Debian 12 Distribution detected."
    mensagem_internet="Internet connection OK."
    mensagem_sem_internet="You are not connected to the internet. Check your network or Wi-Fi connection before proceeding."
    mensagem_sudo="Sudo is authenticated. Continuing with the script..."
    mensagem_nao_sudo="The current user does not have sudo permissions or sudo may not be installed."
    mensagem_sem_driver="Unable to detect the AMDGPU or Radeon video driver on the system."
    mensagem_concluido="Configuration completed. Press any key to close the terminal."
else
    inform "Opção inválida." "31;1"
    exit 1
fi

# Exibir mensagem inicial
echo -e "$mensagem_inicial"
echo -e "$mensagem_projeto"

# Confirmar execução do script
read -p "$mensagem_continuar" response
[[ "$response" != "y" ]] && inform "Operação cancelada pelo usuário." "31;1" && exit 0

### Verificar se a distribuição é compatível
if [[ $(lsb_release -cs) != "bookworm" ]]; then
    inform "Distribuição não aprovada para uso com este script." "31;1"
    exit 1
fi

### Verificar se há conexão com a internet
if ping -q -c 3 -W 1 1.1.1.1 >/dev/null; then
    inform "$mensagem_internet" "32;1"
    echo "Continuando com o script..."
    echo ""
else
    inform "$mensagem_sem_internet" "31;1"
    exit 1
fi

# Checar privilégios do sudo
sudo -v || { inform "$mensagem_nao_sudo" "31;1"; exit 1; }
inform "$mensagem_sudo" "32;1"

### Remove unnecessary apps
apps_remove=(
    fcitx*
    mozc*
    xiterm+thai*
    mlterm*
    xterm*
    hdate*
    kasumi*
    gnome-games*
    im*
    goldendict*
    hdate*
    uim*
    thunderbird*
    gnome-music    
)

### Desinstalar e limpar
for app_name_remove in "${apps_remove[@]}"; do
    sudo apt remove --purge "$app_name_remove" -y
done

sudo apt autoremove && sudo apt autoclean

# Ativar o repositório contrib e non-free
sudo apt-add-repository contrib -y
sudo apt-add-repository non-free -y
sudo apt update && sudo apt full-upgrade -y

# Instalar suporte a Flatpak e repositório Flathub
sudo apt install gnome-software-plugin-flatpak -y 
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

### Install codecs, fonts and tweaks.
apps=(  
        exfat-fuse 
	ffmpeg 
	ffmpegthumbnailer 
	firmware-amd-graphics 
	firmware-linux-nonfree 
	font-manager 
	fonts-croscore 
	fonts-noto 
	fonts-noto-extra 
	fonts-ubuntu 
	gir1.2-gtop-2.0 
	gnome-browser-connector 
	gnome-firmware 
	gnome-tweaks 
	gstreamer1.0-plugins-ugly 
	gstreamer1.0-vaapi 
	libavcodec-extra 
	ldap-utils 
	libasound2-plugins 
	micro 
	vdpauinfo
	python3-pip
	python3
	gnome-boxes
	p7zip-rar
	ntp
	network-manager-config-connectivity-debian
	ttf-mscorefonts-installer
	fontconfig
	git
)

for app_name in "${apps[@]}"; do
  if ! dpkg -l | grep -q "$app_name"; then
    sudo apt install "$app_name" -y
  else
    echo "[installed] - $app_name"
  fi
done

# Instalar aplicativos Flatpak
flatpak=(
	org.gimp.GIMP
	org.gimp.GIMP.Plugin.Resynthesizer/x86_64/2-40
	org.inkscape.Inkscape 
	org.gnome.Builder
	ar.xjuan.Cambalache 
	re.sonny.Workbench
)

for nome_do_flatpak in "${flatpak[@]}"; do
  if ! flatpak list | grep -q "$nome_do_flatpak"; then
    sudo flatpak install flathub --system "$nome_do_flatpak" -y
  fi
done

### Adicionar/Confirmar arquitetura 32-bit
sudo dpkg --add-architecture i386

### Remover Firefox ESR
sudo apt remove --purge firefox-esr -y

### Criar um diretório para armazenar chaves de repositório APT, se não existir
sudo install -d -m 0755 /etc/apt/keyrings

### Importar a chave de assinatura do repositório APT da Mozilla
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null

### A impressão digital deve ser 35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3
gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); print "\n"$0"\n"}'

### Adicionar o repositório APT da Mozilla à sua lista de fontes
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null

### Configurar o APT para priorizar pacotes do repositório Mozilla
echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla 

### Atualizar a lista de pacotes e instalar o pacote .deb do Firefox
sudo apt-get update -y && sudo apt-get install firefox -y && sudo apt-get install firefox-l10n-pt-br -y

## Instalar Vscode
sudo apt-get install wget gpg -y
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https -y
sudo apt update
sudo apt install code -y

### Fira fonts
mkdir -p ~/.fonts

wget --version > /dev/null

if [[ $? -ne 0 ]]; then
        echo "wget não disponível, instalando"
        sudo apt update -y && sudo apt install wget -y
fi

unzip >> /dev/null

if [[ $? -ne 0 ]]; then
        echo "unzip não disponível, instalando"
        sudo apt update -y && sudo apt install unzip -y
fi


wget -O fonts.zip "https://github.com/mozilla/Fira/archive/refs/tags/4.202.zip"

wget -O firacode.zip "https://github.com/tonsky/FiraCode/releases/download/1.204/FiraCode_1.204.zip"

if [[ $? -ne 0 ]]; then
        echo "Falha ao baixar, saindo"
        exit 1
fi

unzip fonts.zip -d ~/.fonts
unzip firacode.zip -d ~/.fonts


clear
echo "limpando o cache de fontes "
fc-cache -v -f
clear
echo "Concluído"
sleep 2
clear
echo "Definindo fontes padrão "

gsettings set org.gnome.desktop.interface document-font-name 'Fira Sans Regular 11'
gsettings set org.gnome.desktop.interface font-name 'Fira Sans Regular 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'Monospace Regular 13'
gsettings set org.gnome.nautilus.desktop font 'Fira Sans Regular 11'
gsettings set org.gnome.desktop.wm.preferences titlebar-font "Fira Sans SemiBold 12"
clear

rm -rf fonts.zip
rm -rf firacode.zip

###Radeon para Amdgpu

# Verificar o driver de vídeo
video_driver_info=$(lspci -k | grep amdgpu)
video_card_info=$(lspci | grep VGA)

if [[ "$video_driver_info" == *"Kernel driver in use: amdgpu"* ]]; then
    # O driver Amdgpu já está ativo
    inform "Placa de vídeo: '$video_card_info'\n----------------------------------------------------------------" "32;1"
    inform "O driver amdgpu já está ativo. Nenhuma ação necessária." "32;1"
elif [[ "$video_driver_info" == *"Kernel driver in use: radeon"* ]]; then
    # Mudar de radeon para amdgpu
    inform "Placa de vídeo: '$video_card_info'\n----------------------------------------------------------------" "32;1"
    inform "Mudando o driver de radeon para amdgpu..."
    sed_command='s/GRUB_CMDLINE_LINUX_DEFAULT="\(.*\)"/GRUB_CMDLINE_LINUX_DEFAULT="\1 radeon.cik_support=0 amdgpu.cik_support=1 radeon.si_support=0 amdgpu.si_support=1"/'

    if sudo sed -i "$sed_command" /etc/default/grub && sudo update-grub; then
        inform "Configuração do driver atualizada com sucesso. Reinicie o sistema para aplicar as alterações." "32;1"
    else
        inform "Erro ao atualizar o GRUB ou alterar o driver. Por favor, reinicie o sistema manualmente após corrigir o problema." "31;1"
    fi
else
    # Nenhum driver AMDGPU ou Radeon detectado
    inform "Placa de vídeo: '$video_card_info'" "31;1"
    inform "Não foi possível detectar o driver de vídeo AMDGPU ou Radeon no sistema." "31;1"
fi

echo -e "$mensagem_concluido"
read -n 1 -s any_key
exit 0
