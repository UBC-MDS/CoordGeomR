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