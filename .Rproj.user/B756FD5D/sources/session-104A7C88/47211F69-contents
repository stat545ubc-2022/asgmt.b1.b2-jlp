#' Squares a number or a vector of numbers
#'
#' @param x a number or numeric vector/list to be squared
#'
#' @return the square of x in vector format
#' @export
#'
#' @examples
#'
#' square(10) # should be 100
#' square(c(2,4)) # should be c(4,16)
#' square(as.list(c(2,4))) # should be c(4, 16)
square <- function(x) {
  purrr::map_dbl(x, function(y) y^2)
}



document()
load_all()
