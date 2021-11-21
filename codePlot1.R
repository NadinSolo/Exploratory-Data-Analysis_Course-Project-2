# Download and unzip the file:
dir.create("./air_pollution")
urlzip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(urlzip, destfile = "./air_pollution.zip" )
unzip("./air_pollution.zip", exdir = "./air_pollution" )
# Load the data:
SumSCC_PM25 <- readRDS("./air_pollution/summarySCC_PM25.rds")
ClassifCode <- readRDS("./air_pollution/Source_Classification_Code.rds")
str(SumSCC_PM25)
str(ClassifCode)
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
#Using the base plotting system, make a plot showing the total PM2.5 emission
#from all sources for each of the years 1999, 2002, 2005, and 2008.
totSumSCC_PM25<- aggregate(Emissions ~ year, SumSCC_PM25, sum)

plot(totSumSCC_PM25$year, totSumSCC_PM25$Emissions, type = "o",
     col = "red", main = expression("Total US "~ PM[2.5]~ "Emissions by Year"),
     ylab = expression("Total US "~   PM[2.5] ~ "Emissions"), xlab = "Year")
#Create plot1.png
png(filename ='./plot1.png')
plot(totSumSCC_PM25$year, totSumSCC_PM25$Emissions, type = "o",
     col = "red", main = expression("Total US "~ PM[2.5]~ "Emissions by Year"),
     ylab = expression("Total US "~   PM[2.5] ~ "Emissions"), xlab = "Year")
dev.off()


