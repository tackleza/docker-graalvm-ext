#!/bin/sh
# Build every supported image, verify all of them, then optionally publish.
set -eu
SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
publish=false
if [ "${1:-}" = "--push" ]; then
    publish=true
    shift
fi
if [ "$#" -eq 0 ]; then
    set -- 25-almalinux latest
fi
# Validate the complete request before building anything.
for tag do
    case "$tag" in
        25-almalinux|latest) ;;
        *) echo "Unsupported image variant: $tag" >&2; exit 2 ;;
    esac
done
for tag do
    docker build --pull --no-cache -t "tackleza/graalvm-ext:$tag" "$SCRIPT_DIR/$tag"
    docker run --rm "tackleza/graalvm-ext:$tag" java -version
    docker run --rm "tackleza/graalvm-ext:$tag" node --version
    docker run --rm "tackleza/graalvm-ext:$tag" tsc --version
done
if [ "$publish" = true ]; then
    for tag do
        docker push "tackleza/graalvm-ext:$tag"
    done
fi
