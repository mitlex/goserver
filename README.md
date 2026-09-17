# Containerization and Lifecycle Management with Docker

Coursework exploring container fundamentals, custom image construction, storage persistence, isolated networking, debugging, and image registry distribution using the Docker CLI.

> **Note:** This project was built as part of Boot.dev's Back-End Development Path, following guided instruction.

## Overview

This project focused on containerizing applications, configuring runtime isolation, and managing container lifecycles from scratch:

```text
Source Code -> Dockerfile -> Container Image -> Docker Hub Registry -> Running Container
```

Docker isolates applications into lightweight containers sharing the host kernel, while registries facilitate reliable image distribution and deployment.

## Learning Outcomes

- **Containerization Fundamentals**
  - Explored the architectural differences between virtual machines and containers.
  - Managed container lifecycles: building, running, detaching, stopping, and cleaning up containers.
  - Interacted with live containers via interactive shells (`docker exec`, `-it`).

- **Data Persistence and Volumes**
  - Differentiated between ephemeral container writable layers and persistent storage.
  - Managed stateful applications (such as Ghost) using Docker volumes.
  - Inspected, persisted, and deleted volumes independently of container lifecycles.

- **Networking and Multi-Container Architecture**
  - Configured custom bridge networks for isolated container communication.
  - Connected a load balancer (Caddy) to internal application servers.
  - Used Docker's internal DNS to resolve inter-container traffic by container name.
  - Mapped host ports to container ports for external ingress.

- **Image Construction with Dockerfiles**
  - Wrote declarative `Dockerfile` recipes using directives like `FROM`, `COPY`, `RUN`, `ENV`, `WORKDIR`, and `CMD`.
  - Containerized both Python scripts and compiled Go servers.
  - Configured container runtime environments using environment variables.

- **Inspection, Debugging, and Monitoring**
  - Extracted runtime logs using `docker logs`.
  - Monitored real-time resource utilization via `docker stats` and process trees with `docker top`.
  - Applied runtime hardware constraints (memory and CPU limits) to containers.

- **Registry Distribution and Publishing**
  - Authenticated and published custom images to Docker Hub.
  - Managed image versions using semantic tags and the `latest` tag convention.
  - Pulled and ran images across clean environments.

## Implementation Highlights

- Containerized a custom Go HTTP server and a Python script using tailored Dockerfiles.
- Created custom user-defined bridge networks to route traffic from a load balancer to application instances.
- Attached persistent named volumes to maintain database and site data across container tear-downs.
- Diagnosed containerized network states using interactive tools like `netstat` inside running environments.
- Tagged and published release images to Docker Hub, verifying portability by pulling and running them locally.

## Technologies

| Technology | Purpose |
|---|---|
| Docker Engine | Container runtime and process isolation |
| Dockerfile | Declarative recipes for building container images |
| Docker Hub | Image registry and distribution |
| Linux / CLI | Shell execution, process signals, and network inspection |
| Git | Version control |

## Key Concepts

### Containers vs. Virtual Machines

Virtual machines emulate physical hardware and run full guest operating systems on top of a hypervisor. Containers share the host system's Linux kernel and isolate processes using namespaces and control groups (cgroups), resulting in lower overhead, smaller footprint, and faster startup times.

```text
Virtual Machine:   [ App ] -> [ Guest OS ] -> [ Hypervisor ] -> [ Host OS / Hardware ]
Docker Container:  [ App ] -> [ Container Runtime ] -> [ Shared Host Kernel ]
```

### Ephemeral Storage vs. Persistent Volumes

Containers are designed to be disposable. Any changes written to a container's default writable layer are lost when the container is removed. Named volumes decouple storage from the container lifecycle, ensuring stateful data survives restarts and removals.

### Internal DNS and Custom Networks

On Docker's default bridge network, containers can only reach each other by IP address. By creating a custom user-defined network, Docker provides embedded DNS resolution, allowing containers to discover and communicate with each other using their container names.

## Repository Context

This is not intended to be a standalone production application. It documents hands-on containerization and DevOps infrastructure work completed through Boot.dev coursework, including Docker CLI operations, volume persistence, network topology, and image publishing.

## Acknowledgments

Built as part of Boot.dev's [Back-End Development Path](https://www.boot.dev/tracks/backend), specifically the [Learn Docker](https://www.boot.dev/courses/learn-docker) course.

Thank you to the authors at Boot.dev for this course.