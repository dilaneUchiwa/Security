# **SERVER RULE**
This is a set of procedure to enhance security of a server against attach , it donne de following actions
- ## change default ssh port  to 43951
- ## install and configure fail2ban tool to proctect aigainst brute fore attack
- ## set iptable rules for traffic filter

# **STEPS**
- uncommented line with **port** in /etc/ssh/ssh_config, set value 43951 and run **sudo systemctl restart sshd.service**
- Copy security folder in **/etc/security**
- Enter in **/etc/security** folder
- RUN **run.sh** in sudo mode : sudo chmod u+x run.sh && sudo ./run.sh
