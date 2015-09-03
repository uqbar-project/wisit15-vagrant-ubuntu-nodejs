# wisit15-vagrant-ubuntu-nodejs
> Box de Vagrant necesaria para los talleres de JS que serán dictados en el WISIT15

### Instalación
Los únicos prerrequisitos son:
* Vagrant, que puede descargarse de https://www.vagrantup.com/downloads.html
* y VirtualBox, que puede ser descargarse de https://www.virtualbox.org/wiki/Downloads

Asumiendo que ambas cosas fueron instaladas, ejecutar los siguientes comandos en una terminal:
```
git clone https://github.com/uqbar-project/wisit15-vagrant-ubuntu-nodejs
cd wisit15-vagrant-ubuntu-nodejs
vagrant up
```

Luego de bajar unas cuantas dependencias de internet, la VM quedará configurada y los proyectos de los distintos talleres estarán dentro de la carpeta `proyectos`

### Configuración por taller
[Functional Reactive Programming en Javascript](https://github.com/holden-caulfield/redux-workshop)
