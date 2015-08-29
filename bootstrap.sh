#!/usr/bin/env bash

function log {
	echo "========== $1 =========="
}

function instalar_dependencias_taller {
	log "Instalaremos ahora las dependencias del taller '$1'"

	echo "Bajando dependencias globales (via npm)"
	npm install -g $2

	echo "Clonando repositorio base"
	git clone https://github.com/$3 /vagrant/$3
	ln -s /vagrant/$3 .
	cd ${3#*/}

	echo "Instalando dependencias locales (via npm/bower)"
	npm install
}

log "Descargando prerrequisitos del sistema"
sudo apt-get update
sudo apt-get install -y git vim wget curl

log "Instalando NodeJS (via nvm)"
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh  | bash
export NVM_DIR="$HOME/.nvm"
. "$NVM_DIR/nvm.sh"
nvm install 0.12.7
nvm alias default 0.12.7

instalar_dependencias_taller \
	"Desarrollo web mobile con Ionic Framework" \
	"cordova ionic" \
	"anvk/babel-npm-module-example"

instalar_dependencias_taller \
	"Creando sitios estáticos con HarpJS" \
	"harp component" \
	"anvk/babel-npm-module-example"