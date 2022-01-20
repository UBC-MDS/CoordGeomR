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