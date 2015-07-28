Packer Taller de Integracion Continua
==========

## Descripción

Script para generar una máquina Virtual Box con algunas herramientas para el Taller de Integración Continua de Kleer.

## Requerimientos

- Ruby 2.+

## Cómo generar la máquina Virtual?

### Paso 1: Descargar módulos externos para el provisionamiento
	$ gem install librarian-puppet
    $ librarian-puppet install --path provisioning/modules-vendor

### Paso 2: Generar la máquina virtual

Puedes generar la máquina virtual de 2 maneras diferentes: Vagrant o Packer

#### Generar la máquina con vagrant (instalar previamente Vagrant)
	$ vagrant up

#### Generar la máquina con Packer (instalar previamente Packer)
	$ packer build ubuntu-server.json

## Qué contiene?
- JDK
- Jenkins (Host: localhost:8686, guest: localhost:8080)
- Gilab (Host: localhost:8787, guest: localhost:80)

## Development

Instalar puppet:

	https://docs.puppetlabs.com/guides/install_puppet/pre_install.html

Verificar la sintaxis de puppet

	$ puppet parser validate provisioning/manifests/init.pp

Mostrar las acciones del provisionamiento pero sin ejecutarlas

	$ cd provisioning
	$ puppet apply manifests/init.pp –-noop --modulepath=modules-vendor 

Reprosionar con vagrant luego del primer "vagrant up"

	$ vagrant provision

Verificar el template de packer

	$ packer validate ubuntu-server.json