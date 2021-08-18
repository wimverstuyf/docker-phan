# Docker Phan

> Docker container to run Phan in CI

# Add to Docker hub

```
docker build -f php8.0/Dockerfile -t wimverstuyf/phan:8.0 .
docker run wimverstuyf/phan:8.0
docker login
docker push wimverstuyf/phan:8.0
```
