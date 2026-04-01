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

## Architecture Notes

- `.Rprofile` activates the `renv` environment on R startup — do not remove the `source("renv/activate.R")` line.
- Place raw data in `data/`, write outputs to `output/`. These directories have placeholder files (`.data-here`, `.data-products-here`) to keep them tracked in git.
- Quarto source files belong in `quarto/`. The Quarto CLI is installed as a dev container feature.
- The dev container uses `postStartCommand: renv::restore()` to keep packages in sync automatically when the container starts.
