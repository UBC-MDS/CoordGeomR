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