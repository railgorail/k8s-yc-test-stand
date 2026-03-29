[English](README.md)

# k8s-yc-test-stand

Terraform в Yandex Cloud: VPC + подсеть, одна ВМ control plane, два воркера. SSH под пользователем `debian` с ключом `~/.ssh/id_ed25519.pub`.

**Только для тестов.** У каждой ноды свой публичный IP, кластер доступен из интернета напрямую - удобно для быстрых экспериментов, не подходит для продакшена. Нет bastion, воркеров только во внутренней сети, жёсткой сетевой политики и отказоустойчивости; 

**Для запуска необходимо:** Terraform, `yc`, и id сервисного аккаунта в `tf/export.sh` для `YC_TOKEN`.

```bash
cd tf
source export.sh    # сначала укажите id SA в export.sh

terraform init
terraform plan
terraform apply
```

Выходы: внешние IP control plane и воркеров. Снести всё: `terraform destroy`.

Код Terraform в `tf/`. При необходимости поменяйте `image_id`, зону или путь к SSH в `instances.tf` / `providers.tf`.
