library(datasets)
library(ggplot2)
library(lattice)
library(data.table)
 


#----Read file from internet location using the data.table package
nile <- fread("https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/datasets/Nile.csv")
nile


#---plot no Package

plot.ts(Nile,col = "cyan", xlab = "Year", ylab = "Billions of cubic meters",pch=18, 
     main = "Nile River Flow Measurements - No Package ")

#---Lattice plot 
nileplot <-xyplot(Nile, xlab = "Year", ylab = "Billions of cubic meters",pch=18, 
                  main = "Nile River Flow Measurements - Lattice",col="cyan")
print(nileplot)

#---ggplot
 ggplot(nile, aes(x = nile$time, y =nile$Nile )) +
   geom_line() + labs(x="Year", y="Billions of cubic meters",color= "cyan",
                      title = "Nile River Flow Measurements - ggplot") +  
   geom_area(color = "cyan4", fill = "cyan4") + 
  scale_color_manual(values = c("midnightblue", "navy")) +
  scale_fill_manual(values = c("midnightblue", "navy")) + theme_light()

