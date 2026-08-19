# Day 14: Custom Dockerfile Architecture & Image Layering

## Technical Implementation
- Authored custom multi-layer `Dockerfile` utilizing lightweight `nginx:alpine` as the base image.
- Implemented static asset injection using the `COPY` instruction targeting the default web directory.
- Defined container port exposure metadata (`EXPOSE 80`) and default daemon startup directives via `CMD`.
- Built local immutable artifact tagged as `my-custom-nginx:v1`.
- Provisioned background container binding host port `9090` to container ingress `80`.
- Validated custom payload delivery via local socket curl probes.

## Key Commands
```bash
# 1. Build Custom Docker Image
docker build -t my-custom-nginx:v1 .

# 2. Deploy Container with Custom Port Mapping
docker run -d -p 9090:80 --name custom-web-app my-custom-nginx:v1

# 3. Inspect Process & Validate Payload
docker ps
curl http://localhost:9090

Verification & Output
Image Tag: my-custom-nginx:v1

Container Name: custom-web-app

Port Mapping: 0.0.0.0:9090 -> 80/tcp

HTTP Status: Verified custom HTML payload execution on port 9090.
