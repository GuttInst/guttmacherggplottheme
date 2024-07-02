################################################################################
# 1. Define ggplot themes
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
    ggplot2::theme(plot.title = ggplot2::element_text(size = ggplot2::rel(1.2), face = "bold", hjust = 0.015, ggplot2::margin(t=40, b=60, "pt")),
          axis.title.x = ggplot2::element_text(size = ggplot2::rel(1), margin = ggplot2::margin(t=10.5, r=8.5, b=8.5, l=8.5, "pt")),
          axis.title.y = ggplot2::element_text(size = ggplot2::rel(1), margin = ggplot2::margin(t=8.5, r=10.5, b=8.5, l=8.5, "pt")),
          plot.background = ggplot2::element_rect(fill = "white",
                                         color = "white"),
          plot.margin = ggplot2::margin(t = 18.4, r = 18.4, b = 7, l = 7, unit = "pt"),
          legend.title = ggplot2::element_text(size = ggplot2::rel(.69)),
          legend.text = ggplot2::element_text(size = ggplot2::rel(.69)),
          legend.position = c(x = .925, y =.91),
          legend.background = ggplot2::element_rect(fill = "white", linetype = "solid", size=0.2)
    )
  if(!show_legend) {
    ret <- ret + ggplot2::theme(
      legend.position = "none"  # Suppress legend if show_legend is FALSE
    )
  }
  ret
}

