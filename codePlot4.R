#4. Across the United States, how have emissions from coal combustion-related
#sources changed from 1999-2008?
dir.create("./air_pollution")
urlzip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(urlzip, destfile = "./air_pollution.zip" )
unzip("./air_pollution.zip", exdir = "./air_pollution" )
# Load the data:
C_PM25 <- readRDS("./air_pollution/summarySCC_PM25.rds")
ClassifCode <- readRDS("./air_pollution/Source_Classification_Code.rds")

SCCcoal <- ClassifCode[grepl("coal", ClassifCode$Short.Name, ignore.case = T),]
PM25coal <- C_PM25[C_PM25$ClassifCode %in% SCCcoal$ClassifCode,]
totalCoal <- aggregate(Emissions ~ year + type, PM25coal, sum)

ggplot(totalCoal, aes(year, Emissions, col = type)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Total US" ~ PM[2.5] ~ "Coal Emission by Type and Year")) +
  xlab("Year") +
  ylab(expression("US " ~ PM[2.5] ~ "Coal Emission")) +
  scale_colour_discrete(name = "Type of sources") +
  theme(legend.title = element_text(face = "bold"))
#Create plot4.png
png(filename ='./plot4.png')
ggplot(totalCoal, aes(year, Emissions, col = type)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Total US" ~ PM[2.5] ~ "Coal Emission by Type and Year")) +
  xlab("Year") +
  ylab(expression("US " ~ PM[2.5] ~ "Coal Emission")) +
  scale_colour_discrete(name = "Type of sources") +
  theme(legend.title = element_text(face = "bold"))
dev.off()
