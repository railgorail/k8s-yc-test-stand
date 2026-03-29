[Русский](README.ru.md)

# k8s-yc-test-stand

Terraform on Yandex Cloud: VPC + subnet, one control-plane VM, two workers. SSH as `debian` with `~/.ssh/id_ed25519.pub`.

**Test / lab only.** Every node gets a public IP, so the cluster is directly reachable from the internet-convenient for quick experiments, wrong for production. There is no bastion, private-only workers, hardened network policy, or HA; treat it as disposable infrastructure.

**Requires:** Terraform, `yc`, and a service account id in `tf/export.sh` for `YC_TOKEN`.

```bash
cd tf
source export.sh    # set SA id in export.sh first

terraform init
terraform plan
terraform apply
```

Outputs: control plane and worker external IPs. `terraform destroy` to tear down.

Terraform lives in `tf/`. Change `image_id`, zone, or SSH path in `instances.tf` / `providers.tf` if needed.
