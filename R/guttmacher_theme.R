################################################################################
# 1. Define ggplot themes and palettes
################################################################################

#' Guttmacher ggplot theme
#'
#' @param base_family
#' @param base_size
#' @param show_legend
#'
#' @return
#' @export
#'
#' @examples
#' guttmacher_theme()
#' guttmacher_theme(base_size = 15)
guttmacher_theme <- function(base_family = "Arial", base_size = 11, show_legend = TRUE) {
  ret <- ggthemes::theme_tufte(base_family = base_family, base_size = base_size) +
    ggplot2::theme(plot.title = ggplot2::element_text(size = ggplot2::rel(1.2), face = "bold", hjust = 0.015, margin = ggplot2::margin(t=40, b=60, unit = "pt")),
          axis.title.x = ggplot2::element_text(size = ggplot2::rel(1), margin = ggplot2::margin(t=10.5, r=8.5, b=8.5, l=8.5, unit = "pt")),
          axis.title.y = ggplot2::element_text(size = ggplot2::rel(1), margin = ggplot2::margin(t=8.5, r=10.5, b=8.5, l=8.5, unit = "pt")),
          plot.background = ggplot2::element_rect(fill = "white",
                                         color = "white"),
          plot.margin = ggplot2::margin(t = 18.4, r = 18.4, b = 7, l = 7, unit = "pt"),
          legend.title = ggplot2::element_text(size = ggplot2::rel(.69)),
          legend.text = ggplot2::element_text(size = ggplot2::rel(.69)),
          legend.position = "inside", legend.position.inside = c(x = .925, y =.91),
          legend.background = ggplot2::element_rect(fill = "white", linetype = "solid", linewidth=0.2)
    )
  if(!show_legend) {
    ret <- ret + ggplot2::theme(
      legend.position = "none"  # Suppress legend if show_legend is FALSE
    )
  }
  ret
}

#' function that returns categorical palette
#'
#' @param num_categories
#'
#' @return categorical_palette
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

#' function that returns divergent palette
#'
#' @param
#'
#' @return divergent_palette
#' @export
#'
#' @examples
#' get_divergent_palette()
get_divergent_palette <- function(){
  return(colorRampPalette(c("#E66A18", "#EFA06B", "#F5C5A5", "#C5C8F5", "#A4A8F0", "#6169E5"))(100))
}

#' function that returns divergent categorical palette
#'
#' @param
#'
#' @return divergent_categorical_palette
#' @export
#'
#' @examples
#' get_divergent_categorical_palette()
get_divergent_categorical_palette <- function(){
  divergent_categorical_palette <- c("#E66A18", "#EFA06B", "#F5C5A5", "#C5C8F5", "#A4A8F0", "#6169E5")
  return(divergent_categorical_palette)
}

#' function that returns sequential palette
#'
#' @param base_color
#'
#' @return sequential_palette
#' @export
#'
#' @examples
#' get_sequential_palette()
#' get_sequential_palette(base_color="blue")
get_sequential_palette <- function(base_color="orange"){
  if((base_color != "orange") & (base_color != "blue")) stop("Sequential color palette can only have base color of 'blue' or 'orange'.")
  if(base_color == "orange") return(colorRampPalette(c("#F5C5A5", "#F2B28B", "#EFA06E", "#EC8E52", "#E97C35", "#E66A18"))(100))
  if(base_color == "blue") return(colorRampPalette(c("#C5C8F5", "#A4A8F0", "#6169E5"))(100))
}

#' function that returns sequential categorical palette
#'
#' @param base_color
#' @param num_categories
#'
#' @return sequential_categorical_palette
#' @export
#'
#' @examples
#' get_sequential_categorical_palette()
#' get_sequential_categorical_palette(base_color="blue")
get_sequential_categorical_palette <- function(base_color="orange", num_categories=6){
  if(!is.numeric(num_categories)) stop("The num_categories parameter must be an integer between 1 and 6.")
  if(!dplyr::between(num_categories, 1, 4)) stop("There is a maximum of 6 categorical colors available.")

  orange_palette <- c("#F5C5A5", "#F2B28B", "#EFA06E", "#EC8E52", "#E97C35", "#E66A18")
  blue_palette <- c("#C5C8F5" , "#B7BBF3", "#A4A8F0", "#8F94EC","#7B82E9", "#6169E5")

  if((base_color != "orange") & (base_color != "blue")) stop("Sequential color palette can only have base color of 'blue' or 'orange'.")
  if(base_color == "orange") return(orange_palette[c(1:as.integer(num_categories))])
  if(base_color == "blue") return(blue_palette[c(1:as.integer(num_categories))])
}







