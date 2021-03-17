# Lightweight Kubernetes (k3d/k3s) in Docker tutorial

## Notes
- If a cluster name is not specified, k3d will automatically set the cluster name to `k3d-k3s-default`.
- Run the `get_latest_release.sh` shell script to determine the latest k3s/k3d version and set the image parameter to the latest image version.
- Pre-requisites:
    - Docker

### Install and Configure environment
- Install latest k3d utility
    ```bash
    $ curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
    OR
    $ wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
    ```
- Get command line options
    ```bash
    $ k3d --help
    $ k3d [command] --help
    ```

### Creating clusters
After creating clusters, run the `kubectl cluster-info` and `kubectl get nodes` command to verify the status.
- [Quickstart] Create default cluster (Single node cluster)
    ```bash
    $ k3d cluster create
    ```

- Create cluster with custom name (Single node cluster)
    ```bash
    $ k3d cluster create <cluster_name>
    ```

- Create cluster with Single master and multiple Worker nodes
    ```bash
    $ k3d cluster create <cluster_name> --agents 2
    ```

- Create Highly available cluster with Multiple master nodes and multiple Worker nodes
    ```bash
    $ k3d cluster create <cluster_name> --servers 3 --agents 3
    ```

- Create cluster from a specific Kubernetes/k3s version
    ```bash
    $ k3d cluster create <cluster_name> --image rancher/k3s:<K3S_VERSION>
    e.g.
    $ k3d cluster create mycluster --image rancher/k3s:v1.20.4-k3s1
    ```

- Create cluster and expose API server on a custom port
    ```bash
    $ k3d cluster create <cluster_name> --api-port [PORT]
    e.g.
    $ k3d cluster create mycluster --api-port 6443
    ```

- Create cluster with no Load balancer
    ```bash
    $ k3d cluster create <cluster_name> --no-lb
    ```

- Verify the status after creating the cluster by running,
    ```bash
    $ k3d node list
    $ kubectl cluster-info
    $ kubectl get nodes
    ```

- Delete cluster
    ```bash
    $ k3d cluster delete
    $ k3d cluster delete <cluster_name>
    ```

### Scaling clusters
- Add new Worker nodes to cluster
    ```bash
    $ k3d node create <new_node_name> --role=agent --replicas N --cluster <cluster_name>
    $ k3d node create <new_node_name> --replicas N
    $ k3d node create <new_node_name> --role=agent --replicas 2
    $ k3d node create <new_node_name> --role=agent --replicas 2 --cluster mycluster
    ```

- Add new Master nodes to cluster
    ```bash
    $ k3d node create <node_name> --role=server  --replicas N
    $ k3d node create <node_name> --role=server  --replicas 2
    $ k3d node create <node_name> --role=server  --replicas 2
    ```

- Delete node
    ```bash
    $ k3d node delete <node_name>
    ```

### General commands
- List all k3d clusters
    ```bash
    $ k3d cluster list
    ```

- Get k3d/k3s version
    ```bash
    $ k3d version
    ```

### Clusters lifecycle
- Stop cluster
    ```bash
    $ k3d cluster stop
    $ k3d cluster stop <cluster_name>
    ```

- Start existing cluster
    ```bash
    $ k3d cluster start
    $ k3d cluster start <cluster_name>
    ```

# References
- [k3d](https://k3d.io/)
- [rancher/k3d](https://github.com/rancher/k3d)
- [Set up K3s in High Availability using k3d](https://rancher.com/blog/2020/set-up-k3s-high-availability-using-k3d)
- [[ Kube 80.5 ] Getting started with Rancher K3D v3.0.0](https://youtu.be/Hk9ehDjBZn4)
