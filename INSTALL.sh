#RUN AS ADMIN OR ROOT
#ABOVE HOW TO INSTALL LOG AUDITING
cp ./audit_control /etc/security/audit_control 
cp ./syslog.conf /etc/syslog.conf 
cp ./com.send.audit.plist /Library/LaunchDaemons/com.send.audit.plist 
mkdir /usr/local/scripts
cp ./send_audit_log.sh /usr/local/scripts/send_audit_log.sh
chmod +x /usr/local/scripts/send_audit_log.sh
launchctl load /Library/LaunchDaemons/com.send.audit.plist
