# SolaKube Andromeda

Sample Kubernetes cluster definition to be used with SolaKube.

A small, testing cluster that uses 3 Hetzner VMs, each having all cluster node roles (etcd, master, worker).

Deploys Hetzner Cloud integration components and prefers Hetzner Cloud Volumes for persistence.

The simple Postgres deployment (pgs) is used to provide central database services for other deployed applications.

Uses the "example.com" domain wich needs to be replaced with an actual domain if deployed on public infrastructure (as opposed to testing with Minikube)

See the SolaKube project docs for customization and actual use.  