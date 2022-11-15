
<!-- README.md is generated from README.Rmd. Please edit that file -->

# quick.group.calc

<!-- badges: start -->
<!-- badges: end -->

## Package Development

This package was developed by Jaden L. Phillips in Fall 2022 as part of
an assignment for **STAT545B** at the University of British Columbia.
This package was created using various functions from the `devtools` and
`usethis`packages.

## Overview

The goal of **quick.group.calc** is to simplify and make more efficient
the code needed to create a group_by() %\>% summarise() workflow:

- Specifically, since most data operations are done on groups defined by
  variables, this package can help fast track to a compact, grouped and
  summarized output data frame.

- The output will have one row corresponding to each (combination of)
  grouping variable(s), and one column for each grouping variable as
  well as one column for each summary statistic specified.

The primary `avg_cols_group()` function of this package first identifies
a grouping variable (interpreted as categorical), and then, inspecting
across all columns of the data frame, selects all of the numeric columns
and calculates the means of each of those columns for each group (i.e.,
level of the grouping variable, corresponding to particular rows).

## Installation

You can install the development version of `quick.group.calc` from
[GitHub](https://github.com/stat545ubc-2022/asgmt.b1.b2-jlp/tree/main/quick.group.calc)
with:

``` r
#install.packages("devtools")
devtools::install_github("stat545ubc-2022/quick.group.calc-jlp")
#> Downloading GitHub repo stat545ubc-2022/quick.group.calc-jlp@HEAD
#> 
#> * checking for file ‘/private/var/folders/z0/p5d1pn7521d_s6vfzfj2s2j00000gn/T/Rtmp1Nk84a/remotes36ca4e14655f/stat545ubc-2022-quick.group.calc-jlp-fa0da53/DESCRIPTION’ ... OK
#> * preparing ‘quick.group.calc’:
#> * checking DESCRIPTION meta-information ... OK
#> * checking for LF line-endings in source and make files and shell scripts
#> * checking for empty or unneeded directories
#> * building ‘quick.group.calc_0.1.0.tar.gz’
#> Installing package into '/private/var/folders/z0/p5d1pn7521d_s6vfzfj2s2j00000gn/T/RtmpfSmQMl/temp_libpath2b2b282257c6'
#> (as 'lib' is unspecified)
```

## Examples (Usage Demonstration)

The following are two simple examples showing you how to use the primary
**avg_cols_group( )** function of the **quick.group.calc** package:

``` r
library(quick.group.calc)
```

#### Example \#1:

Using the *mtcars* dataset, and grouping by the variable/column *cyl*
corresponding to the number of cylinders in a car :

- The output of a 3 x 11 tibble has one row corresponding to each `cyl`
  group (4, 6, or 8 cylinder cars)

``` r
avg_cols_group(.data = mtcars, y = cyl)
#> # A tibble: 3 × 11
#>     cyl   mpg  disp    hp  drat    wt  qsec    vs    am  gear  carb
#>   <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1     4  26.7  105.  82.6  4.07  2.29  19.1 0.909 0.727  4.09  1.55
#> 2     6  19.7  183. 122.   3.59  3.12  18.0 0.571 0.429  3.86  3.43
#> 3     8  15.1  353. 209.   3.23  4.00  16.8 0     0.143  3.29  3.5
```

#### Example \#2:

Using the *penguins* data set of the palmerpenguins package, and
grouping by penguin *species*:

- Output values in all but the `species` column are mean values per
  species for that variable
- E.g., the value at \[1,1\] indicates the average *bill_length_mm* of
  *Adelie* penguins is 38.8

``` r
avg_cols_group(.data = palmerpenguins::penguins, y = species)
#> # A tibble: 3 × 6
#>   species   bill_length_mm bill_depth_mm flipper_length_mm body_mass_g  year
#>   <fct>              <dbl>         <dbl>             <dbl>       <dbl> <dbl>
#> 1 Adelie              38.8          18.3              190.       3701. 2008.
#> 2 Chinstrap           48.8          18.4              196.       3733. 2008.
#> 3 Gentoo              47.5          15.0              217.       5076. 2008.
```
