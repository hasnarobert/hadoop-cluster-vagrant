vagrant ssh master -c "sudo /script/known_hosts.sh"
vagrant ssh backup -c "sudo /script/known_hosts.sh"
vagrant ssh hadoop1 -c "sudo /script/known_hosts.sh"
vagrant ssh hadoop2 -c "sudo /script/known_hosts.sh"
vagrant ssh hadoop3 -c "sudo /script/known_hosts.sh"
vagrant ssh master -c "sudo /opt/hadoop-1.2.1/bin/hadoop namenode -format"
vagrant ssh master -c "sudo /opt/hadoop-1.2.1/bin/start-all.sh"
