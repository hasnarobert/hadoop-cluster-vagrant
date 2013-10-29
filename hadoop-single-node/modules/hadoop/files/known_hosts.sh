ssh-keyscan -H 192.168.1.10 >> /root/.ssh/known_hosts
ssh-keyscan -H master >> /root/.ssh/known_hosts
ssh-keyscan -H localhost >> /root/.ssh/known_hosts
ssh-keyscan -H 127.0.0.1 >> /root/.ssh/known_hosts
