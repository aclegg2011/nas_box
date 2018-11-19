sudo apt-get install samba
sudo useradd -s /bin/true username
sudo smbpasswd -a username
sudo smbpasswd -L -e username
sudo smbpasswd -L -a username
sudo mkir /media/samba/NAS
sudo chmod 0777 /media/samba/NAS
sudo chown -R main_account:nas /media/samba
sudo usermod -a -G nas main_account
edit fstab and add NAS drive to mount /media/samba/NAS

sudo nano /etc/samba/smb.conf
[Movies]
;
path = /media/samba/NAS/Movies
browseable = yes
read only = yes
guest ok = no
create mask = 0644
directory mask = 0755
;
force user = nas
;
force group = nas

[NAS]
;
path = /media/samba/NAS
browseable = yes
writable = yes
guest ok = no
create mask = 0644
directory mask = 0755
;
force user = main_account
;
force group = nas


save and edit
sudo /etc/init.d/smbd restart
