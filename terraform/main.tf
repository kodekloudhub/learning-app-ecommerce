
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

resource "local_file" "kubeconfig" {
  filename = "/home/vscode/.kube/config"
  content  = base64decode(linode_lke_cluster.my-cluster.kubeconfig)
}
