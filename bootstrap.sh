#!/usr/bin/env bash

function log {
	echo "========== $1 =========="
}

function instalar_dependencias_taller {
	nombre=$1
	repo=$2
	dependencias_globales=$3

	log "Instalaremos ahora las dependencias del taller '$nombre'"

	if [[ -n "$dependencias_globales" ]]; then
		echo "Bajando dependencias globales (via npm)"
		npm install -g $dependencias_globales
	fi

	echo "Clonando repositorio base"
	git clone https://github.com/$repo /vagrant/proyectos/$repo
	ln -s /vagrant/$repo .
	cd ${repo#*/}

	echo "Instalando dependencias locales (via npm)"
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
	"anvk/babel-npm-module-example" \
	"cordova ionic"

instalar_dependencias_taller \
	"Creando sitios estáticos con HarpJS" \
	"mumuki/mumuki-teacher-tools" \
	"harp component"

instalar_dependencias_taller \
	"Functional Reactive Programming en Javascript" \
	"holden-caulfield/redux-workshop"