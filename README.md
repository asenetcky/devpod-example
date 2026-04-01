# R Development Container

A development container template for R projects, demonstrating how to use
[DevPod](https://devpod.sh) with [Positron IDE](https://positron.posit.co).

## Prerequisites

- [DevPod Desktop](https://devpod.sh/docs/getting-started/install) (includes the CLI)
- [Docker](https://docs.docker.com/get-docker/) (running locally as the compute provider)
- [Positron IDE](https://positron.posit.co/download.html)

## Getting Started with DevPod CLI

### 1. Add the Docker provider

```bash
devpod provider add docker
```

Only needed once. DevPod uses Docker to run the dev container locally.

### 2. Start a workspace from this repo

```bash
devpod up github.com/<your-username>/devpod-example --ide positron
```

DevPod will clone the repo, build the container, run the `postCreateCommand`
(initializes renv and installs the R language server), and open the workspace in
Positron. Your R session runs inside the container with all packages managed via
`renv`.

## Common Workspace Commands

```bash
# List all workspaces
devpod list

# Stop a running workspace
devpod stop devpod-example

# Restart a stopped workspace
devpod up devpod-example

# SSH into a workspace directly
devpod ssh devpod-example

# Delete a workspace
devpod delete devpod-example
```

## Project Layout

- `R/` — R source scripts
- `data/` — raw data and inputs
- `output/` — data products
- `quarto/` — Quarto documents and reports

`renv` is initialized on container creation and packages are restored on every
container start via `postStartCommand`. The `renv.lock` file pins all package
versions for reproducibility.
