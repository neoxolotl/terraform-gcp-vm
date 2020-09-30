//check folder instance isn't use 
// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 8
}
//centos-7-v20200403
// A single Compute Engine instance
resource "google_compute_instance" "default" {
 name         = "centos-7-${random_id.instance_id.hex}"
 machine_type = "f1-micro"
 zone         = "us-west1-a"
 //default_user_name = "${var.default_user_name}"

 boot_disk {
   initialize_params {
     image = "centos-7-v20200403"
   }
 }

// Make sure 
//metadata_startup_script="sudo yum update -y && sudo yum install yum-utils device-mapper-persistent-data lvm2 -y && sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo -y && sudo yum install docker-ce -y && sudo systemctl start docker && sudo systemctl enable docker && sudo systemctl status docker && sudo docker -v "
//metadata_startup_script="yum check-update -y && yum install -y && yum-utils device-mapper-persistent-data lvm2 && yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && yum install docker -y && systemctl start docker && systemctl enable docker"

//metadata_startup_script=file("startup.sh")
metadata_startup_script = "yum update -y && yum install -y yum-utils device-mapper-persistent-data lvm2 wget ansible unzip git && yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && yum makecache fast && yum -y install docker-ce && systemctl stop firewalld && systemctl disable firewalld && gpasswd -a ${var.default_user_name} docker && systemctl start docker && systemctl enable docker && curl -L https://github.com/docker/compose/releases/download/1.25.5/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose && curl -L https://github.com/docker/machine/releases/download/v0.16.2/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine && chmod +x /tmp/docker-machine && cp /tmp/docker-machine /usr/local/bin/docker-machine && export PATH=$PATH:/usr/local/bin/ && systemctl restart docker && curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl && setsebool -P httpd_can_network_connect 1 && mkfs.ext4 -m 0 -F -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/sdb && mkdir -p /data && mount -o discard,defaults /dev/sdb /data && chmod a+w /data && cp /etc/fstab /etc/fstab.backup && echo UUID=`sudo blkid -s UUID -o value /dev/sdb` /data ext4 discard,defaults,nofail 0 2 |sudo tee -a /etc/fstab && systemctl stop docker && tar -zcC /var/lib docker > /data/var_lib_docker-backup-$(date +%s).tar.gz && mv /var/lib/docker /data/ && ln -s /data/docker/ /var/lib/ && systemctl start docker && curl -LO --retry 3 https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip && unzip terraform_0.12.26_linux_amd64.zip && chmod +x ./terraform && mv terraform /usr/local/bin/ && wget https://copr.fedorainfracloud.org/coprs/g/ansible-service-broker/ansible-service-broker-latest/repo/epel-7/group_ansible-service-broker-ansible-service-broker-latest-epel-7.repo -O /etc/yum.repos.d/ansible-service-broker.repo && yum -y install apb && docker run -d --name=rancher --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher && rpm -i https://rpm.rancher.io/k3s-selinux-0.1.1-rc1.el7.noarch.rpm"

/*
testinfra

yum install molecule python-jenkins testinfra -y



yum install epel-release -y
yum install python-pip -y
pip install --upgrade pip
pip install testinfra 
*/



//for install compose 
//"&& yum install docker-compose -y && curl -sSL https://raw.githubusercontent.com/bitnami/bitnami-docker-jenkins/master/docker-compose.yml > docker-compose.yml && sudo docker-compose up -d "




/*
#Executing the Docker Command Without Sudo
#sudo usermod -aG docker $USER
logout
login
docker ps
*/



 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address
   }
 }
}
