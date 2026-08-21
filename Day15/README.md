# Day 15: Docker Storage Persistence & Bind Mounts

## Technical Architecture
- Mapped EC2 host directory (`$(pwd)/html`) to container internal web root (`/usr/share/nginx/html`) using `-v` bind mount flag.
- Deployed stateless `nginx:alpine` container binding ingress port `8081` to container port `80`.
- Verified hot-reloading capability: Modified host data on disk and observed instantaneous reflection inside the active container without container restart or image recompilation.

## Commands Executed
```bash
# 1. Provision Bind Mounted Container
docker run -d -p 8081:80 --name storage-container -v $(pwd)/html:/usr/share/nginx/html nginx:alpine

# 2. Verify Initial State
curl http://localhost:8081

# 3. Live Hot-Reload Test (Direct Host Write)
echo "<h1>Updated Directly From Host Disk!</h1>" > html/index.html
curl http://localhost:8081
