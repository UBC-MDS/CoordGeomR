library(testthat)

# ------ inputs for get_distance tests ------ 
x1 <- c(1, 2, 3, 4)
x2 <- c(5, 6, 7, 8)
x3 <- c(9.6, -0.6, 7)
x4 <- c(1.23, 5.7, -3)
x5 <- c(0)

# ------ tests the distance calculations for get_distance with integer input ------ 
test_that("Error in distance calculation for equal vectors", {
    expect_equal(0, get_distance(x1, x1))
})

test_that("Error in Euclidean distance calculation", {
    expect_equal(8, get_distance(x1, x2, metric = "Euclidean"))
})

test_that("Error in Manhattan distance calculation", {
    expect_equal(16, get_distance(x1, x2, metric = "Manhattan"))
})

test_that("Error in Chebyshev distance calculation", {
    expect_equal(4, get_distance(x1, x2, metric = "Chebyshev"))
})

test_that("Error in Minkowski distance calculation", {
    expect_equal(6.35, round(get_distance(x1, x2, metric = "Minkowski", 3), 2))
})

# ------ tests the distance calculations for get_distance with float input ------ 
test_that("Error in distance calculation for equal vectors", {
    expect_equal(0, get_distance(x3, x3))
})

test_that("Error in Euclidean distance calculation", {
    expect_equal(14.48, round(get_distance(x3, x4, metric = "Euclidean"), 2))
})

test_that("Error in Manhattan distance calculation", {
    expect_equal(24.67, round(get_distance(x3, x4, metric = "Manhattan"), 2))
})

test_that("Error in Chebyshev distance calculation", {
    expect_equal(10, round(get_distance(x3, x4, metric = "Chebyshev"), 2))
})

test_that("Error in Minkowski distance calculation", {
    expect_equal(5.94, round(get_distance(x3, x4, metric = "Minkowski", -5), 2))
})

# ------ tests that get_distance raises the right exceptions for invalid input ------ 
test_that("Invalid distance metric should throw error", {
    expect_error(get_distance(x1, x2, metric = "invalid"))
})

test_that("Invalid x1 type should throw error", {
    expect_error(get_distance(c("a"), x2))
})

test_that("Invalid x2 type should throw error", {
    expect_error(get_distance(x1, "a"))
})

test_that("Mismatched dimensions should throw error", {
    expect_error(get_distance(x1, x3))
})

test_that("Invalid p for minkowski distance should throw error", {
    expect_error(get_distance(x1, x2, "minkowski", "1"))
})


# ------ tests is_intersection_3d for integer input -------
test_that("Error in is_intersection_3d for integer input", {
  expect_equal(TRUE, is_intersection_3d(c(1, 0, 0), c(0, 0, 0), c(0, 1, 0), c(0, 0, 0)))
  expect_equal(TRUE, is_intersection_3d(c(1, 0, 0), c(0, 0, 0), c(0, 1, 0), c(1, 1, 0)))
  expect_equal(FALSE, is_intersection_3d(c(1, 1, 1), c(0, 0, 0), c(1, 1, 1), c(1, 1, 1)))
  expect_equal(FALSE, is_intersection_3d(c(1, 3, -1), c(0, -2, 4), c(2, 1, 4), c(0, 3, -3)))
})

# ------ tests is_intersection_3d for float input ------
test_that("Error in is_intersection_3d for float input", {
  expect_equal(TRUE, is_intersection_3d(c(1.2, 0.3, 0.4), c(0, 0.1, 0.1), c(0, 1, 0), c(0, 0, 0)))
  expect_equal(TRUE, is_intersection_3d(c(1.3, 0.3, 0), c(0, 0, 0), c(0, 0.9, 0), c(0.7, 1.3, 0)))
  expect_equal(FALSE, is_intersection_3d(c(1.1, 0.8, 0.9), c(0, 0, 0), c(1.2, 0.8, 1.4), c(1, 1, 1)))
  expect_equal(FALSE, is_intersection_3d(c(1.1, 3.2, -1.3), c(0.0, -2.4, 4.2), c(2.1, 1, 4), c(0.2, 3.3, -3.0)))
})

# ------ tests is_intersection_3d for invalid input ------
test_that("Error in is_intersection_3d for float input", {
  expect_error(is_intersection_3d(c('1.2', '0.3', '0.4'), c(0, 0.1, 0.1), c(0, 1, 0), c(0, 0, 0)))
  expect_error(is_intersection_3d(c(1.2, 0.3), c(0, 0.1, 0.1), c(0, 1, 0), c(0, 0, 0)))
})

# ------ tests the distance calculations for dist_pll_lines_2d throws errors with non-numeric inputs ------ 
# testing non-numeric slopes
test_that("Non-numeric values for slope should throw an error", {
  expect_error(dist_pll_lines_2d("slope", 4, -1))
  expect_error(dist_pll_lines_2d(list(4), 4, -1))
})

# testing non-numeric intercept b1
test_that("Non-numeric values for b1 should throw an error", {
  expect_error(dist_pll_lines_2d(2, "intercept", -1))
  expect_error(dist_pll_lines_2d(2, list(4, 3, 2), -1))
})

# testing non-numeric intercept b2
test_that("Non-numeric values for b2 should throw an error", {
  expect_error(dist_pll_lines_2d(2, 4, "intercept"))
  expect_error(dist_pll_lines_2d(2, 4, list("a", 1, 2)))
})

# testing distance calculations
test_that("Error in distance calculation", {
  expect_equal(dist_pll_lines_2d(0, 1, 2), 1, tolerance = 1)
  expect_equal(2.24, round(dist_pll_lines_2d(0, 1, 2), 2))
})

# testing distance calculation is just a numerical return value
test_that("Distance shouldn't have any vector names in the output", {
  expect_named(dist_pll_lines_2d(2, 4, -1), NULL)
})
