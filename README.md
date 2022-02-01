
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![codecov](https://codecov.io/gh/UBC-MDS/CoordGeomR/branch/main/graph/badge.svg?token=kVjSWrGYrW)](https://codecov.io/gh/UBC-MDS/CoordGeomR)

# CoordGeomR

<!-- badges: start -->
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

## Features

Function 1 `dist_pll_lines_2d`: This function allows a user to calculate the distance between two parallel lines. This is the distance between the points where a perpendicular line intersects between the two parallel lines. This function will find that distance (d).

Function 2 `get_distance`: This function allows a user to calculate the the distance between two n dimensional vectors. Possible metrics that can be used with this function includes: Euclidean, Manhattan, Chebyshev, or Minkowski

Function 3 `is_intersection_3d`: This function allows a user to determine whether two infinite lines intersect in 3-dimensional space. The function will return True or False based on the input arguments.

Function 4 `is_orthogonal`: This function allows a user to determine whether two infinite lines are perpendicular in n-dimensional space. The function will return True or False based on the input arguments.

## Installation

You can install the released version of CoordGeomR from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("CoordGeomR")
```

And the development version from [GitHub](https://github.com/) with:

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
