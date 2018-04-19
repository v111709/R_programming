#' This function takes the filtered CDC data by inputed country as input and
#' will format the data as needed in order to generate a timeseries plot
#'
#' Takes in filtered CDC file based on requested country and formats the data and returns
#' the data in the appropriate format to generate a plot
#' @param cdcfilteredDs CDC file
#' @return timeseries chart based on the file based on input country
#' @import ggplot2
#' @import ggthemes
#' @export
format.CDCData <- function(cdcfilteredDs){

  x <- transpose(cdcfilteredDs)

  ycolnames <- colnames(cdcfilteredDs)

  year <- ycolnames[-1:-2]

  year <- substring(year,2,5)

  country <- x[1,]

  LifeExp <- x[-1:-2,]

  country2 <- rep(country, nrow(x)-2)

  country2 <- as.character(country2)

  abc <- cbind(country2,year,LifeExp)
  abc1 <- as.data.frame(abc)

  abc1$year <- as.Date(abc1$year, "%Y")
  abc1$LifeExp  <- as.numeric(as.character(abc1$LifeExp))

   ptitle <- paste("Life Expectancy at Birth for", country)

   countryPlot <- ggplot(data = abc1, aes(x = year, y = LifeExp))+
     geom_line(color = "#FC4E07", size = 1) +
     ggtitle(ptitle) +xlab("Year") + ylab("Age")+
     theme_bw()

    return(countryPlot)
}

