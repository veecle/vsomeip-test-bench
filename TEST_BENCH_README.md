# Veecle Some/IP Test Bench

This doc describes how to setup & work with this repo, which is a test bench for some/IP implmenetation done by Veecle Team.

## Setup

> NOTE: Assumption is, that you use Linux as a host machine. Namely Ubuntu.

1. Install [NodeJS & npm](https://nodejs.org/en). Run: `apt update && apt install nodejs npm -y`.
2. Install [just](https://github.com/casey/just). Run: `apt update && apt install just`
3. Install [devcontainer-cli](https://code.visualstudio.com/docs/devcontainers/devcontainer-cli). Run: `npm install -g @devcontainers/cli`.
4. Install [Docker](https://docs.docker.com). Follow instructions [here](https://docs.docker.com/engine/install/). If Docker won't run without `sudo`, use [this guide](https://docs.docker.com/engine/install/linux-postinstall/).

## Build

```sh
just build
```

## Run

Start the service:

```sh
just run_service
```

Start the client (in another terminal session):

```sh
just run_client
```

You should see something like this in logs from the **client**:

```text
2024-11-20 17:36:35.154670 hello_world_client [info] Port configuration missing for [1111.2222]. Service is internal.
Sending: World
2024-11-20 17:36:35.155814 hello_world_client [info] OFFER(0101): [1111.2222:0.0] (true)
Received: Hello World
```

## Rebilding Docker

If you made a change in a [Dockerfile](./Dockerfile), run:

```sh
just docker_force_rebuild
```