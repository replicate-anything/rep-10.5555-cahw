# Voors et al. — Selection and Incentives in Local Service Provision (Sierra Leone)

Folder-backed replication materials for [10.5555/cahw](https://doi.org/10.5555/cahw).

## Layout

```
replication.yml
data/
code/
outputs/
tests/testthat/
```

The [registry](https://github.com/replicate-anything/registry) holds a lightweight stub at `studies/10.5555_cahw.yml` that points here (no `registry/` materials are stored in this repo).

## Build display artifacts

```r
library(replicateEverything)
options(
  replicateEverything.registry_root = "../registry",
  replicateEverything.use_sibling_packages = TRUE
)
replicateEverything::build_study_outputs(".", install_deps = TRUE)
```

## Validate, then sync to registry

```r
options(replicateEverything.registry_root = "../registry")
replicateEverything::check_and_bake_study(".", build_artifacts = FALSE)
replicateEverything::sync_study_to_registry(".")
```

## Local development (monorepo)

```r
options(
  replicateEverything.registry_root = "../registry",
  replicateEverything.use_sibling_packages = TRUE
)
replicateEverything::run_replication("10.5555/cahw", "fig_1", format = TRUE)
```

Note: replications marked `incomplete: true` in `replication.yml` (tab_7, tab_12, tab_14, tab_15) are excluded from automated artifact builds; precomputed `.rds` artifacts are kept where available.
