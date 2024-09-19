################################################################################
# 1. Define ggplot themes and palettes
################################################################################

#' Guttmacher ggplot theme
#'
#' @param base_family A string value representing base family name.
#' @param base_size A numeric value representing base font size.
#' @param show_legend A Boolean value indicating whether to show the legend or not.
#'
#' @return A ggplot theme that fits Guttmacher's branding guidelines.
#' @export
#'
#' @examples
#' guttmacher_theme()
#' guttmacher_theme(base_size = 15)
guttmacher_theme <- function(base_family = "Arial", base_size = 11, show_legend = TRUE, legend_border = TRUE) {
  ret <- ggthemes::theme_tufte(base_family = base_family, base_size = base_size) +
    ggplot2::theme(plot.title = ggplot2::element_text(size = ggplot2::rel(1.2), face = "bold", hjust = 0.015, margin = ggplot2::margin(t=40, b=60, unit = "pt")),
          axis.title.x = ggplot2::element_text(size = ggplot2::rel(1), margin = ggplot2::margin(t=10.5, r=8.5, b=8.5, l=8.5, unit = "pt")),
          axis.title.y = ggplot2::element_text(size = ggplot2::rel(1), margin = ggplot2::margin(t=8.5, r=10.5, b=8.5, l=8.5, unit = "pt")),
          plot.background = ggplot2::element_rect(fill = "white",
                                         color = "white"),
          plot.margin = ggplot2::margin(t = 18.4, r = 18.4, b = 7, l = 7, unit = "pt"),
          legend.title = ggplot2::element_text(size = ggplot2::rel(.69)),
          legend.text = ggplot2::element_text(size = ggplot2::rel(.69), family = base_family),
          legend.position = "inside", legend.position.inside = c(x = .925, y =.91),
          legend.background = if (legend_border) ggplot2::element_rect(fill = "white", linetype = "solid", linewidth=0.2) else element_blank()
    )
  if(!show_legend) {
    ret <- ret + ggplot2::theme(
      legend.position = "none"  # Suppress legend if show_legend is FALSE
    )
  }
  ret
}

#' Returns categorical palette
#'
#' @param num_categories An integer representing the number of categorical variables.
#'
#' @return categorical_palette A vector of categorical colors.
#' @export
#'
#' @examples
#' get_categorical_palette()
#' get_categorical_palette(num_categories=2)
get_categorical_palette <- function(num_categories=4){
  if(!is.numeric(num_categories)) stop("The num_categories parameter must be an integer between 1 and 4.")
  if(!dplyr::between(num_categories, 1, 4)) stop("There is a maximum of 4 categorical colors available.")
  categorical_palette <- c("#2DBF4E", "#00ABCB", "#FFCE01", "#E66A18")
  return(categorical_palette[c(1:as.integer(num_categories))])
}

#' Returns divergent palette
#'
#'
#' @return divergent_palette A vector of divergent colors.
#' @export
#'
#' @examples
#' get_divergent_palette()
get_divergent_palette <- function(){
  return(colorRampPalette(c("#E66A18", "#EFA06B", "#F5C5A5", "#C5C8F5", "#A4A8F0", "#6169E5"))(100))
}

#' Returns divergent categorical palette containing 6 colors
#' Note: this function is intended for plots with exactly 6 categorical variables.
#'
#'
#' @return divergent_categorical_palette A vector of 6 divergent categorical colors.
#' @export
#'
#' @examples
#' get_divergent_categorical_palette()
get_divergent_categorical_palette <- function(){
  divergent_categorical_palette <- c("#E66A18", "#EFA06B", "#F5C5A5", "#C5C8F5", "#A4A8F0", "#6169E5")
  return(divergent_categorical_palette)
}

