#' This function takes the CDC data as input and filter based on the country input parameter
#'
#' Takes in CDC file, country as input paramaters and returns a filtered file for the country
#' @param ds CDC file
#' @param country Country
#' @return streamlined file based on input country
#' @export
filter.CDCData <- function(ds, country){

  if(country == "") return("Invalid country requested")

  df <- subset(ds,Country.Name==country)

  return(df)
}
