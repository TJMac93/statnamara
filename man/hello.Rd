\name{Test}
\alias{Test2}
\title{Statnamara}
\usage{"Test"}
\description{"This is the package" }
\examples{
ggplot2::ggplot(mtcars)+
  ggplot2::geom_point(aes(x = cyl, y = cyl))+
    theme_statnamara()
}
