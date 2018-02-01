#!/bin/bash
# Nome: Vinicius Ormenesse
# Contato: vinicius.ormenesse@gmail.com
# Data: 16-08-2017
# Script desenvolvido para enviar logs de auditoria para servidor Syslog
# O funcionamento do script depende da configuracao do arquivo:
# /etc/security/audit_control
# Assim como a criacao de um servico automatico de boot no ambiente OS X

praudit -l /dev/auditpipe | sed 1d | \
while read line ; 
do
  #echo "$line"
  #Envia em formato de log para servidor
  if [[ ! $line == *"mac_syscall"* ]]; then
    syslog -s -r <YOUR SIEM IP HERE> "macosx_audit: $line"
  fi
done

