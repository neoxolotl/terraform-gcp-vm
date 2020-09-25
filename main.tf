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

 boot_disk {
   initialize_params {
     image = "centos-7-v20200403"
   }
 }

// Make sure flask is installed on all new instances for later steps
 metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"

 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address
   }
 }
}
