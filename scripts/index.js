// Language translations
const translations = {
    pt: {
        "title": "Pós-Instalação do Debian",
        "hero.title": "Otimize Sua Experiência com o Debian",
        "hero.subtitle": "Uma coleção de scripts para personalizar e melhorar sua instalação do Debian Stable com aplicativos essenciais, codecs, ajustes e muito mais.",
        "hero.download": "Baixar Debian",
        "hero.viewScripts": "Ver Scripts",
        "more.title": "Por que usar o Debian Stable",
        "more.description": "O Debian 12 Bookworm é a versão estável mais recente do sistema operacional Linux Debian, lançado em junho de 2023. É conhecido por sua estabilidade, amplo suporte a ambientes de desktop  e uma vasta coleção de mais de 64 mil pacotes de software.",
        "more.button": "Mais informações",
        "about.title": "Porque usar os Scripts:",
        "about.description": "Apesar do Debian ser muito confiável, pode ser trabalhoso deixá-lo pronto para uso pessoal ou para trabalho.Estes scripts ajudam a tornar a pós-instalação com GNOME e XFCE mais simples .Tudo será feito utilizando o terminal, é só copiar e  colar no terminal.",
        "scripts.title": "Scripts de Pós-Instalação",
        "scripts.complete.title": "Pós-instalação base para GNOME e XFCE  (recomendado)",
        "scripts.one":"Instalar Scripts individualmente",
        "scripts.complete.description": "Ativa os repositórios contrib e non-free,instala suporte ao Flatpak com o repositório Flathub, altera o Firefox ESR para a versão de lançamento atual, instala codecs multimídia, firmware, fontes e utilitários úteis e remove aplicativos pré-instalados desnecessários para limpar seu sistema.",
        "scripts.repos.title": "Ativar Repositórios",
        "scripts.repos.description": "Ative os repositórios contrib e non-free e instale suporte ao Flatpak com o repositório Flathub.",
        "scripts.firefox.title": "Firefox Atual",
        "scripts.firefox.description": "Mude do Firefox ESR para a versão de lançamento atual.",
        "scripts.codecs.title": "Codecs & Ajustes",
        "scripts.codecs.description": "Instale codecs multimídia, firmware, fontes e utilitários úteis.",
        "scripts.extensions.title": "Extensões GNOME (GNOME)",
        "scripts.extensions.description": "Instale extensões úteis do GNOME como Dash-to-Dock, Tiling Assistant e mais.",
        "scripts.remove.title": "Remover Apps Desnecessários",
        "scripts.remove.description": "Remova aplicativos pré-instalados desnecessários para limpar seu sistema.",
        "scripts.apps.title": "Instalar Aplicativos",
        "scripts.look":"Melhorar Aparência  (Opcional)",
        "scripts.plus":"Adicionais",
        "scripts.apps.description": "Instale aplicativos úteis via Flatpak incluindo GIMP, Inkscape e mais.",
        "scripts.radeon.title": "Radeon para AMDGPU",
        "scripts.radeon.description": "Mude do driver Radeon para AMDGPU para melhor desempenho com certas GPUs AMD.",
        "scripts.fonts.title": "Instalar Fontes",
        "scripts.fonts.description": "Instale e configure fontes adicionais para melhor tipografia.",
        "scripts.wallpapers.title": "Instalar Papéis de Parede",
        "scripts.wallpapers.description": "Baixe e configure papéis de parede adicionais para sua área de trabalho.",
        "scripts.copy": "Copiar",
        "features.title": "O Que Está Incluído",
        "features.packages.title": "Pacotes Essenciais",
        "features.packages.description": "Codecs, firmware, fontes e utilitários para tornar seu sistema totalmente funcional.",
        "features.customization.title": "Personalização",
        "features.customization.description": "Extensões e ajustes para melhorar sua experiência com o desktop GNOME ou XFCE.",
        "features.performance.title": "Desempenho",
        "features.performance.description": "Otimizações de drivers e remoção de bloat para um sistema mais rápido.",
        "footer.text": "Scripts de Pós-Instalação do Debian 12",
        "footer.text2": "Desenvolvido por",
        "footer.disclaimer": "Não afiliado ao Projeto Debian. Use por sua conta e risco.",
        "notification.copied": "Copiado para a área de transferência!"
    },
    es: {
        "title": "Post-Instalación para Debian",
        "hero.title": "Optimiza tu Experiencia con Debian",
        "hero.subtitle": "Una colección de scripts para personalizar y mejorar tu instalación de Debian Stable con aplicaciones esenciales, códecs, ajustes y más.",
        "hero.download": "Descargar Debian",
        "hero.viewScripts": "Ver Scripts",
        "more.title": "Por qué usar Debian Stable",
        "more.description": "Debian 12 Bookworm es la versión estable más reciente del sistema operativo Linux Debian, lanzado en junio de 2023. Se destaca por su estabilidad, amplio soporte para entornos de escritorio y una vasta colección de más de 64 mil paquetes de software.",
        "more.button": "Más información",
        "about.title": "Por qué usar los Scripts:",
        "about.description": "Aunque Debian es muy fiable, puede ser laborioso dejarlo listo para uso personal o para el trabajo. Estos scripts ayudan a simplificar la post-instalación más sencilla con GNOME y XFCE. Todo se hará usando la terminal; solo tienes que copiar y pegar en la terminal.",
        "scripts.title": "Scripts de Post-Instalación",
        "scripts.one":"Instalar Scripts individualmente",
        "scripts.complete.title": "Post-instalación base para GNOME y XFCE (recomendado)",
        "scripts.complete.description": "Activa los repositorios contrib y non-free, instala soporte para Flatpak con el repositorio Flathub, cambia Firefox ESR por la versión de lanzamiento actual, instala códecs multimedia, firmware, fuentes y utilidades útiles, y elimina aplicaciones preinstaladas innecesarias para limpiar tu sistema.",
        "scripts.repos.title": "Activar Repositorios",
        "scripts.repos.description": "Activa los repositorios contrib y non-free e instala soporte para Flatpak con el repositorio Flathub.",
        "scripts.firefox.title": "Firefox Actual",
        "scripts.firefox.description": "Cambia de Firefox ESR a la versión de lanzamiento actual.",
        "scripts.codecs.title": "Códecs & Ajustes",
        "scripts.codecs.description": "Instala códecs multimedia, firmware, fuentes y utilidades útiles.",
        "scripts.extensions.title": "Extensiones GNOME (GNOME)",
        "scripts.extensions.description": "Instala extensiones útiles de GNOME como Dash-to-Dock, Tiling Assistant y más.",
        "scripts.remove.title": "Eliminar Apps Innecesarios",
        "scripts.remove.description": "Elimina aplicaciones preinstaladas innecesarias para limpiar tu sistema.",
        "scripts.apps.title": "Instalar Aplicaciones",
        "scripts.look":"Mejorar Apariencia (opcional)",
        "scripts.plus":"Adicionales",
        "scripts.apps.description": "Instala aplicaciones útiles via Flatpak incluyendo GIMP, Inkscape y más.",
        "scripts.radeon.title": "Radeon a AMDGPU",
        "scripts.radeon.description": "Cambia del controlador Radeon a AMDGPU para mejor rendimiento con ciertas GPUs AMD.",
        "scripts.fonts.title": "Instalar Fuentes",
        "scripts.fonts.description": "Instala y configura fuentes adicionales para mejor tipografía.",
        "scripts.wallpapers.title": "Instalar Fondos de Pantalla",
        "scripts.wallpapers.description": "Descarga y configura fondos de pantalla adicionales para tu escritorio.",
        "scripts.copy": "Copiar",
        "features.title": "Qué está Incluido",
        "features.packages.title": "Paquetes Esenciales",
        "features.packages.description": "Códecs, firmware, fuentes y utilidades para hacer tu sistema completamente funcional.",
        "features.customization.title": "Personalización",
        "features.customization.description": "Extensiones y ajustes para mejorar tu experiencia con el escritorio GNOME y XFCE.",
        "features.performance.title": "Rendimiento",
        "features.performance.description": "Optimizaciones de controladores y eliminación de bloat para un sistema más rápido.",
        "footer.text": "Scripts de Post-Instalación para Debian 12",
        "footer.text2": "Desarrollado por",
        "footer.disclaimer": "No afiliado al Proyecto Debian. Úsalo bajo tu propio riesgo.",
        "notification.copied": "¡Copiado al portapapeles!"
    },
    en: {
        "title": "Debian Post-Installation",
        "hero.title": "Optimize Your Debian Experience",
        "hero.subtitle": "A collection of scripts to customize and enhance your Debian Stable installation with essential apps, codecs, tweaks, and more.",
        "hero.download": "Download Debian",
        "hero.viewScripts": "View Scripts",
        "more.title": "Why use Debian ",
        "more.description": "The Debian 12 Bookworm is the latest stable version of the Debian Linux operating system, released in June 2023. It's known for its stability, broad support for desktop environments, and a vast collection of over 64,000 software packages.",
        "more.button": "More information",
        "about.title": "Why to Use the Scripts:",
        "about.description": "Despite Debian being very reliable, getting it ready for personal or work use can be cumbersome. These scripts help make simpler post-Installation with GNOME and XFCE. Everything will be done using the terminal; just copy and paste into the terminal.",
        "scripts.title": "Post-Installation Scripts",
        "scripts.one":"Install Scripts Individually",
        "scripts.complete.title": "Base Post-Installation for GNOME and XFCE (recommended)",
        "scripts.complete.description": "Activates the contrib and non-free repositories, installs Flatpak support with the Flathub repository, switches Firefox ESR to the current release version, installs multimedia codecs, firmware, fonts, and useful utilities, and removes unnecessary pre-installed applications to clean up your system.",
        "scripts.repos.title": "Activate Repositories",
        "scripts.repos.description": "Activate contrib and non-free repositories and install Flatpak support with Flathub.",
        "scripts.firefox.title": "Firefox Current",
        "scripts.firefox.description": "Change from Firefox ESR to the current release version.",
        "scripts.codecs.title": "Codecs & Tweaks",
        "scripts.codecs.description": "Install multimedia codecs, firmware, fonts, and useful utilities.",
        "scripts.extensions.title": "GNOME Extensions (GNOME)",
        "scripts.extensions.description": "Install useful GNOME extensions like Dash-to-Dock, Tiling Assistant, and more.",
        "scripts.remove.title": "Remove Unneeded Apps",
        "scripts.remove.description": "Remove unnecessary pre-installed applications to clean up your system.",
        "scripts.apps.title": "Install Apps",
        "scripts.look":"Improve Appearance (optional)",
        "scripts.plus":"additional",
        "scripts.apps.description": "Install useful applications via Flatpak including GIMP, Inkscape, and more.",
        "scripts.radeon.title": "Radeon to AMDGPU",
        "scripts.radeon.description": "Switch from Radeon to AMDGPU driver for better performance with certain AMD GPUs.",
        "scripts.fonts.title": "Install Fonts",
        "scripts.fonts.description": "Install and configure additional fonts for better typography.",
        "scripts.wallpapers.title": "Install Wallpapers",
        "scripts.wallpapers.description": "Download and set up additional wallpapers for your desktop.",
        "scripts.copy": "Copy",
        "features.title": "What's Included",
        "features.packages.title": "Essential Packages",
        "features.packages.description": "Codecs, firmware, fonts, and utilities to make your system fully functional.",
        "features.customization.title": "Customization",
        "features.customization.description": "Extensions and tweaks to enhance your GNOME or XFCE desktop experience.",
        "features.performance.title": "Performance",
        "features.performance.description": "Driver optimizations and bloat removal for a faster system.",
        "footer.text": "Debian 12 Post-Installation Scripts",
        "footer.text2": "Developed by",
        "footer.disclaimer": "Not affiliated with the Debian Project. Use at your own risk.",
        "notification.copied": "Copied to clipboard!"
    }
};

