library(testthat)

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