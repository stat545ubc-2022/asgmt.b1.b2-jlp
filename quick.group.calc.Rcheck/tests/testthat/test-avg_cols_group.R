#### Testing function with **expect_equal( )**:

# In the following code, we first create a dummy data.frame, and name it name *dummy_df*.
a <- c("red", "green", "blue", "orange", "yellow")
b <- 1:5
c <- b * 2
d <- 1
dummy_df <- data.frame(a, b, c, d)
dummy_df

# We then test the *avg_cols_group( )* function using the **expect_equal( )** function:
# This test is ran to confirm that the correct computations are happening behind the scenes of my function, such that it gives the same/equal results as were one to manually identify the numeric columns and then calculate their means.

test_that("Function output is equual to the exact values & format specified, as calculated by hand", {
  expect_equal(avg_cols_group(dummy_df), tibble::tibble(b = mean(1:5), c = mean(2 *(1:5)), d = mean(1)))
})


#### Testing function with **expect_named( )**:

# This function is expected to only output columns with names corresponding to the numeric columns or the grouping variable(s).
# In the example of the penguins data set, the avg_cols_group( ) function -- when specified to group by species -- should return only columns corresponding to the grouping variable "species", followed my the numeric variables "bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g" and "year".
# In other words, in this example, "island" & "sex" columns should not be in the output.
# We check this using the expect_named( ) function, to see if only the column names we expect to see are outputted.

test_that("The function outputs only the grouping column(s) plus columns containing numeric data", {
  expect_named(avg_cols_group(.data = palmerpenguins::penguins, y = species), c("species", "bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g", "year"))
})


#### Testing function with **expect_error( )**:

# In the following code, we first create a dummy vector, which we name *dummy_vector*.
dummy_vector <- c(1, 5, 4, 9, 0)

# We run a vector as an input in order see if the function throws an error when doing so, as this function should only accept inputs of the class data.frame in the `.data` parameter.
# Indeed, as expected, and confirmed by this **expect_error( )** function, calling on an object of class 'vector' returns an error for the avg_cols_group( ) function.

test_that("Error occurs when input object is not of the class data.frame", {
  expect_error(avg_cols_group(dummy_vector))
})
