dir.create("./air_pollution")
urlzip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(urlzip, destfile = "./air_pollution.zip" )
unzip("./air_pollution.zip", exdir = "./air_pollution" )
# Load the data:
C_PM25 <- readRDS("./air_pollution/summarySCC_PM25.rds")
ClassifCode <- readRDS("./air_pollution/Source_Classification_Code.rds")
library(ggplot2)

#6. Compare emissions from motor vehicle sources in Baltimore City with
#emissions from motor vehicle sources in Los Angeles County, 
#California (fips == “06037”). Which city has seen greater changes over time 
#in motor vehicle emissions?
BTM_LAG_MV <- subset(C_PM25, C_PM25$fips %in% c("24510","06037") & C_PM25$type == "ON-ROAD")
BTM_LAG_MVAGG <- aggregate(Emissions ~ year + fips, BTM_LAG_MV, sum)

ggplot(BTM_LAG_MVAGG, aes(year, Emissions, col = fips)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Baltimore and Los Angeles" ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
  labs(x = "Year", y = expression(~PM[2.5]~ "Motor Vehicle Emissions") ) +
  scale_colour_discrete(name = "City", labels = c("Los Angeles", "Baltimore")) +
  theme(legend.title = element_text(face = "bold"))

#Copy plot to PNG file (plot6.png)
dev.copy(png, file ='./plot6.png')
dev.off()