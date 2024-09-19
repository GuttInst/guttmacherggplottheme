
<!-- README.md is generated from README.Rmd. Please edit that file -->

# guttmacherggplottheme

<!-- badges: start -->
<!-- badges: end -->

The goal of guttmacherggplottheme is to provide ggplot themes and color
palettes that align with Guttmacher’s branding.

Please note that the get_divergent_categorical_palette() function is
only intended for plots with exactly 6 categorical variables.

## Installation

You can install the guttmacherggplottheme from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("GuttInst/guttmacherggplottheme")
```

## Example

Here’s a simple example that shows you how to make a plot using the
guttmacherggplottheme palettes and theme:

First, you’ll need to load the necessary libraries and then load the
dataset. This examples uses the built-in R dataset called “iris.” The
next step is to prep the dataset for use by transforming two of the
continuous variables, “Sepal.length” and “Petal.length” into categorical
variables by binning the values into categories based on discrete
intervals.

``` r
# Load libraries
library(guttmacherggplottheme)
library(ggplot2)
library(ggthemes)
library(extrafont)
library(dplyr)

# Load iris dataset
data(iris)

# Create bins for Petal.Length variable
iris <- iris %>%
  mutate(Petal.Length.Category = cut(Petal.Length,
                                      breaks = c(0, 2, 3, 4, 5, 6, max(iris$Petal.Length)),
                                      labels = c("1–1.9", "2–2.9", "3–3.9", "4–4.9", "5–5.9", "6+"),
                                      right = TRUE))

# Create bins for Sepal.Length variable
iris$Sepal.Length.Category <- cut(iris$Sepal.Length, 
                                   breaks = c(-Inf, 5, 6, 7, Inf), 
                                   labels = c("Short", "Medium", "Long", "Very Long"))
```

Then, to be able to use the Guttmacher brand aligned fonts you need to
import the Arial font file. This code ensures that the Guttmacher fonts
are available for use in your R environment.

``` r
# Import and load fonts
font_import(pattern="arial.ttf", prompt=FALSE)
loadfonts()
```

Next, you can use one of the guttmacherggplottheme functions to define a
palette for your plot.

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

ggplot(iris, aes(x = Species, fill = Sepal.Length.Category)) +
  geom_bar(position = "stack") +
  scale_fill_manual(values = categorical_palette) + # Use palette here
  guttmacherggplottheme::guttmacher_theme() + 
  labs(title = "Sepal Length Categories by Species",
       x = "Species",
       y = "Count",
       fill = "Sepal Length Category") 
```

<img src="man/figures/README-example1-1.png" width="100%" />

Here are a few more examples of how the various palettes and theme can
be used:

``` r
################################################################################
# Continuous Plot Examples
################################################################################

# Example plot using sequential continuous palette
sequential_palette <- guttmacherggplottheme::get_sequential_palette("blue")     # Define palette
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Petal.Length)) +
  geom_point() + scale_color_gradientn(colors = sequential_palette,             # Use palette here
                                       breaks=c(min(iris$Petal.Length)+0.25,
                                       median(iris$Petal.Length), 
                                       max(iris$Petal.Length)-0.2), 
                                       labels = c(1,round(median(iris$Petal.Length)),
                                                  round(max(iris$Petal.Length)))) + 
  guttmacherggplottheme::guttmacher_theme(legend_border = FALSE) + 
  guides(color = guide_colorbar(ticks.colour = NA)) +
  labs(title = "Figure 2. Sepal Length vs. Sepal Width by Petal Length", 
       x = "Sepal Length", y = "Sepal Width", color="Petal Length")
```

<img src="man/figures/README-example_pt2-1.png" width="100%" />

``` r

# Example plot using divergent continuous palette
divergent_palette <- guttmacherggplottheme::get_divergent_palette()             # Define palette   
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Petal.Length)) +
  geom_point() + scale_color_gradientn(colors = divergent_palette,              # Use palette here
                                       breaks=c(min(iris$Petal.Length)+0.25,
                                       median(iris$Petal.Length), 
                                       max(iris$Petal.Length)-0.2), 
                                       labels = c(1,round(median(iris$Petal.Length)),
                                                  round(max(iris$Petal.Length)))) + 
  guttmacherggplottheme::guttmacher_theme(legend_border = FALSE) + 
  guides(color = guide_colorbar(ticks.colour = NA)) +
  labs(title = "Figure 3. Sepal Length vs. Sepal Width by Petal Length", x = "Sepal Length", 
       y = "Sepal Width", color="Petal Length") 
```

<img src="man/figures/README-example_pt2-2.png" width="100%" />

``` r

################################################################################
# Categorical Plot Examples
################################################################################

# Example plot using sequential categorical palette
sequential_categorical_palette <- 
  guttmacherggplottheme::get_sequential_categorical_palette("orange", 6)        # Define palette
ggplot2::ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Petal.Length.Category)) +
  geom_point() + scale_color_manual(values = sequential_categorical_palette) +  # Use palette here
  guttmacherggplottheme::guttmacher_theme() + 
  labs (title ="Figure 4. Sepal Length vs. Sepal Width by Petal Length", x = "Sepal Length", 
        y = "Sepal Width", color = "Petal Length" ) 
```

<img src="man/figures/README-example_pt2-3.png" width="100%" />

``` r

# Example plot using divergent categorical palette; note that the divergent 
# categorical palette is intended for plots with 6 categorical variables
divergent_categorical_palette <- guttmacherggplottheme::get_divergent_categorical_palette()   # Define palette
ggplot2::ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Petal.Length.Category)) +
  geom_point() + scale_color_manual(values = divergent_categorical_palette) +   # Use palette here
  guttmacherggplottheme::guttmacher_theme() + 
  labs (title ="Figure 5. Sepal Length vs. Sepal Width by Petal Length", x = "Sepal Length", 
        y = "Sepal Width", color = "Petal Length" ) 
```

<img src="man/figures/README-example_pt2-4.png" width="100%" />

## Feedback

Guttmacherggplot theme is a new package and we would love to hear any
feedback or suggestions to help us improve! Please feel free to contact
us at <amurulidhar@guttmacher.org> or <imaddowzimet@guttmacher.org> with
any thoughts or concerns.
