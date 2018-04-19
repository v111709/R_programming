#' take input x (country), reads the world bank repository data for life expectancy at birth
#' and returns a timeseries chart for the inputed country for the period of 1960 to 2015
#'
#' @param x input parameter containing the country requesting life timeseries
#' @return timeseries chart for the inputed country for years 1960-2015
#' @export
#' @import data.table

getCDCData <- function(country) {

  if (!requireNamespace("data.table", quietly = TRUE))
  {
    return("Please install Package \"data.table\" in order to proceed.")
  }
  else if (!requireNamespace("zip", quietly = TRUE))
  {
    return("Please install Package \"zip\" in order to proceed.")
  }
  else if (!requireNamespace("ggplot2", quietly = TRUE))
  {
    return("Please install Package \"ggplot2\" in order to proceed.")
  }
  else if (!requireNamespace("ggthemes", quietly = TRUE))
  {
    return("Please install Package \"ggthemes\" in order to proceed.")
  }
  else
  {

   #------------ retrieve.CDCData() function
  dataset = retrieve.CDCData()
  #---Validate the country
  if (is.na(match(country,dataset$Country.Name)))
  {
    return("Please enter a valid country name with first letter capitalized")
  } else
  {


  #------------ FilterCDCData() testing function
  cdcfilteredDs <- filter.CDCData(dataset,country)


  #----------Format filtered cdcdata to generate the plot
  lexpplot <- format.CDCData(cdcfilteredDs)
  }
  }
  return(lexpplot)
}


