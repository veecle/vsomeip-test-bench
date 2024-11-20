# Ensure Docker container is up and running and execute a command in it.
[private]
docker_exec +COMMAND:
    devcontainer up --workspace-folder .
    devcontainer exec --workspace-folder . bash -c '{{COMMAND}}'

# Stop all running Docker containers, rebuild and run them again.
docker_force_rebuild:
    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)
    devcontainer up --workspace-folder .

# Clear build artifacts.
clear:
    rm -rf build
    rm -rf examples/hello_world/build

# Build the project.
build:
    just docker_exec "cmake -B build -S . -DCMAKE_INSTALL_PREFIX:PATH=/usr"
    just docker_exec "cmake --build build"
    just docker_exec "cmake --install build"
    just docker_exec "cmake -B examples/hello_world/build -S examples/hello_world"
    just docker_exec "cmake --build examples/hello_world/build"

# Run hello_world_client.
run_client:
    just docker_exec "VSOMEIP_CONFIGURATION=/home/source/examples/hello_world/helloworld-local.json VSOMEIP_APPLICATION_NAME=hello_world_client ./examples/hello_world/build/hello_world_client"

# Run hello_world_service.
run_service:
    just docker_exec "VSOMEIP_CONFIGURATION=/home/source/examples/hello_world/helloworld-local.json VSOMEIP_APPLICATION_NAME=hello_world_service ./examples/hello_world/build/hello_world_service"