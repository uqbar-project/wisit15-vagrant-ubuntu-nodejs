#!/usr/bin/env bash

function log {
	echo "========== $1 =========="
}

function instalar_dependencias_taller {
	nombre=$1
	repo_slug=$2
	dependencias_globales=$3

	log "Instalaremos ahora las dependencias del taller '$nombre'"

	if [[ -n "$dependencias_globales" ]]; then
		echo "Bajando dependencias globales (via npm)"
		npm install -g $dependencias_globales
	fi

	echo "Clonando repositorio base"
	repo=${repo_slug#*/}
	git clone https://github.com/$repo_slug /vagrant/proyectos/$repo
	ln -s /vagrant/proyectos/$repo .
	cd $repo

	echo "Instalando dependencias locales (via npm)"
	npm install
	cd ..
}

log "Descargando prerrequisitos del sistema"
sudo apt-get update
sudo apt-get install -y git vim wget curl
sudo dpkg -i /vagrant/pkg/atom-amd64.deb

log "Instalando NodeJS (via nvm)"
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh  | bash
export NVM_DIR="$HOME/.nvm"
. "$NVM_DIR/nvm.sh"
nvm install 0.12.7
nvm alias default 0.12.7

instalar_dependencias_taller \
	"Functional Reactive Programming en Javascript" \
	"holden-caulfield/redux-workshop"