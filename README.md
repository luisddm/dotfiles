# Entorno de desarrollo para Python y Node en Ubuntu 20.04 (focal fossa)

## Instalar utilidades

Instalamos silversearcher

```shell=bash
sudo apt install silversearcher-ag
```

Instalamos algunas fuentes

```shell=bash
sudo apt install font-roboto ttf-mscorefonts-installer
```

## Instalar fuentes con iconos

Instalamos alguna fuente del catálogo de [NerdFonts](https://www.nerdfonts.com) y configurar la terminal para que la use.

## Instalar versiones antiguas de Python

Ubuntu 20.04 viene por defecto únicamente con Python 3.8. Si necesitamos versiones anteriores, podemos usar el [PPA de deadsnakes](https://launchpad.net/~deadsnakes/+archive/ubuntu/ppa).

```shell=bash
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
```

Después podremos instalar, por ejemplo, Python 3.7 (y otras inferiores):

```shell=bash
sudo apt install python3.7
```

## Powerline prompt

Configuraremos nuestro prompt con Powerline, que nos mostrará en todo momento el entorno virtual y la rama de git en los que estamos.

Ver documentación [aquí](https://powerline.readthedocs.io). Más info sobre Powerline [aquí](https://devpro.media/install-powerline-ubuntu/#install-powerline).

Instalamos Powerline:

```shell=bash
sudo apt install powerline
```

Agregamos las siguientes líneas al .bashrc:

```shell=bash
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    source /usr/share/powerline/bindings/bash/powerline.sh
fi
```

Reiniciar la shell o recargar

```shell=bash
source ~/.bashrc
```

## Vim/Neovim

Instalamos vim:

```shell=bash
sudo apt install vim
```

Siguiendo el [manual de Vundle](https://github.com/VundleVim/Vundle.vim) nos clonamos su repo en un directorio oculto de nuestro HOME.

```shell=bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Nos aseguramos de tener un .vimrc en nuestro $HOME con el listado de plugins.

Instalamos los plugins:

```shell=bash
vim +PluginInstall +qall
```

### Usar misma config para Neovim

Instalamos Neovim:

```shell=bash
sudo apt install neovim
```

Creamos el archivo `~/.config/nvim/init.vim` con el siguiente contenido:

```shell=bash
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
```

Detalles [aquí](https://vi.stackexchange.com/questions/12794/how-to-share-config-between-vim-and-neovim)

### Ejecutar Neovim por defecto

Si queremos arrancar Neovim cuando ejecutemos `vi` o `vim`, lo configuramos mediante estos dos comandos, que nos pedirán qué seleccionemos una opción.

```shell=bash
sudo update-alternatives --config vi
sudo update-alternatives --config vim
```

### Seleccionar editor predeterminado del sistema

Cuando el sistema tenga que mostrarnos un archivo para editar (por ejemplo, tras un `git commit --amend`), se lanzará el editor que indiquemos al ejecutar esto.

```shell
sudo update-alternatives --config editor
```

### Soporte de python en nvim

Necesario para el plugin Jedi.

```shell=bash
sudo pip3 install neovim
```

### Comprobar salud de Neovim

```shell=bash
nvim +checkhealth
```

## virtualenvwrapper

```shell=bash
sudo apt install python3-pip
sudo pip3 install virtualenv virtualenvwrapper
```

Agregamos lo siguiente al archivo `.bashrc`:

```shell=bash
# virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export VIRTUALENVWRAPPER_LOG_DIR=~/.virtualenv
    export VIRTUALENVWRAPPER_HOOK_DIR=~/.virtualenv
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
    source /usr/local/bin/virtualenvwrapper.sh
fi
```

## tmux

Instalamos tmux

```shell=bash
sudo apt install tmux
```

## tmate

Instalamos tmate

```shell=bash
sudo apt install tmate
```
