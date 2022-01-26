library(pracma)

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
#' dist_pll_lines_2d(3.0, 4.5, 2.5)∂
#' d <- "0.6324"
#' dist_pll_lines_2d(-4, 11, 23)
#' d <- "2.9104"
dist_pll_lines_2d <- function(slope, b1, b2){
  # verify slope is not non-numerical input 
  if(!is.numeric(slope)){
    stop("Cannot calculate distance for non-numerical slope inputs")
  }
  # verify intercept line 1 is not non-numerical input 
  if(!is.numeric(b1)){
    stop("Cannot calculate distance for non-numerical line 1 intercept or b1 inputs")
  }
  # verify intercept line 2 is not non-numerical input 
  if(!is.numeric(b2)){
    stop("Cannot calculate distance for non-numerical line 2 intercept or b2 inputs")
  }
  
  d <- abs(b2 - b1) / sqrt(slope^2 + 1)
  return(d)
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
#' 6.3496042078728
get_distance <- function(x1, x2, metric = "Euclidean", p = NULL) {
    # cast to lower for flexibility
    metric <- tolower(metric)

    # verify distance metric
    if (!(metric %in% c("euclidean", "manhattan", "chebyshev", "minkowski"))) {
        stop("Invalid distance metric")
    }

    # verify that vectors numeric
    if (!is.numeric(x1) | !is.numeric(x2)) {
        stop("x1 and x2 must be numeric")
    }

    # verify dimensions of vectors match
    if (length(x1) != length(x2)) {
        stop("x1 and x2 must be the same length")
    }

    # verify p if minkowski distance is metric
    if (metric == "minkowski") {
        if (!is.numeric(p)) {
        stop("p must be numeric when distance is set to minkowski")
        }
    }

    # calculate and return distance
    if (identical(x1, x2)) {
        return(0)
    } else if (metric == "euclidean") {
        return(sqrt(sum((x1 - x2)^2)))
    } else if (metric == "manhattan") {
        return(sum(abs(x1 - x2)))
    } else if (metric == "chebyshev") {
        return(max(abs(x1 - x2)))
    } else if (metric == "minkowski") {
        return(sum((abs(x1 - x2)^p))^(1 / p))
    }
}

  
#' Determines whether two infinite lines intersect in 3-dimensional space.

#' Note that if two parallel lines are provided, they will be considered as NOT intersecting. 
#' Also note that this function expects integer values for x, y, z coordinates. Values will be rounded 
#' if integer values are not provided. 

#' This algorithm uses the following idea to test for intersection: Two (non parallel) lines intersect 
#' in 3d space if and only if they are coplanar.  
#'
#' @import pracma
#'
#' @param m1 The slope of the first line.
#' @param m2 The slope of the second line.
#' @param b1 Any point on the first line.
#' @param b2 Any point on the second line.
#'
#' @return A boolean representing whether the two lines intersect or not
#' @export
#'
#' @examples
#' m1 <- c(1, 0, 0)
#' m2 <- c(0, 1, 0)
#' b1 <- c(0, 0, 0)
#' b2 <- c(0, 0, 0)
#' is_intersection_3d(m1, b1, m2, b2)
#' TRUE
#' 
#' m3 <- c(1, 3, -1)
#' m4 <- c(2, 1, 4)
#' b3 <- c(0, -2, 4)
#' b4 <- c(0, 3, -3)
#' is_intersection_3d(m3, b3, m4, b4)
#' FALSE
is_intersection_3d <- function(m1, b1, m2, b2){
  
  # Ensure all inputs are numeric
  if (!is.numeric(m1) | !is.numeric(m2) | !is.numeric(b1) | !is.numeric(b2)){
    stop("Input values must be numeric")
  } 
  
  # Ensure inputs of of length 3
  if (length(m1) != 3 | length(m2) !=3 | length(b1) != 3 | length(b2) != 3){
    stop("All input vectors must be of length 3")
  }
  
  # This function rounds floats to integers before testing for intersection
  m1 <- m1 |> round()
  m2 <- m2 |> round()
  b1 <- b1 |> round()
  b2 <- b2 |> round()
  
  # Check if lines are parallel
  if (identical(m1, m2)){
    return(FALSE)
  }
  
  # Lines intersect if and only if they are coplanar
  x <- cross(m1, m2)
  disp <- b2 - b1
  dot <- dot <- x[1]*disp[1] + x[2]*disp[2] + x[3]*disp[3]
  if (dot == 0){
    return(TRUE)
  } else {
    return(FALSE)
  }
  
}