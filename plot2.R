##Using the sqldf package to filter the table and load it in

library(sqldf)
febHPC <- read.csv.sql("household_power_consumption.txt",
                       sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",
                       header = TRUE,
                       stringsAsFactors = FALSE,
                       sep=';')

##Convert Date and Time from character string
febHPC$DateTime <- as.POSIXct(paste(febHPC$Date, febHPC$Time), format = "%d/%m/%Y %H:%M:%S")

##Plot 2: Global Active Power by DateTime
with(febHPC, plot(Global_active_power ~ DateTime,
                  type = "l",
                  xlab = "",
                  ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png")
dev.off()