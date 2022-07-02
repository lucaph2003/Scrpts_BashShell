#!/bin/bash
# El script se usa para configurar la dirección IP de la tarjeta de red
 # Primera parte: configuraciones variables
ETH=$(ifconfig | grep "^eth" | awk '{print$1}')
MAC=$(ifconfig | grep "^eth" | awk  '{print$5}')
 IP = 192.168.1.16
 GW = 192.168.1.1
 
 # Segunda parte: escribir en el archivo de configuración
echo 'DEVICE='$ETH'
HWADDR='$MAC'
TYPE='Ethernet'
BOOTPROTO='static'
IPADDR='$IP'
PREFIX=/24
GATEWAY='$GW''>/etc/sysconfig/network-scripts/ifcfg-$ETH
 
 #Parte 3: Iniciar el servicio
ifdown $ETH
ifup $ETH
service network restart