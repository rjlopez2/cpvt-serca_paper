
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cpvt-serca_paper

This is the accompanying GitHub repository to a work in progress paper
by Ruben Lopez[![ORCID
iD](https://orcid.org/sites/default/files/images/orcid_16x16.png)](https://orcid.org/0000-0002-3802-3158)

[![licensebuttons
by](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Ask Me Anything
!](https://img.shields.io/badge/Ask%20me-anything-1abc9c.svg)](https://github.com/rjlopez2/cpvt-serca_paper/issues/new)
![Open Source
Love](https://badges.frapsoft.com/os/v2/open-source.svg?v=103)

# Compile

The following instructions describe how to reproduce a copy of the
source files for most of our analysis of Ca^2+ waves in our manuscript.
describing reproducible workflows, and create the PDF. Either, you can
go the ‘standard’ way of downloading a local copy of the repository and
knit the “full_analysis.Rmd” file in R, or you can use the reproducible
workflow as suggested and use Make to create a container and build the
final PDF file in exactly the same virtual computational environment
that we used to render the PDF.

> NOTE: No sure if I will use the standard way or just the docker
> option… got a check later

## Standard Way

Requires: `Git`, `RStudio`, `pandoc`, `pandoc-citeproc` & `rmarkdown`.

Open RStudio -\> File -\> New Project -\> Version Control -\> Git

Insert:

    https://github.com/rjlopez2/CPVT-SERCA_paper

Open `full_analysis.Rmd` click on `Knit`.

## Using a Reproducible Workflow

Does not require R or RStudio, but `make` & `docker`.

Execute in Terminal:

``` bash
git clone https://github.com/rjlopez2/cpvt-serca_paper.git
cd cpvt-serca_paper
make build
make all DOCKER=TRUE
```

**Note: Windows user need to manually edit the `Makefile` and set
current_path to the current directory and use
`make all DOCKER=TRUE WINDOWS=TRUE`. We hope that future releases of
Docker for Windows will not require that workaround.**

## Rebuild Everything

In case you experience some unexpected behavior with this workflow, you
should check that you have the most recent version (`git pull`), rebuild
the docker image (`make build`) and force the rebuild of all targets
(`make -B DOCKER`).

``` bash
git pull && make rebuild && make -B DOCKER=TRUE
```

# Session Info

``` r
sessioninfo::session_info()
#> ─ Session info ───────────────────────────────────────────────────────────────
#>  setting  value
#>  version  R version 4.1.1 (2021-08-10)
#>  os       macOS Big Sur 10.16
#>  system   x86_64, darwin17.0
#>  ui       X11
#>  language (EN)
#>  collate  en_US.UTF-8
#>  ctype    en_US.UTF-8
#>  tz       Europe/Zurich
#>  date     2022-04-21
#>  pandoc   2.17.1.1 @ /usr/local/bin/ (via rmarkdown)
#> 
#> ─ Packages ───────────────────────────────────────────────────────────────────
#>  package     * version date (UTC) lib source
#>  cli           3.2.0   2022-02-14 [1] CRAN (R 4.1.1)
#>  digest        0.6.29  2021-12-01 [1] CRAN (R 4.1.1)
#>  evaluate      0.15    2022-02-18 [1] CRAN (R 4.1.2)
#>  fastmap       1.1.0   2021-01-25 [1] CRAN (R 4.1.0)
#>  htmltools     0.5.2   2021-08-25 [1] CRAN (R 4.1.0)
#>  knitr         1.38    2022-03-25 [1] CRAN (R 4.1.2)
#>  magrittr      2.0.3   2022-03-30 [1] CRAN (R 4.1.1)
#>  rlang         1.0.2   2022-03-04 [1] CRAN (R 4.1.2)
#>  rmarkdown     2.13    2022-03-10 [1] CRAN (R 4.1.2)
#>  rstudioapi    0.13    2020-11-12 [1] CRAN (R 4.1.0)
#>  sessioninfo   1.2.2   2021-12-06 [1] CRAN (R 4.1.0)
#>  stringi       1.7.6   2021-11-29 [1] CRAN (R 4.1.0)
#>  stringr       1.4.0   2019-02-10 [1] CRAN (R 4.1.0)
#>  xfun          0.30    2022-03-02 [1] CRAN (R 4.1.2)
#>  yaml          2.3.5   2022-02-21 [1] CRAN (R 4.1.2)
#> 
#>  [1] /Library/Frameworks/R.framework/Versions/4.1/Resources/library
#> 
#> ──────────────────────────────────────────────────────────────────────────────
```