#' Returns sequential palette
#'
#' @param base_color A string value representing the base color of the sequential palette.
#'
#' @return sequential_palette A vector of sequential colors.
#' @export
#'
#' @examples
#' get_sequential_palette()
#' get_sequential_palette(base_color="blue")
get_sequential_palette <- function(base_color="orange"){
  if((base_color != "orange") & (base_color != "blue") & (base_color != "green")
     & (base_color != "light blue") & (base_color != "yellow") &
     (base_color != "purple") & (base_color != "black"))
    stop("Sequential color palette can only have a base color of 'blue', 'orange', 'green', 'light blue', 'yellow', 'purple', or 'black'.")
  if(base_color == "orange") return(colorRampPalette(c("#F5C5A5", "#F2B28B", "#EFA06E", "#EC8E52", "#E97C35", "#E66A18"))(100))
  if(base_color == "blue") return(colorRampPalette(c("#c5c8f5", "#B8BBF3", "#A2A7F0", "#8D92EC", "#777DE9", "#6168E5"))(100))
  if(base_color == "green") return(colorRampPalette(c("#A5E3B3", "#8DDC9F", "#75D58B", "#5DCE76", "#45C662", "#2DBF4E"))(100))
  if(base_color == "light blue") return(colorRampPalette(c("#A3E1EC", "#83D6E6", "#62CBDF", "#41C1D8", "#21B6D2", "#00ABCB"))(100))
  if(base_color == "yellow") return(colorRampPalette(c("#FFF1B5", "#FFEA91", "#FFE36D", "#FFDC49", "#FFD525", "#FFCE01"))(100))
  if(base_color == "purple") return(colorRampPalette(c("#C7C6DB", "#A5A4CF", "#8382B0", "#61609A", "#403E85", "#1E1C6F"))(100))
  if(base_color == "black") return(colorRampPalette(c("#BFBFBF", "#999999", "#737373", "#4C4C4C", "#262626", "#000000"))(100))
}

#' Returns sequential categorical palette
#'
#' @param base_color A string value representing the base color of the sequential palette.
#' @param num_categories An integer representing the number of categorical variables.
#'
#' @return sequential_categorical_palette A vector of sequential categorical colors.
#' @export
#'
#' @examples
#' get_sequential_categorical_palette()
#' get_sequential_categorical_palette(base_color="blue")
get_sequential_categorical_palette <- function(base_color="orange", num_categories=6){
  if(!is.numeric(num_categories)) stop("The num_categories parameter must be an integer between 1 and 6.")
  if(!dplyr::between(num_categories, 1, 6)) stop("There is a maximum of 6 categorical colors available.")
  if((base_color != "orange") & (base_color != "blue") & (base_color != "green")
     & (base_color != "light blue") & (base_color != "yellow") &
     (base_color != "purple") & (base_color != "black"))
    stop("Sequential color palette can only have a base color of 'blue', 'orange', 'green', 'light blue', 'yellow', 'purple', or 'black'.")

  orange_palette <- c("#F5C5A5", "#F2B28B", "#EFA06E", "#EC8E52", "#E97C35", "#E66A18")
  blue_palette <- c("#C5C8F5" , "#B7BBF3", "#A4A8F0", "#8F94EC","#7B82E9", "#6169E5")
  green_palette <- c("#A5E3B3", "#8DDC9F", "#75D58B", "#5DCE76", "#45C662", "#2DBF4E")
  lightblue_palette <- c("#A3E1EC", "#83D6E6", "#62CBDF", "#41C1D8", "#21B6D2", "#00ABCB")
  yellow_palette <- c("#FFF1B5", "#FFEA91", "#FFE36D", "#FFDC49", "#FFD525", "#FFCE01")
  purple_palette <- c("#C7C6DB", "#A5A4CF", "#8382B0", "#61609A", "#403E85", "#1E1C6F")
  black_palette <- c("#BFBFBF", "#999999", "#737373", "#4C4C4C", "#262626", "#000000")

  if((base_color != "orange") & (base_color != "blue")) stop("Sequential color palette can only have base color of 'blue' or 'orange'.")
  if(base_color == "orange") return(orange_palette[c(1:as.integer(num_categories))])
  if(base_color == "blue") return(blue_palette[c(1:as.integer(num_categories))])
  if(base_color == "green") return(green_palette[c(1:as.integer(num_categories))])
  if(base_color == "light blue") return(lightblue_palette[c(1:as.integer(num_categories))])
  if(base_color == "yellow") return(yellow_palette[c(1:as.integer(num_categories))])
  if(base_color == "purple") return(purple_palette[c(1:as.integer(num_categories))])
  if(base_color == "black") return(black_palette[c(1:as.integer(num_categories))])

}







