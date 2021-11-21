dir.create("./air_pollution")
urlzip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(urlzip, destfile = "./air_pollution.zip" )
unzip("./air_pollution.zip", exdir = "./air_pollution" )
# Load the data:
C_PM25 <- readRDS("./air_pollution/summarySCC_PM25.rds")
ClassifCode <- readRDS("./air_pollution/Source_Classification_Code.rds")

#5.How have emissions from motor vehicle sources changed from 1999-2008 
#in Baltimore City?
library(ggplot2)
BTMMotorV <- subset(C_PM25, C_PM25$fips == "24510" & C_PM25$type == "ON-ROAD")
BTMMotorVehicle <- aggregate(Emissions ~ year, BTMMotorV, sum)

ggplot(BTMMotorVehicle, aes(year, Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
    ggtitle(expression("Baltimore " ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
  xlab("Year") +
  ylab(expression(~PM[2.5]~ "Motor Vehicle Emissions"))

#Create plot5.png
png(filename ='./plot5.png')
ggplot(BTMMotorVehicle, aes(year, Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  ggtitle(expression("Baltimore " ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
  xlab("Year") +
  ylab(expression(~PM[2.5]~ "Motor Vehicle Emissions"))
dev.off()

