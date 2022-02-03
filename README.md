
<!-- README.md is generated from README.Rmd. Please edit that file -->

# CoordGeomR

<!-- badges: start -->

[![R-CMD-check](https://github.com/UBC-MDS/CoordGeomR/workflows/R-CMD-check/badge.svg)](https://github.com/UBC-MDS/CoordGeomR/actions)
<!-- badges: end -->

A simple coordinate geometry helper package. This package is developed
for the UBC MDS DSCI 524 Collaborative Software Development course at
the University of British Columbia.

## Overview

This starter package allows users to perform various geometric
operations like calculate distance between two parallel lines, distance
between two n dimensional vectors, intersection of lines in
3-Dimensional space and determine if two infinite lines are
perpendicular in n-dimensional space. Our motivation in creating this
package was to allow users with minimal experience in R programming to
be able to perform these geometric calculations easily.

While we are not really reinventing the wheel on coordinate geometry
calculations with our package, we used this as an opportunity to gain
some experience in understanding how these calculations function in the
R ecosystem. There is an existing package called
[LearnGeom](https://cran.r-project.org/web/packages/LearnGeom/LearnGeom.pdf)
that executes similar functions. For example, the package has functions
like DistanceLines that computes distance between two lines and
IntersectLines which finds the intersection of two lines.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/CoordGeomR")
```

## Example

This is a basic example which shows you how to solve a common problem:

    library(CoordGeomR)
    x1 <- c(1, 2, 3, 4)
    x2 <- c(5, 6, 7, 8)
    get_distance <- function(x1, x2, metric="Euclidean")

## Contributing

Interested in contributing? Check out the contributing guidelines.
Please note that this project is released with a Code of Conduct. By
contributing to this project, you agree to abide by its terms.

## Contributors

We welcome and recognize all contributors. Names and GitHub @usernames
listed below:

-   Arlin Cherian: @arlincherian
-   Nico Van Den Hooff: @nicovandenhooff
-   Zheren Xu: @ZherenXu
-   Jordan Casoli: @jcasoli

## License

`CoordGeomR` is licensed under the terms of the [![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
