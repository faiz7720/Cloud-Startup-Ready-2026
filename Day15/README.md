# Day 15: Docker Storage Architecture (Bind Mounts, Volumes, and Shared Storage)

## Technical Architecture & Implementations
1. **Bind Mounts & Hot Reloading:**
   - Mapped EC2 host directory (`$(pwd)/html`) to `/usr/share/nginx/html` on port `8081`.
   - Verified zero-downtime content synchronization directly from the host filesystem without rebuilding images.

2. **Read-Only Volume Hardening (`:ro`):**
   - Enforced immutable container mounts on port `8082` using `-v $(pwd)/html:/usr/share/nginx/html:ro`.
   - Blocked unauthorized in-container mutations (`sh: can't create ... Read-only file system`).

3. **Multi-Container Shared Named Volumes:**
   - Provisioned `shared_logs` volume shared across a producer and consumer container.
   - **Producer (`writer-app`):** Alpine container generating real-time timestamps to `/var/log/myapp/traffic.log`.
   - **Consumer (`reader-app`):** Nginx container mounting the same volume as read-only on port `8083` and serving log streams over HTTP.

## Key Docker Commands Logged
```bash
# Bind Mount with Port Ingress
docker run -d -p 8081:80 --name storage-container -v $(pwd)/html:/usr/share/nginx/html nginx:alpine

# Read-Only Security Mount
docker run -d -p 8082:80 --name readonly-container -v $(pwd)/html:/usr/share/nginx/html:ro nginx:alpine

# Shared Named Volume Pattern (Producer -> Consumer)
docker run -d --name writer-app -v shared_logs:/var/log/myapp alpine sh -c "while true; do date >> /var/log/myapp/traffic.log; sleep 2; done"
docker run -d --name reader-app -v shared_logs:/usr/share/nginx/html:ro -p 8083:80 nginx:alpine
