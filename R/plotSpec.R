#' A Spectrum Plotter
#'
#' This function allows you to plot spectra.
#' @param data Data to plot.
#' @keywords plot
#' @export
#' @examples
#' plotSpec(data)

plotSpec <- function(path=NA) {
  library(gsubfn)
  spectrum <- read.pattern(path, pattern = "^\\s*\\d.*", sep='')
  spectrum$V1 <- unlist(lapply(spectrum$V1,
                               function(x) as.numeric(gsub(',', '\\.', x))))
  spectrum$V2 <- unlist(lapply(spectrum$V2,
                               function(x) as.numeric(gsub(',', '\\.', x))))
  plot <- ggplot(data=spectrum, aes(x=V1, y=V2)) +
    geom_line()
  return(plot)
}