
resource "linode_lke_cluster" "my-cluster" {
  label       = "k8s-resume-challenge"
  k8s_version = "1.28"
  region      = "us-central"
  tags        = ["test"]

  pool {
    type  = "g6-standard-2"
    count = 1
  }
}
