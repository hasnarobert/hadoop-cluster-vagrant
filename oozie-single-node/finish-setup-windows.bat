vagrant ssh master -c "sudo /script/known_hosts.sh"
vagrant ssh master -c "sudo /opt/hadoop-1.2.1/bin/hadoop namenode -format"
vagrant ssh master -c "sudo /opt/hadoop-1.2.1/bin/start-all.sh"
