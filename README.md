# testing-environments
Code to create, manage, and deploy testing environments using Terraform and Ansible. This includes environments for Kubernetes clusters, malware analysis, and threat hunting.

- **kubernetes-env** = local Kubernetes cluster deployed using on a Proxmox server using Terraform, Ansible, and kubectl.
- **malware-analysis-env** = automates the creation of a malware analysis environment using Terraform. Environment includes a FLARE-VM and REMnux machine for analysis, and a Apache Guacamole machine to remotely connect to these two machines.