let currentLang = 'pt'; // Define a linguagem padrão

// Função para aplicar as traduções
function applyTranslations(lang) {
    console.log('Aplicando traduções para:', lang); // Debug

    if (!translations[lang]) {
        console.error('Idioma não encontrado:', lang);
        return;
    }

    // Seleciona todos os elementos com data-i18n
    const elements = document.querySelectorAll('[data-i18n]');
    console.log('Elementos encontrados:', elements.length); // Debug

    elements.forEach(element => {
        const key = element.getAttribute('data-i18n');

        if (translations[lang][key]) {
            // Trata diferentes tipos de elementos
            if (element.tagName === 'INPUT' && element.type === 'submit') {
                element.value = translations[lang][key];
            } else if (element.tagName === 'INPUT' && element.hasAttribute('placeholder')) {
                element.placeholder = translations[lang][key];
            } else {
                // Para elementos regulares, preserva HTML interno se necessário
                if (element.innerHTML.includes('<')) {
                    // Se tem HTML interno, substitui apenas o texto
                    const tempDiv = document.createElement('div');
                    tempDiv.innerHTML = element.innerHTML;

                    // Encontra o nó de texto principal
                    const textNode = tempDiv.firstChild;
                    if (textNode && textNode.nodeType === Node.TEXT_NODE) {
                        textNode.textContent = translations[lang][key];
                        element.innerHTML = tempDiv.innerHTML;
                    } else {
                        // Se não encontrar nó de texto, substitui tudo
                        element.textContent = translations[lang][key];
                    }
                } else {
                    element.textContent = translations[lang][key];
                }
            }
        } else {
            console.warn('Chave de tradução não encontrada:', key, 'para idioma:', lang);
        }
    });

    // Atualiza o atributo lang do HTML
    document.documentElement.lang = lang;
    currentLang = lang;

    console.log('Traduções aplicadas com sucesso para:', lang); // Debug
}

