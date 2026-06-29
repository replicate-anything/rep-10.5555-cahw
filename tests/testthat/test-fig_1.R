DOI <- "10.5555/cahw"
WHAT <- "fig_1"
FOLDER <- "10.5555_cahw"
STUDY_REPO <- "replicate-anything/rep-10.5555_cahw"

study_test_context <- function() {
  study_root <- normalizePath(
    testthat::test_path("..", ".."),
    winslash = "/",
    mustWork = FALSE
  )
  registry_root <- normalizePath(
    file.path(study_root, "..", "registry"),
    winslash = "/",
    mustWork = FALSE
  )
  monorepo_root <- normalizePath(
    file.path(study_root, ".."),
    winslash = "/",
    mustWork = FALSE
  )

  local_index <- data.frame(
    folder = FOLDER,
    doi = paste0("https://doi.org/", DOI),
    title = "Selection and Incentives in Local Service Provision",
    journal = "",
    year = 2026,
    authors = "Voors et al.",
    repo = STUDY_REPO,
    stringsAsFactors = FALSE
  )

  list(
    study_root = study_root,
    registry_root = registry_root,
    monorepo_root = monorepo_root,
    local_index = local_index
  )
}

test_that("run_replication executes fig_1", {
  testthat::skip_if_not_installed("replicateEverything")
  testthat::skip_if_not_installed("ggplot2")

  ctx <- study_test_context()
  testthat::skip_if_not(dir.exists(ctx$registry_root), "registry checkout missing")

  withr::with_options(
    list(
      replicateEverything.registry_root = ctx$registry_root,
      replicateEverything.index = ctx$local_index,
      replicateEverything.use_sibling_packages = TRUE,
      replicateEverything.study_folders_root = ctx$monorepo_root
    ),
    {
      invisible(suppressMessages(capture.output({
        plot <- replicateEverything::run_replication(DOI, WHAT)
      })))
      testthat::expect_true(inherits(plot, "ggplot"))
    }
  )
})
