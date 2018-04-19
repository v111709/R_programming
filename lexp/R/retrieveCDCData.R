#' This funtion will retrieve the Life expectancy at birth in total (years) CSV file from the CDC site
#'
#' It does not take any parameters get the data and rename the columns
#' @param null not input parameter
#' @return life expectancy file from CDC website
#' @export
#' @import data.table
#' @import zip
#'
retrieve.CDCData <- function()
{
#---point to the CDC URL for life expectancy data -------------------#
  url <- 'http://api.worldbank.org/v2/en/indicator/SP.DYN.LE00.IN?downloadformat=csv'

#--- Assign and Set a temporary director -------------------#
  tempdir <- getwd()
   if (!is.null(tempdir)) setwd(tempdir)

#--- Create a temporary file -------------------#
  tempfile <- "lexpfile.zip"

#--- Download the CDC zipped data into temp file -------------------#
  download.file(url, tempfile, mode = "wb")

#--- Unzip the CDC files into a temporary directory defined above-------------------#
  filenames <- unzip (tempfile, exdir = tempdir)

#--- Read the CDC data file -------------------#
  ds = read.csv("API_SP.DYN.LE00.IN_DS2_en_csv_v2.csv", skip = 4, header = T)

#--- Remove unwanted and unpopulated columns -------------------#
  cdcData <- subset(ds, select = -c(Indicator.Name, Indicator.Code, X2016, X2017, X) )

  return(cdcData)
}

