Los scripts listados en este directorio:

# install-ansible.sh
install-terraform.sh

Instalan en un cliente linux, las herramientas de terraform y ansible requeridas para poder ejecutar las otras tareas dentro de este repositorio, creación de máquinas virtuales
y configuración con herramientas de agentes de instalación.

Pasos para ejecutar:

1.- Desde la raíz del repositorio entrar al directorio "Tools" :

cd Tools/

2.- Asignar los permisos de ejecución requerida:

chmod +x *.sh

3.- Ejecutar el archivo requerido:

./install-terraform.sh

4.- Verificar la versión instalada:

terrafrom –verison