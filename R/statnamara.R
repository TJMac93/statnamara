library(ggplot2)
library("extrafont")

extrafont::loadfonts()


# https://meghan.rbind.io/blog/2022-10-11-creating-custom-color-palettes-with-ggplot2/
# Colour theme ----
statnamara_colours <- function(...){
  my_cols <- c(
    'statnamara_blue'   = '#406073',
    'bright_blue'    = '#619eb2',
    'nearly_black'   = '#172f46',
    'light_blue'   = '#6ca2d9',
    'pale_blue'      = '#c2e5ff',
    'clay'           = '#ba5625',
    'dark_gold'      = '#c38117',
    'tan_brown'          = '#946b02',
    'dark_brown'     = '#6b4c01',
    'darker_blue'    = '#0b4da2'
  )
  cols <- c(...)
  if (is.null(cols))
    return (my_cols)
  my_cols[cols]
}
statnamara_palette <- function(palette='binary', ...){
  my_palette <- list(
    'main' = statnamara_colours('statnamara_blue',
                                'bright_blue',
                                'nearly_black',
                                'light_blue',
                                'pale_blue',
                                "clay",
                                'dark_gold',
                                'tan_brown',
                                'dark_brown',
                                'darker_blue' ),
    'small' = statnamara_colours("statnamara_blue",
                                 "lighter_blue",
                                 "clay",
                                 "tan_brown",
                                 "nearly_black"),
    'binary' = statnamara_colours("statnamara_blue",
                                  "bright_blue"),
    'dark' = statnamara_colours("statnamara_blue",
                                "dark_gold",
                                'darker_blue',
                                'dark_brown'),
    'blues' = statnamara_colours("statnamara_blue",
                                 "bright_blue",
                                 'light_blue',
                                 'pale_blue')

  )

  my_palette[[palette]]
}

palette_generation <- function(palette = 'main', direction = 1) {
  function(n) {
    if( n > length(statnamara_palette(palette)))
      warning("Not enough colours in palette")

    else {
      all_colours  <- statnamara_palette(palette)
      all_colours  <- unname(unlist(all_colours))
      all_colours  <- if (direction >=0) all_colours else rev(all_colours)
      colours_list <- all_colours[1:n]
    }
  }
}

scale_fill_statnamara <- function(palette = 'main', direction = 1, ...) {

  ggplot2::discrete_scale(
    'fill', 'statnamara',
    palette_generation(palette,direction),
    ...
  )
}

scale_colour_statnamara <- function(palette = 'main', direction = 1, ...) {

  ggplot2::discrete_scale(
    "colour", "statnamara",
    palette_generation(palette, direction),
    ...
  )
}


# Theme ----
theme_statnamara <- function(...) {
  cowplot::theme_cowplot()+
  ggplot2::theme(title = element_text(family="Roboto Medium", face = "italic", size = 18),
                 plot.subtitle = element_text(family="Roboto Medium", face = "italic", size = 15),
                 plot.caption = element_text(family="Roboto Light", face = "italic", size = 14),

                 panel.border = element_rect(colour = "black", fill=NA, linewidth=1),
                 panel.background = element_rect(colour = "black", fill = "white"),
                 panel.grid.major.x = element_line(colour="grey90", linewidth = 1, linetype = 4),
                 panel.grid.minor.x = element_line(colour="grey90", linewidth = 0.5, linetype = 4),


                 strip.text = element_text(family="Roboto", face = "bold.italic", size = 13),
                 strip.background = element_rect(fill = "#07359080", colour = "black"),

                 axis.title = element_text(family="Roboto",face = "italic",size = 16, colour = "black"),
                 axis.ticks.length = unit(2.5, units = "pt"),
                 # axis.text.y = element_text(size = 12),
                 # axis.text.x = element_text(size = 12),

                 legend.position = 'bottom',
                 legend.text = element_text(size = 14),
                 legend.title = element_text(size = 15),

                 plot.margin = unit(c(1,1,1,2), 'cm'),

        ...
  )
}


theme_statnamara_quarto <- function(...) {
  cowplot::theme_cowplot()+
  ggplot2::theme(title = element_text(family="Roboto Medium", face = "italic", size = 14),
                 plot.subtitle = element_text(family="Roboto Medium", face = "italic", size = 12),
                 plot.caption = element_text(family="Roboto Light", face = "italic", size = 10),

                 panel.border = element_rect(colour = "black", fill=NA, linewidth=1),
                 panel.background = element_rect(colour = "black", fill = "white"),
                 panel.grid.major.x = element_line(colour="grey90", linewidth = 1, linetype = 4),
                 panel.grid.minor.x = element_line(colour="grey90", linewidth = 0.5, linetype = 4),


                 strip.text = element_text(family="Roboto", face = "bold.italic", size = 11),
                 strip.background = element_rect(fill = "#07359080", colour = "black"),

                 axis.title = element_text(family="Roboto",face = "italic",size = 12, colour = "black"),
                 axis.ticks.length = unit(2.5, units = "pt"),
                 axis.text.y = element_text(size = 12),
                 axis.text.x = element_text(size=12),

                 legend.position = 'bottom',
                 legend.text = element_text(size = 12),
                 legend.title = element_text(size = 13),

                 plot.margin = unit(c(1,1,1,2), 'cm'),

        ...
  )
}

