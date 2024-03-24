# Source code for [kubernetes-resume-challenge](https://cloudresumechallenge.dev/docs/extensions/kubernetes-challenge/)

# Install devcontainer

Devcontainer allows you to develop in an isolated container with all required software pre-installed. I strongly recommand setting up devcontainer before you start the subsequent steps. 

<details>
  <summary><i>How to set up a devcontainer?</i></summary>

1. Ensure Docker is installed and running
1. Install [vscode](https://code.visualstudio.com/) and `Dev Containers` extension
1. Open this project in vscode
1. Launch `Command Palette` from the UI or run `⌘ + Shift + P` if you are on Mac
1. Select either `Reopen in Container` or `Rebuild Container` to start the Devcontainer
1. Start terminal in vscode before you run the subsequent steps
</details>



# Install sealed-secrets

```

```

# Create sealed-secrets

```
# Create local secret file
kubectl create secret generic db-secrets \
  --from-literal=MYSQL_DATABASE=ecomdb \
  --from-literal=MYSQL_PASSWORD=test \
  --from-literal=MYSQL_ROOT_PASSWORD=test \
  --from-literal=MYSQL_USER=myuser --dry-run=client -o yaml > /tmp/db-secrets.yaml

# Install sealed-secrets
helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets
helm install sealed-secrets -n kube-system --set-string fullnameOverride=sealed-secrets-controller sealed-secrets/sealed-secrets

# Seal secrets
kubeseal < /tmp/db-secrets.yaml > ../kube/db-secrets.yaml -o yaml
```