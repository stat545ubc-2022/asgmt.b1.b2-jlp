pkgname <- "quick.group.calc"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
base::assign(".ExTimings", "quick.group.calc-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('quick.group.calc')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("avg_cols_group")
### * avg_cols_group

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: avg_cols_group
### Title: Column Averages Per Group
### Aliases: avg_cols_group

### ** Examples

avg_cols_group(.data = mtcars, y = cyl)
    # Should output a 3 x 11 tibble with one row corresponding to each `cyl` group
    # (4, 6, or 8 cylinder cars) as well as their mean values for each variable

avg_cols_group(.data = palmerpenguins::penguins, y = species)
    # Should output a 3 x 6 tibble with one row corresponding to each penguin species,
    # and each non-`species` column a numeric variable;
    # numbers in the output tibble should each correspond to the average of a specific numeric variable
    # for a specific species (e.g., average bill_length_mm of Adelie penguins = 38.8)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("avg_cols_group", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
