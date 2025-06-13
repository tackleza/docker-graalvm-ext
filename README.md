# GraalVM with native support + Extra Tools.
### Please check the tags for more information.

Docker Hub: https://hub.docker.com/r/tackleza/graalvm-ext

This was build on top of tackleza/graalvm (https://hub.docker.com/r/tackleza/graalvm)
You will find AlmaLinux and graalvm in many version

### Installed Tools
- NodeJS
- TypeScript (Installed Global via npx)

### For testing java version. You can execute by
    docker run -it tackleza/graalvm-ext:22-almalinux

**Output:** `java version "22" 2024-03-19
Java(TM) SE Runtime Environment Oracle GraalVM 22+36.1 (build 22+36-jvmci-b02)
Java HotSpot(TM) 64-Bit Server VM Oracle GraalVM 22+36.1 (build 22+36-jvmci-b02, mixed mode, sharing)`

### If you want to access bash (terminal) You can execute by
    docker run -it tackleza/graalvm-ext:22-almalinux bash

**Output:** `[root@26f1596c9dc1 /]#`

### If you want to execute multiple command in bash (terminal) here some example
    docker run -it tackleza/graalvm-ext:22-almalinux bash -c "echo 1; echo 2"

**Output:** `1 2`
