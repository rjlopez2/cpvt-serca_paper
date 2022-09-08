
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cpvt-serca_paper

This is the accompanying GitHub repository containing most of the
analyis from the publication ***Uptake-leak balance of SR
Ca<sup>2+</sup> determines arrhythmogenic potential of
RyR2R420Q<sup>+/−</sup> cardiomyocytes***
[DOI:10.1016/j.yjmcc.2022.05.011](https://doi.org/10.1016/j.yjmcc.2022.05.011)
by Ruben Lopez[![ORCID
iD](https://orcid.org/sites/default/files/images/orcid_16x16.png)](https://orcid.org/0000-0002-3802-3158),
Ernst Niggli, Radoslav Yanicek, Miguel Fernandez-Tenorio, Ana Gomez and
others.

[![licensebuttons
by](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Ask Me Anything
!](https://img.shields.io/badge/Ask%20me-anything-1abc9c.svg)](https://github.com/rjlopez2/cpvt-serca_paper/issues/new)
![Open Source
Love](https://badges.frapsoft.com/os/v2/open-source.svg?v=103)

The raw data from this paper can be accessible in the Zenodo repository
[![DOI_zenodo](https://zenodo.org/badge/DOI/10.5281/zenodo.5226364.svg)](https://doi.org/10.5281/zenodo.5226364)

# Compile

The following instructions describe how to reproduce a copy of the
source files for most of our analysis of Ca<sup>2+</sup> waves in our
manuscript. this isntructions are heavily inspired by Aaron Peikert and
you can read more [here](https://doi.org/10.31234/osf.io/8xzqy). We
describe reproducible workflows, and create .html documents as well as
individual figures, summary statistics and test performed in our data.
Either, you can go the ‘standard’ way of downloading a local copy of the
repository and knit each markdown file(s) located under the folder
`code` using RStudio, or you can use the reproducible workflow as
suggested and use Make to create a container and build the final results
in exactly the same virtual computational environment that we used to
render the .html

## Standard Way

Requires: `Git`, `RStudio`, `pandoc`, `pandoc-citeproc`, `rmarkdown` &
`renv`.

Open RStudio -\> File -\> New Project -\> Version Control -\> Git

Insert:

    https://github.com/rjlopez2/CPVT-SERCA_paper

> you have to check if this actually work with the {renv} package

to restore all the dependencies, run from within the RStudio’s console
this command and follow the instructions:

    renv::restore()

Go to the folder `code` and open `full_analysis.Rmd` click on `Knit`.

Do the same for the additional markdown files.

## Using a Reproducible Workflow

Does not require R or RStudio, but `make` & `docker`.

Before you start, make sure that you have installed in your machine make
and docker. In this
[tutorial](https://github.com/aaronpeikert/reproducible-research#resources)
is fairly well explained how to install it depending on your system.

Execute in Terminal:

``` bash
git clone https://github.com/rjlopez2/cpvt-serca_paper.git
cd cpvt-serca_paper
make build
make all DOCKER=TRUE OUTPUT=TRUE
```

if you wish not to have the output (summary tables and figures), but
just the html files, run the last line with `OUTPUT=FALSE`

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
#> ─ Session info ───────────────────────────────────────────────────────────────────────────────────────────────────────────────
#>  setting  value
#>  version  R version 4.2.0 (2022-04-22)
#>  os       Ubuntu 20.04.4 LTS
#>  system   x86_64, linux-gnu
#>  ui       RStudio
#>  language (EN)
#>  collate  en_US.UTF-8
#>  ctype    en_US.UTF-8
#>  tz       Etc/UTC
#>  date     2022-09-08
#>  rstudio  2022.02.3+492 Prairie Trillium (server)
#>  pandoc   2.17.1.1 @ /usr/lib/rstudio-server/bin/quarto/bin/ (via rmarkdown)
#> 
#> ─ Packages ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────
#>  package     * version date (UTC) lib source
#>  cli           3.3.0   2022-04-25 [1] RSPM (R 4.2.0)
#>  digest        0.6.29  2021-12-01 [1] RSPM (R 4.2.0)
#>  evaluate      0.15    2022-02-18 [1] RSPM (R 4.2.0)
#>  fastmap       1.1.0   2021-01-25 [1] RSPM (R 4.2.0)
#>  htmltools     0.5.3   2022-07-18 [1] CRAN (R 4.2.0)
#>  knitr         1.39    2022-04-26 [1] RSPM (R 4.2.0)
#>  magrittr      2.0.3   2022-03-30 [1] RSPM (R 4.2.0)
#>  rlang         1.0.4   2022-07-12 [1] CRAN (R 4.2.0)
#>  rmarkdown     2.16    2022-08-24 [1] CRAN (R 4.2.0)
#>  rstudioapi    0.13    2020-11-12 [1] RSPM (R 4.2.0)
#>  sessioninfo   1.2.2   2021-12-06 [1] RSPM (R 4.2.0)
#>  stringi       1.7.6   2021-11-29 [1] RSPM (R 4.2.0)
#>  stringr       1.4.0   2019-02-10 [1] RSPM (R 4.2.0)
#>  xfun          0.31    2022-05-10 [1] RSPM (R 4.2.0)
#>  yaml          2.3.5   2022-02-21 [1] RSPM (R 4.2.0)
#> 
#>  [1] /usr/local/lib/R/site-library
#>  [2] /usr/local/lib/R/library
#> 
#> ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
# 
# Sys.getenv("R_HOME")
# readLines("/System/Library/CoreServices/SystemVersion.plist")
# utils:::.osVersion()
# 
# debug(utils:::.osVersion)
# utils:::.osVersion()
```
