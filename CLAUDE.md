# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an R project template designed for containerized development via GitHub Codespaces or DevPod. It uses `renv` for reproducible package management and Quarto for reports/documentation.

- **R version**: 4.5.3 (via `rocker/r-ver` container image)
- **Package manager**: `renv`
- **Formatter**: AIR (Assistive Intelligent R) — formats on save in VS Code

## Common Commands

Run the main script:
```bash
Rscript R/main.R
```

Restore packages from lockfile (run after cloning or when `renv.lock` changes):
```r
renv::restore()
```

Install a new package and snapshot it to `renv.lock`:
```r
renv::install("packagename")
renv::snapshot()
```

Render a Quarto document:
```bash
quarto render quarto/<file>.qmd
```

## Project Structure

```
R/          # R scripts — entry points and analysis code
data/       # Raw input data (not committed)
output/     # Data products and outputs (not committed)
quarto/     # Quarto documents for reports and documentation
renv/       # renv auto-generated environment files
renv.lock   # Frozen package versions — commit this file
```

## Git Conventions

Use [Conventional Commits](https://www.conventionalcommits.org/) for all commit messages:

```
<type>[optional scope]: <description>
```

Common types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

## IDE Notes (Positron)

- **Ctrl+Enter behavior**: Code should execute in the R Console (Positron's Ark-powered built-in REPL), not a terminal labeled "R Interactive". If Ctrl+Enter opens a new "R Interactive" terminal running `radian` instead, it means the Ark console session hasn't started yet — Positron falls back to a radian terminal when no console is active.
  - `.vscode/settings.json` sets `interpreters.startupBehavior: "always"` to auto-start the console, and forces `REditorSupport.r` to run on the UI side so it can't create radian terminals in the container.
  - If the issue persists after rebuilding the container, manually start the R console from the Console panel before using Ctrl+Enter.

## Architecture Notes

- `.Rprofile` activates the `renv` environment on R startup — do not remove the `source("renv/activate.R")` line.
- Place raw data in `data/`, write outputs to `output/`. These directories have placeholder files (`.data-here`, `.data-products-here`) to keep them tracked in git.
- Quarto source files belong in `quarto/`. The Quarto CLI is installed as a dev container feature.
- The dev container uses `postStartCommand: renv::restore()` to keep packages in sync automatically when the container starts.
