#' Column Averages Per Group
#'
#' @description This function first identifies a grouping variable (taken as categorical). Inspecting across all columns of the data frame, this function then selects all of the numeric columns and calculates the means of each of those numeric columns for each group (i.e., level of the grouping variable, corresponding to particular rows).
#'
#' @param .data   The data frame or data frame extension (e.g. tibble). We opted for the function name ".data" to avoid name collision with the `data()` function in base R packages.
#' @param y       The variable to group by. This is interpreted as a categorical variable. If left unspecified, the function will still work, though will simply be computing means of all rows since no grouping parameter was specified.
#' @param na_rm   A logical value (`TRUE` / `FALSE`) indicating whether `NA` values should be stripped before the computation proceeds. If `TRUE` (the default), the calculation will first remove all `NA`s (if any element of `y` or another grouping variable is `NA`), and the result should therefore not contain `NA`s.
#'
#' @return Returns a data frame containing to the average value of each numeric column per level of the grouping variable (if there is one, or more). With the exception of column names as the top row of the dataframe, each subsequent row of the data frame corresponds to a grouping 'level', and contains the means -- for that level -- of all the numeric variables in the data set.
#' @export
#'
#' @examples
#' avg_cols_group(.data = mtcars, y = cyl)
#'     # Should output a 3 x 11 tibble with one row corresponding to each `cyl` group
#'     # (4, 6, or 8 cylinder cars) as well as their mean values for each variable
#'
#' avg_cols_group(.data = palmerpenguins::penguins, y = species)
#'     # Should output a 3 x 6 tibble with one row corresponding to each penguin species,
#'     # and each non-`species` column a numeric variable;
#'     # numbers in the output tibble should each correspond to a specific numeric variable's average
#'     # for a specific species (e.g., average bill_length_mm of Adelie penguins = 38.8)

avg_cols_group <- function(.data, y, na_rm = TRUE) {
   .data %>%
      dplyr::group_by({{y}}) %>%
      dplyr::summarise(dplyr::across(tidyselect::where(is.numeric), mean, na.rm = na_rm))
}
