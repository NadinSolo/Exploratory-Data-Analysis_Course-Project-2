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

# 2.Have total emissions from PM2.5 decreased in the Baltimore City,
# Maryland (fips == “24510”) from 1999 to 2008? Use the base plotting
# system to make a plot answering this question.
#Calulate total emissions of Baltimore city by year


baltimore <- subset(SumSCC_PM25, SumSCC_PM25$fips == "24510")

totalBaltimore <- aggregate(Emissions ~ year, baltimore, sum)

plot(totalBaltimore$year, totalBaltimore$Emissions, type = "o", 
     main = expression("Total Baltimore" ~ PM[2.5] ~ "Emissions by Year"),
     xlab = "Year", ylab = expression("Total Baltimore "~ PM[2.5] ~ "Emissions"),
     col = "blue")
#Create plot2.png
png(filename ='./plot2.png')
plot(totalBaltimore$year, totalBaltimore$Emissions, type = "o", 
     main = expression("Total Baltimore" ~ PM[2.5] ~ "Emissions by Year"),
     xlab = "Year", ylab = expression("Total Baltimore "~ PM[2.5] ~ "Emissions"),
     col = "blue")
dev.off()