# terraform-gcp-vm
---------------------


Crea una VM en GCP basada en CentOS Instala Jenkins por medio de un playbook de Ansible crea sharedlib que puede compilar maven
Crea un job que hace uso de este sharelib para compilar un proyecto java simple tipo “Hello World”


## Requerimientos

- Terraform versión v0.12.26.
- Cuenta en GCP.
- Crear una cuenta de servicios y crear una clave del tipo JSON. descargada y guardada en el proyecto
- Herramientas kubectl 

### Cuenta de Servicio 

- gcr: correspondiente al container registry GCP
- gke: Modulo de kubernetes engine GCP


## Modo de Uso

1. Descargue al raiz de este proyecto su archivo su archivo de clave JSON 
2. Ejecute el script con los siguientes parametros 

./start CREATE `credentials` `project_id` `gcp_region`

**Ejemplos:** 

Para crear cluster

_./start CREATE (archivo-del-proyecto1122 proyecto1122 us-central1)_
_./start CREATE core-catalyst-283702-30950e2a8fd2.json core-catalyst-283702 us-central1_

**Para destruir cluster 

_./start DESTROY_

Para ver su salida 

_./start OUTPUT http://Ip-del-Cluster_  (tendra una salida "Hello World")

_./start OUTPUT http://Ip-del-Cluster/square/2_ (tendrá como resultado el cuadrado del numero 2)

_./start OUTPUT http://Ip-del-Cluster/greetings_ (tendrá hello World + Hostname) 

## IMPORTANTE:
        Tenga presente los siguientes requerimientos. 
- Terraform versión v0.12.26.
- Cuenta en GCP.
- Crear una cuenta de servicios y crear una clave del tipo JSON. descargada y guardada en el proyecto
- Herramientas kubectl 

        Puede instalarlos metiante los script:
        sudo ./tf_Linux
        ./tf_MacOS


## Configuración

Los siguientes parámetros son los que se pueden usar en el flujo.

  *Todos son obligatorios*

Parámetro | Descripción
--------- | -----------
`project_id` | ID del proyecto en GCP
`gcp_region` | Region de GCP en la que se va a trabajar
`credentials` | Indica nombre del archivo .JSON de credenciales 
