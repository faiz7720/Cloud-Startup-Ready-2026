# Docker Operations Cheatsheet

| Command | Purpose |
| :--- | :--- |
| `docker run -d -p <Host>:<Container> --name <Name> <Image>` | Run container in background with port mapping |
| `docker ps` | List all running containers |
| `docker ps -a` | List all containers (running + stopped) |
| `docker stop <Container_ID/Name>` | Gracefully stop a running container |
| `docker rm -f <Container_ID/Name>` | Force remove a container |
| `docker logs <Container_ID/Name>` | View container runtime logs |
| `docker inspect <Container_ID/Name>` | Low-level JSON details of container |
| `docker system prune -a` | Clean unused containers, networks, and images |
