# AWX Operated

To install awx crds

Check the latest version here [](https://github.com/ansible/awx-operator/releases)

replace the version in the VERSION_TAG variable of install-awx-crds.sh

Run the script to create awx resource you need

```bash
cd awx
```

```bash
kubectl apply -k overlays/crds
```

```bash
kubectl apply -k overylays/operator
```

```bash
kubectl apply -k overlays/awx
```

```bash
kubectl apply -k overlays/backup
```

```bash
kubectl apply -k overlays/restore
```

You can also execute the script to create directly from the helm chart

```bash
./install-awx-crds.sh
```
