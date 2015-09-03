# wisit15-vagrant-ubuntu-nodejs
> Box de Vagrant necesaria para los talleres de JS que serán dictados en el WISIT15

## Instalación
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

## Uso de la VM
La idea es que la VM resuelva todas las dependencias de instalación y que el editor de texto o IDE se corra desde el host, ya que los archivos que se modifiquen serán automáticamente actualizados en la VM.

Sin embargo, es necesario acceder a la VM para correr algunos comandos (como `npm start`). Esto se logra ejecutando `vagrant ssh` en la terminal que teníamos abierta.

## Configuración por taller

### Functional Reactive Programming en Javascript

Lo primero que hay que hacer es levantar el servidor, lo cual se logra de la siguiente manera:

```
vagrant ssh
cd redux-workshop
npm start
```

Una vez hecho eso (y sin cerrar la consola), se puede ver la aplicación en [http://localhost:3000](http://localhost:3000)