// Language switcher functionality
document.addEventListener('DOMContentLoaded', function () {
    console.log('DOM carregado, inicializando sistema de idiomas'); // Debug

    // Aplica as traduções iniciais
    applyTranslations(currentLang);

    const languageDropdownButton = document.getElementById('languageDropdownButton');
    const languageDropdown = document.getElementById('languageDropdown');

    if (!languageDropdownButton || !languageDropdown) {
        console.error('Elementos do dropdown não encontrados');
        return;
    }

    // Toggle dropdown
    languageDropdownButton.addEventListener('click', function (e) {
        e.preventDefault();
        languageDropdown.classList.toggle('hidden');
        console.log('Dropdown toggled'); // Debug
    });

    // Adiciona event listener para os links de idioma
    const languageLinks = document.querySelectorAll('#languageDropdown a[data-lang]');
    console.log('Links de idioma encontrados:', languageLinks.length); // Debug

    languageLinks.forEach(link => {
        link.addEventListener('click', function (event) {
            event.preventDefault();
            event.stopPropagation();

            const selectedLang = this.getAttribute('data-lang');
            console.log('Idioma selecionado:', selectedLang); // Debug

            if (selectedLang && selectedLang !== currentLang) {
                applyTranslations(selectedLang);

                // Feedback visual opcional
                this.style.backgroundColor = '#f3f4f6';
                setTimeout(() => {
                    this.style.backgroundColor = '';
                }, 200);
            }

            languageDropdown.classList.add('hidden');
        });
    });

    // Fecha dropdown ao clicar fora
    document.addEventListener('click', function (event) {
        if (!languageDropdownButton.contains(event.target) &&
            !languageDropdown.contains(event.target)) {
            languageDropdown.classList.add('hidden');
        }
    });

    console.log('Sistema de idiomas inicializado com sucesso');
});

// Copy to clipboard function (mantida como estava)
function copyToClipboard(id) {
    const preElement = document.getElementById(id);
    if (!preElement) {
        console.error('Elemento não encontrado:', id);
        return;
    }

    const textToCopy = preElement.textContent || preElement.innerText;

    navigator.clipboard.writeText(textToCopy).then(() => {
        const notification = document.getElementById('copyNotification');
        if (notification) {
            notification.classList.remove('hidden');
            setTimeout(() => {
                notification.classList.add('hidden');
            }, 2000);
        }
    }).catch(err => {
        console.error('Falha ao copiar texto:', err);

        // Fallback para navegadores mais antigos
        const textArea = document.createElement('textarea');
        textArea.value = textToCopy;
        document.body.appendChild(textArea);
        textArea.focus();
        textArea.select();

        try {
            document.execCommand('copy');
            const notification = document.getElementById('copyNotification');
            if (notification) {
                notification.classList.remove('hidden');
                setTimeout(() => {
                    notification.classList.add('hidden');
                }, 2000);
            }
        } catch (err) {
            console.error('Fallback de cópia também falhou:', err);
        }

        document.body.removeChild(textArea);
    });
}