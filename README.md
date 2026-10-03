# GraalVM Extended Docker Images

![GraalVM](https://img.shields.io/badge/GraalVM-Ready-orange)

| Repository | Link |
|-------------|------|
| GitHub | https://github.com/tackleza/docker-graalvm-ext |
| Docker Hub | https://hub.docker.com/r/tackleza/graalvm-ext |

Docker images for Oracle GraalVM Community Edition on AlmaLinux 9, with additional development tools pre-installed.

**Docker Hub:** https://hub.docker.com/r/tackleza/graalvm-ext

Built on top of [`tackleza/graalvm`](https://hub.docker.com/r/tackleza/graalvm).

## Available Tags

| Tag | Description |
|-----|-------------|
| `25-almalinux` | GraalVM 25 (JDK 25) on AlmaLinux 9 |
| `24-almalinux` | GraalVM 24 (JDK 24) on AlmaLinux 9 |
| `21-almalinux` | GraalVM 21 (JDK 21) on AlmaLinux 9 |
| `17-almalinux` | GraalVM 17 (JDK 17) on AlmaLinux 9 |
| `latest` | Alias for `25-almalinux` |

## Included Tools

In addition to GraalVM:

- **Node.js 22** — via [nodesource](https://github.com/nodesource/distributions)
- **TypeScript** — globally available via `npx`

## Usage

### Check Java Version

```bash
docker run -it tackleza/graalvm-ext:25-almalinux
```

```
openjdk version "25" 2026-01-21
OpenJDK Runtime Environment GraalVM CE 25.0.2 (build 25.0.2-jvmci-b02)
Java HotSpot(TM) 64-Bit Server VM GraalVM CE 25.0.2 (build 25.0.2-jvmci-b02, mixed mode, sharing)
```

### Check Node.js Version

```bash
docker run -it tackleza/graalvm-ext:25-almalinux node -v
```

```
v22.14.0
```

### Interactive Shell

```bash
docker run -it tackleza/graalvm-ext:25-almalinux bash
```

### Run a Command

```bash
docker run -it tackleza/graalvm-ext:25-almalinux bash -c "java -version && node -v"
```

## Timezone

All supported tags include timezone data (`tzdata`) and default to **UTC**.
Set the `TZ` environment variable to a valid IANA timezone name to select another
zone. For Thailand, use `Asia/Bangkok` (UTC+07:00).

### Docker example: Bangkok / Thailand

```bash
docker run --rm -e TZ=Asia/Bangkok tackleza/graalvm-ext:25-almalinux date
```

### Docker Compose example

```yaml
services:
  app:
    image: tackleza/graalvm-ext:25-almalinux
    environment:
      TZ: Asia/Bangkok
    command: ["date"]
```

`TZ` sets the default timezone for OS tools and Java. An explicit Java option such
as `-Duser.timezone=UTC` overrides the JVM default; application-specific timezone
settings may also override it. Recreate the container after changing its `TZ`
environment variable.

## Example Tags

### GraalVM 24

```bash
docker run -it tackleza/graalvm-ext:24-almalinux
```

## Base Image

These images extend [`tackleza/graalvm`](https://hub.docker.com/r/tackleza/graalvm) — use them when you need both JVM and Node.js in the same container.

## License

GraalVM Community Edition is licensed under the [GraalVM Community License](https://www.oracle.com/downloads/licenses/graal-virtual-license.html).
