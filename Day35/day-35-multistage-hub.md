## 📊 Task 1 & 2: Single-Stage vs. Multi-Stage Size Comparison

### Image Size Comparison Matrix

| Build Pattern | Base Image | Included Artifacts | Resulting Image Size |
|---|---|---|---|
| **Single-Stage** | `golang:1.21` | Full Go SDK, GCC compiler, source code, headers | **~840 MB** |
| **Multi-Stage** | `alpine:3.19` | Compiled binary artifact ONLY | **~15 MB** |

**Size Reduction:** Reduced image footprint by **>98%**!

### Why is the Multi-Stage image so much smaller?
In a single-stage build, all build-time tools (compilers, SDKs, build caches, git, system libraries) remain trapped inside the final image layers. 

With **Multi-Stage Builds**, stage 1 (`golang:1.21-alpine AS builder`) compiles the source code into a standalone binary. Stage 2 (`alpine:3.19`) discards the entire builder container and copies **only the final compiled executable** using `COPY --from=builder`.

---

## 🐋 Task 3 & 4: Docker Hub Deployment & Versioning

* **Public Repository Link:** [deepikasri647/go-web-app on Docker Hub](https://hub.docker.com/r/deepikasri647/go-web-app)

### Image Tagging & Versioning Best Practices
1. **Explicit Version Tags (`v1.0.0`, `v1.0.1`):** Immutable release tags ensure build predictability in production CI/CD pipelines.
2. **The `latest` Tag:** Automatically points to the newest build, but relying on `latest` in production manifests can cause unexpected breaking changes during container restarts.

---

## 🔒 Task 5: Production Container Security & Optimization Best Practices

1. **Use Minimal Base Images (`alpine`, `distroless`):** Replaced heavy Debian/Ubuntu base images with Alpine, drastically cutting down OS vulnerability exposure.
2. **Non-Root User Execution:** Added `RUN adduser` and enforced `USER appuser`. By default, Docker containers run as `root` (UID 0), which poses severe container-breakout security risks if compromised.
3. **Pin Base Image Tags:** Specified `alpine:3.19` instead of `alpine:latest` to ensure reproducible builds across different CI runners.
4. **Static Binary Compilation:** Built Go using `CGO_ENABLED=0` to create zero-dependency static binaries capable of running on minimal distros without system C libraries.
