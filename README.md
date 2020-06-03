# Entorno de desarrollo para Python y Node en Ubuntu 20.04 (focal fossa)

## Instalar utilidades

Instalamos silversearcher, que es un buscador recursivo de texto dentro de los archivos de un directorio y sus subdirectorios.

```shell
sudo apt install silversearcher-ag curl tldr fzf
```

Instalamos algunas fuentes:

```shell
sudo apt install font-roboto ttf-mscorefonts-installer
```

## Instalar fuentes parcheadas con iconos

Instalamos alguna fuente del catálogo de [NerdFonts](https://www.nerdfonts.com) y configurar la terminal para que la use. Por ejemplo, para instalar la fuente Hack parcheada:

```shell
git clone git@github.com:ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh Hack
```

Ver documentación [aquí](https://github.com/ryanoasis/nerd-fonts).

## Instalar versiones antiguas de Python

Ubuntu 20.04 viene por defecto únicamente con Python 3.8. Si necesitamos versiones anteriores, podemos usar el [PPA de deadsnakes](https://launchpad.net/~deadsnakes/+archive/ubuntu/ppa).

```shell
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
```

Después podremos instalar, por ejemplo, Python 3.7 (y otras inferiores):

```shell
sudo apt install python3.7
```

## Powerline prompt

Configuraremos nuestro prompt con Powerline, que nos mostrará en todo momento el entorno virtual y la rama de Git en los que estamos.

Instalamos Powerline:

```shell
sudo apt install powerline
```

Agregamos las siguientes líneas al .bashrc:

```shell
# powerline
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    source /usr/share/powerline/bindings/bash/powerline.sh
fi
```

Abrimos una nueva shell o recargamos el `.bashrc` con este comando:

```shell
source ~/.bashrc
```

Ver documentación [aquí](https://powerline.readthedocs.io). Más info sobre Powerline [aquí](https://devpro.media/install-powerline-ubuntu/#install-powerline).

## Vim/Neovim

- **Instalar Vim**

```shell
sudo apt install vim
```

Siguiendo el [manual de Vundle](https://github.com/VundleVim/Vundle.vim) nos clonamos su repo en un directorio oculto de nuestro HOME.

```shell
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Copiamos el archivo [.vimrc](.vimrc) a nuestro directorio `$HOME`.

Instalamos los plugins:

```shell
vim +PluginInstall +qall
```

- **Instalar Neovim**

```shell
sudo apt install neovim
```

Neovim usará la misma configuración y mismos plugins que Vim si copiamos el [init.vim](.config/nvim/init.vim) al directorio `~/.config/nvim`.

Más detalles [aquí](https://vi.stackexchange.com/questions/12794/how-to-share-config-between-vim-and-neovim).

- **Usar Neovim por defecto**

Si queremos arrancar Neovim cuando ejecutemos `vi` o `vim`, lo configuramos mediante estos dos comandos, que nos pedirán qué seleccionemos una opción. De otro modo, tendremos que arrancarlo con el comando `nvim`.

```shell
sudo update-alternatives --config vi
sudo update-alternatives --config vim
```

- **Seleccionar editor predeterminado del sistema**

Cuando el sistema tenga que mostrarnos un archivo para editar (por ejemplo, tras un `git commit --amend`), se lanzará el editor que indiquemos al ejecutar esto.

```shell
sudo update-alternatives --config editor
```

- **Soporte de Python en Neovim**

Necesario para el plugin Jedi.

```shell
sudo pip3 install neovim
```

- **Comprobar salud de Neovim**

```shell
nvim +checkhealth
```

## virtualenvwrapper

Instalamos `pip`, y lo usamos a su vez para instalar `virtualenv` y `virtualenvwrapper`. Esto nos permitirá tener diferentes entornos virtuales para nuestros proyectos.

```shell
sudo apt install python3-pip
sudo pip3 install virtualenv virtualenvwrapper
```

Agregamos lo siguiente al archivo `.bashrc`:

```shell
# virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export VIRTUALENVWRAPPER_LOG_DIR=~/.virtualenv
    export VIRTUALENVWRAPPER_HOOK_DIR=~/.virtualenv
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
    source /usr/local/bin/virtualenvwrapper.sh
fi
```

De este modo cargaremos los comandos necesarios para operar con nuestos entornos virtuales.

Ver documentación [aquí](https://virtualenvwrapper.readthedocs.io).

## Node

Instalamos nvm para poder instalar varias versiones de Node simultaneamente:

```shell
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
```

Este script añadirá al `.bashrc` las líneas necesarias para ser cargado al iniciar la shell. Por tanto, para activarlo abrimos una nueva shell o recargamos el `.bashrc` con este comando:

```shell
source ~/.bashrc
```

Instalamos la última versión de Node:

```shell
nvm install node
```

Ver documentación [aquí](https://github.com/nvm-sh/nvm).

## tmux

Instalamos tmux

```shell
sudo apt install tmux
```

Más info sobre cómo personalizar tmux [aquí](https://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf/).

## tmate

Instalamos tmate

```shell
sudo apt install tmate
```

## TODO

https://github.com/zaiste/tmuxified
https://github.com/ndyakov/pimux