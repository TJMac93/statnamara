pkgname <- "statnamara"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('statnamara')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("hello")
### * hello

flush(stderr()); flush(stdout())

### Name: Test
### Title: Statnamara
### Aliases: Test2

### ** Examples

ggplot2::ggplot(mtcars)+
  ggplot2::geom_point(aes(x = cyl, y = cyl))+
    theme_statnamara()



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
