
#' Find the distance between two parallel lines in 2-D space.
#'
#' @param slope A numerical value, slope of the two parallel lines. 
#' The slope of line 1 is the negative inverse of line 2, therefore, it is equal.
#' @param b1 A numerical value, intercept of line 1 when y = mx + b
#' @param b2 A numerical value, intercept of line 1 when y = mx + b
#'
#' @return d, A numerical value for distance between the two parallel lines
#' @export
#'
#' @examples
#' dist_pll_lines_2d(3.0, 4.5, 2.5)
#' d <- "0.6324"
#' dist_pll_lines_2d(-4, 11, 23)
#' d <- "2.9104"
dist_pll_lines_2d <- function(slope, b1, b2){
    
}
#' Determines whether two infinite lines are perpendicular in n-dimensional space.
#'
#' @param m1 A numeric vector corresponds to a n-dimensional vector ⟨mx1, my1, mz1, ...⟩ describing the direction vector of line 1.
#' @param m2 A numeric vector corresponds to a n-dimensional vector ⟨mx1, my1, mz1, ...⟩ describing the direction vector of line 1. Demensions of line 1 and line 2 must be equal.
#'
#' @return TRUE if there is orthogonal, FALSE if not.
#' @export
#'
#' @examples
#' m1 <- c(1, 0, 0)
#' m2 <- c(0, 1, 0)
#' is_orthogonal(m1, m2)
is_orthogonal <- function(m1, m2) {}

#' Calculates the distance between two n dimensional vectors.
#'
#' @param x1 The first n dimensional vector.
#' @param x2 The second n dimensional vector.
#' @param metric The distance metric, must be one of "Euclidean", "Manhattan", Chebyshev, or "Minkowski"
#' @param p The order of Minkowski distance to calculate.  Only required if `metric` is set to "Minkowski".
#'
#' @return The relevant distance between the two vectors.
#' @export
#'
#' @examples
#' x1 <- c(1, 2, 3, 4)
#' x2 <- c(5, 6, 7, 8)
#' get_distance(x1, x2, metric="Euclidean")
#' 8
#' get_distance(x1, x2, metric="Manhattan")
#' 16
#' get_distance(x1, x2, metric="Chebyshev")
#' 4
#' get_distance(x1, x2, metric="Minkowski", 3)
#' 6.3496
get_distance <- function(x1, x2, metric="Euclidean", p=NULL) {
  
