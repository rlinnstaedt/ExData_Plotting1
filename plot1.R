##Using the sqldf package to filter the table and load it in

library(sqldf)
febHPC <- read.csv.sql("household_power_consumption.txt",
                       sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",
                       header = TRUE,
                       stringsAsFactors = FALSE,
                       sep=';')

##Convert Date and Time from character string
febHPC$DateTime <- as.POSIXct(paste(febHPC$Date, febHPC$Time), format = "%d/%m/%Y %H:%M:%S")

##Plot 1:  Global Active Power (kilowatts) vs Frequency
with(febHPC, hist(Global_active_power, 
                  col = "red",
                  main = "Global Active Power",
                  xlab = "Global Active Power (kilowatts)",
                  ylab = "Frequency"))
dev.copy(png, file = "plot1.png")
dev.off()