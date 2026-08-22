# Day 16: Docker Custom Bridge Networks & Inter-Container DNS Communication

## 1. Overview & Architectural Problem
In standard Docker deployments, containers attached to the default `bridge` network lack automatic service discovery via container names. If a container restarts and its dynamically allocated IP changes, dependent microservices fail. 

Custom User-Defined Bridge networks solve this by injecting an embedded DNS resolver (`127.0.0.11`), allowing seamless container-to-container communication using container names (Hostnames).

---

## 2. Core Concepts Verified

| Architecture Feature | Default Bridge | Custom User-Defined Bridge |
| :--- | :--- | :--- |
| **DNS Resolution by Name** | Disabled (`bad address` error) | Enabled (via embedded DNS `127.0.0.11`) |
| **Network Isolation** | Low (all unassigned containers share it) | High (isolated virtual network switches) |
| **Dynamic Attach/Detach** | Requires container recreation | Supported via `docker network connect` |
| **Production Fit** | Dev/Testing only | Production Microservices Standard |

---

## 3. Practical Workflow Implemented

1. **Failure Demonstration:**
   * Deployed `c1-default` and `c2-default` on the default bridge.
   * Proved DNS failure when attempting `docker exec -it c1-default ping -c 2 c2-default`.

2. **Custom Bridge Network:**
   * Created network: `docker network create --driver bridge my-app-net`
   * Deployed `app-c1` and `app-c2` on `my-app-net`.
   * Verified DNS resolution by container name with **0% packet loss**.

3. **Network Isolation & Dynamic Attachment:**
   * Created isolated network `isolated-net` with `isolated-app`.
   * Confirmed network isolation failure across disjoint networks.
   * Dynamically attached `isolated-app` to `my-app-net` via `docker network connect`.
   * Verified live multi-network connectivity without container restarts.

4. **Two-Tier Microservice Inter-Communication:**
   * Deployed backend API container serving HTTP on port `5678`.
   * Queried internal endpoint from client container using `wget -qO- http://backend-api:5678`.

---

## 4. Production Commands Reference

```bash
# Create custom bridge network
docker network create --driver bridge <network-name>

# Run container in a custom network
docker run -d --name <name> --network <network-name> <image>

# Dynamically connect running container to network
docker network connect <network-name> <container-name>

# Inspect network subnet and IP allocations
docker network inspect <network-name>

# Cleanup custom network
docker network rm <network-name>
