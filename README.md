Hadoop cluster (vagrant)
======================

### Description

A vagrant workspace containing a 5 node hadoop cluster with the following configuration:
* One node for for NameNode and JobTracker (master)
* One node as a backup for master
* Three nodes for DataNode and TaskTracker

Technical specification for the virtual machines:
* RAM: 384MB
* CPU: 1 core
* Storage: 80GB dynamic
* Virtualisation: VirtualBox


### Setup

Prerequisites:
* Virtual box: https://www.virtualbox.org/
* Vagrant: http://www.vagrantup.com/


```
git clone git@github.com:hasnarobert/hadoop-cluster-vagrant.git
cd hadoop-cluster-vagrant
vagrant up # It will take a while
./finish-setup.sh
```
This will start the hadoop cluster. You can see the status page at: http://192.168.1.10:50070/dfshealth.jsp

To work with the cluster ```vagrant ssh master``` to get a ssh session inside the master virtual machine. The hadoop distribution is located at ```/opt/hadoop-1.2.1/```.
