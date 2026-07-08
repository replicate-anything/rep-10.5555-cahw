# Voors et al. — Selection and Incentives in Local Service Provision (Sierra Leone)

Folder-backed replication materials for [10.5555/cahw](https://doi.org/10.5555/cahw).

## Layout

```
replication.yml
data/
code/
artifacts/
tests/testthat/
registry/
```

The [registry](https://github.com/replicate-anything/registry) holds a lightweight stub at `studies/10.5555_cahw.yml` that points here.

## Build display artifacts

```r
library(replicateEverything)
options(
  replicateEverything.registry_root = "../registry",
  replicateEverything.use_sibling_packages = TRUE
)
replicateEverything::build_study_artifacts(".", install_deps = TRUE)
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
