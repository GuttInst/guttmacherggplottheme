
<!-- README.md is generated from README.Rmd. Please edit that file -->

# guttmacherggplottheme

<!-- badges: start -->
<!-- badges: end -->

The goal of guttmacherggplottheme is to provide ggplot themes and color
palettes that align with Guttmacher’s branding.

Please note that get_divergent_categorical_palette() is only intended
for plots with exactly 6 categorical variables.

## Installation

You can install the development version of guttmacherggplottheme from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("GuttInst/guttmacherggplottheme")
```

## Example

This is a basic example which shows you how to make different plots
using the guttmacherggplottheme package:

``` r
library(guttmacherggplottheme)
library(ggplot2)
#> Warning: package 'ggplot2' was built under R version 4.2.3
library(ggthemes)
#> Warning: package 'ggthemes' was built under R version 4.2.3
library(extrafont)
#> Registering fonts with R
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union

################################################################################
# Load and prep data
################################################################################
data(iris)

# Create bins for Sepal.Length
iris <- iris %>%
  mutate(Sepal.Length.Category = cut(Sepal.Length,
                                      breaks = c(4, 4.5, 5, 5.5, 6, 6.5, 10),
                                      labels = c("4-4.5", "4.5-5", "5-5.5", "5.5-6", "6-6.5", "6.5+"),
                                      right = FALSE))

################################################################################
# Import and load fonts
################################################################################

# This code ensures that the Guttmacher fonts are available for use in your R environment.
font_import(pattern="arial.ttf", prompt=FALSE)
#> Scanning ttf files in C:\windows/Fonts, C:\Users\amurulidhar\AppData\Local/Microsoft/Windows/Fonts ...
#> Extracting .afm files from .ttf files...
#> C:\Windows\Fonts\arial.ttf : ArialMT already registered in fonts database. Skipping.
#> Found FontName for 0 fonts.
#> Scanning afm files in C:/Users/amurulidhar/AppData/Local/R/win-library/4.2/extrafontdb/metrics
loadfonts()
#> Arial already registered with windowsFonts().
#> Arial already registered with pdfFont().
#> Arial already registered with postscriptFont().


################################################################################
# Examples using categorical palettes
################################################################################

# Standard categorical palette example
categorical_palette <- guttmacherggplottheme::get_categorical_palette(4)        # Define palette
ggplot2::ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() + scale_color_manual(values = categorical_palette) + # Use palette here
  guttmacherggplottheme::guttmacher_theme() + labs (title ="Floral Test Plot (Categorical)" ) 
```

<img src="man/figures/README-example-1.png" width="100%" />

``` r


################################################################################
# Examples using sequential palettes
################################################################################

# Sequential palette example
sequential_palette <- guttmacherggplottheme::get_sequential_palette("blue")     # Define palette
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Petal.Length)) +
  geom_point() + scale_color_gradientn(colors = sequential_palette) + # Use palette here
  guttmacherggplottheme::guttmacher_theme() + guides(color = guide_colorbar(ticks.colour = NA)) +
  labs(title = "Floral Test Plot (Sequential)") 
```

<img src="man/figures/README-example-2.png" width="100%" />

``` r

# Sequential categorical palette example
sequential_categorical_palette <- guttmacherggplottheme::get_sequential_categorical_palette("orange", 6)  # Define palette
ggplot(iris, aes(x = Petal.Length, fill = Sepal.Length.Category)) +
  geom_histogram(binwidth = 1) +
  scale_fill_manual(values = sequential_categorical_palette) +  # Use palette here
  guttmacherggplottheme::guttmacher_theme() +
  labs(title = "Floral Test Plot (Sequential Categorical)")
```

<img src="man/figures/README-example-3.png" width="100%" />

``` r


################################################################################
# Examples using divergent palettes
################################################################################

# Divergent palette example
divergent_palette <- guttmacherggplottheme::get_divergent_palette()             # Define palette   
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Petal.Length)) +
  geom_point() + scale_color_gradientn(colors = divergent_palette) + # Use palette here
  guttmacherggplottheme::guttmacher_theme() + guides(color = guide_colorbar(ticks.colour = NA)) +
  labs(title = "Floral Test Plot (Divergent)") 
```

<img src="man/figures/README-example-4.png" width="100%" />

``` r

# Divergent categorical palette example; note that the divergent caterogical palette is intended for plots with
# 6 categorical variables
divergent_categorical_palette <- guttmacherggplottheme::get_divergent_categorical_palette()        # Define palette
ggplot(iris, aes(x = Petal.Length, fill = Sepal.Length.Category)) +
  geom_histogram(binwidth = 1) +
  scale_fill_manual(values = divergent_categorical_palette) +  # Use palette here
  guttmacherggplottheme::guttmacher_theme() +
  labs(title = "Floral Test Plot (Divergent Categorical)")
```

<img src="man/figures/README-example-5.png" width="100%" />
