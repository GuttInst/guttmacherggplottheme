
<!-- README.md is generated from README.Rmd. Please edit that file -->

# guttmacherggplottheme

<!-- badges: start -->
<!-- badges: end -->

The goal of guttmacherggplottheme is to provide ggplot themes and color
palettes that align with Guttmacher’s branding. This package is still in
beta; please contact <amurulidhar@guttmacher.org> or
<imaddowzimet@guttmacher.org> with any bug reports or suggestions (or
feel free to file an issue on this Github page directly).

## Installation

You can install the guttmacherggplottheme from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("GuttInst/guttmacherggplottheme")
```

## How to use the package

Here’s a simple example that shows you how to apply the
guttmacherggplottheme palettes and theme to a simple plot.

We use the R dataset created by Allison Horst called
[“palmerpenguins”](https://github.com/allisonhorst/palmerpenguins) for
these examples, which we load below; we also create a few sequential
categorical variables (for Bill Depth and Flipper Length) to use in our
examples.

``` r
# Load libraries
library(guttmacherggplottheme)
library(extrafont)
library(palmerpenguins)
library(tidyverse)

# Load 'palmerpenguins' dataset
data(package = 'palmerpenguins')

# Drop any missing or NA values from the 'penguins' dataset
penguins <- penguins %>% drop_na()

# Create bins for Bill.Depth variable
penguins$bill_depth_mm.Category <- cut(penguins$bill_depth_mm, 
                                    breaks = c(-Inf, 14, 17, 20, Inf),
                                    labels = c("Shallow", "Moderate", "Deep", "Very Deep"))

penguins$flipper_length_mm.Category <- cut(penguins$flipper_length_mm,
                                        breaks = seq(171, 233, length.out = 7),  # 6 categories
                                        labels = c("172-181.9 mm", "182-191.9 mm", "192-201.9 mm",
                                                  "202-211.9 mm", "212-221.9 mm", "222+ mm"), 
                                        right = TRUE)
```

Guttmacher figures typically use *National Condensed* or *Gotham
Narrow*; because these may not be available on your local machine, you
can use *Arial* as an alternative. In order to use any particular font,
you need to first import and load it using the `extrafont` package.

``` r
# Import and load fonts
font_import(pattern="arial.ttf", prompt=FALSE)
loadfonts(device = "win") 
```

Next, you can use one of the guttmacherggplottheme functions to define a
color palette for your plot; for categorical palettes, you will need to
specify the number of categories that need colors assigned.

``` r
# Define palette
categorical_palette <- guttmacherggplottheme::get_categorical_palette(4)        
```

Now that the libraries, fonts and palette are ready, you can create a
plot! Here’s a simple categorical plot that uses the Guttmacher theme
and palette.

``` r
################################################################################
# Example categorical plot 
################################################################################

ggplot(penguins, aes(x = species, fill = bill_depth_mm.Category)) +
  geom_bar(position = "stack") +
  scale_fill_manual(values = categorical_palette) + # Use palette here
  guttmacherggplottheme::guttmacher_theme(legend_border = FALSE, 
                                          legend.position.inside = c(x = .875, y = .95)) + 
  guides(fill = guide_legend(override.aes = list(size = 5, alpha=1))) +
  labs(title = "Bill Depth Categories by Species",
       x = "Species",
       y = "Count",
       fill = "Bill Depth Category") 
```

<img src="man/figures/README-example1-1.png" width="100%" />

## A few more examples

### Continuous palettes: Sequential

``` r

# Example plot using sequential continuous palette
sequential_palette <- guttmacherggplottheme::get_sequential_palette("blue")     # Define palette
ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm, 
                     color = flipper_length_mm)) +
  geom_point() + scale_color_gradientn(colors = sequential_palette,             # Use palette here
                                       breaks=c(min(penguins$flipper_length_mm)+2.5,
                                       mean(penguins$flipper_length_mm), 
                                       max(penguins$flipper_length_mm)-2), 
                                       labels = c(round(min(penguins$flipper_length_mm)),
                                                  round(mean(penguins$flipper_length_mm)),
                                                  round(max(penguins$flipper_length_mm)))) + 
  guttmacherggplottheme::guttmacher_theme(legend_border = FALSE) + 
  guides(color = guide_colorbar(ticks.colour = NA)) +
  labs(title = "Figure 2. Bill Length vs. Bill Width by Flipper Length", 
       x = "Bill Length", y = "Bill Width", color="Flipper Length")
```

<img src="man/figures/README-example_pt2-1.png" width="100%" />

### Continuous palettes: Divergent

``` r

# Example plot using divergent continuous palette
divergent_palette <- guttmacherggplottheme::get_divergent_palette()             # Define palette   
ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm, 
                     color = flipper_length_mm)) +
  geom_point() + scale_color_gradientn(colors = divergent_palette,              # Use palette here
                                       breaks=c(min(penguins$flipper_length_mm)+2.5,
                                       mean(penguins$flipper_length_mm), 
                                       max(penguins$flipper_length_mm)-2), 
                                       labels = c(round(min(penguins$flipper_length_mm)),
                                       round(mean(penguins$flipper_length_mm)),
                                       round(max(penguins$flipper_length_mm)))) + 
  guttmacherggplottheme::guttmacher_theme(legend_border = FALSE) + 
  guides(color = guide_colorbar(ticks.colour = NA)) +
  labs(title = "Figure 2. Bill Length vs. Bill Width by Flipper Length", 
       x = "Bill Length", y = "Bill Width", color="Flipper Length")
```

<img src="man/figures/README-example_pt3-1.png" width="100%" />

### Categorical palettes: Sequential

``` r

# Example plot using sequential categorical palette
sequential_categorical_palette <- 
  guttmacherggplottheme::get_sequential_categorical_palette("orange", 6)        # Define palette
ggplot2::ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm, 
                              color = flipper_length_mm.Category)) +
  geom_point() + scale_color_manual(values = sequential_categorical_palette) +  # Use palette here
  guttmacherggplottheme::guttmacher_theme() + 
  labs (title ="Figure 4. Bill Length vs. Bill Depth by Flipper Length", x = "Bill Length", 
        y = "Bill Width", color = "Flipper Length" ) 
```

<img src="man/figures/README-example_pt4-1.png" width="100%" />

### Categorical palettes: Divergent

Please note that the get_divergent_categorical_palette() function can
only currently be used for variables with exactly 6 levels.

``` r

# Example plot using divergent categorical palette; note that the divergent 
# categorical palette is intended for plots with 6 categorical variables
div_categorical_palette <- guttmacherggplottheme::get_divergent_categorical_palette()
ggplot2::ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm, 
                              color = flipper_length_mm.Category)) + 
  geom_point() + scale_color_manual(values = div_categorical_palette) +         # Use palette here
  guttmacherggplottheme::guttmacher_theme() + 
  labs (title ="Figure 5. Bill Length vs. Bill Depth by Flipper Length", x = "Bill Length", 
        y = "Bill Width", color = "Flipper Length" ) 
```

<img src="man/figures/README-example_pt5-1.png" width="100%" />

## Feedback

Guttmacherggplot theme is a new package and we would love to hear any
feedback or suggestions to help us improve! Please feel free to contact
us at <amurulidhar@guttmacher.org> or <imaddowzimet@guttmacher.org> with
any thoughts or concerns.
