
Sys.setlocale(category = "LC_ALL", locale = "Turkish")

if (!require(rjson)) install.packages('rjson')
if (!require(dplyr)) install.packages('dplyr')
if (!require(readxl)) install.packages('readxl')
if (!require(treemap)) install.packages('treemap')
if (!require(RColorBrewer)) install.packages('RColorBrewer')
if (!require(data.table)) install.packages('data.table')
if (!require(d3Tree)) install.packages('d3Tree')

library(rjson)
library(dplyr)
library(readxl)
library(treemap)
library(RColorBrewer)
library(data.table)
library(d3Tree)

treemap_data <- data.table(read_xlsx("C://Users//oguzo//Desktop//MENA//CEE-MENA//Tree Map R//treemap.xlsx"))

for (y in treemap_data$Y??l) {
  data = treemap_data[Y??l == y]
  data = na.omit(data)
  data = data[X_share >0.13]
  
  png(paste0('./',y,'.png'),
      width=1920, height=1080)
  treemap(data, index = c("Grup", "x_name"),
          vSize = "??hracat Dolar", 
          type = "categorical",
          vColor = "Grup",
          aspRatio = 1920/1080,
          palette = as.vector(unique(data[order(data$Grup),]$Renk)),
          title.legend = NA,
          title="",               
          position.legend = "none",
          lowerbound.cex.labels=0.2, 
          fontsize.labels=c(0,9),
          fontsize.title = 20,
          fontcolor.labels="white",
          fontface.labels=c(2,2),
          align.labels=list(
            c("center", "center"), 
            c("center", "center")
          ),
          overlap.labels=0.1,                     
          inflate.labels=T,
          border.col=c("white"),
          border.lwds=c(2,1)
          
  )
  dev.off()
  
}
