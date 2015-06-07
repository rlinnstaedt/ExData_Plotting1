##Using the sqldf package to filter the table and load it in

library(sqldf)
febHPC <- read.csv.sql("household_power_consumption.txt",
                       sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",
                       header = TRUE,
                       stringsAsFactors = FALSE,
                       sep=';')

##Convert Date and Time from character string
febHPC$DateTime <- as.POSIXct(paste(febHPC$Date, febHPC$Time), format = "%d/%m/%Y %H:%M:%S")

##Plot 3: Energy sub metering by DateTime
png("plot3.png", width = 480, height = 480)
with(febHPC, plot(Sub_metering_1 ~ DateTime,
                  type = "l",
                  xlab = "",
                  ylab = "Energy sub metering",
                  col = "black",
                  
))
with(febHPC, points(Sub_metering_2 ~ DateTime,
                    type = "l",
                    col = "red"))
with(febHPC, points(Sub_metering_3 ~ DateTime,
                    type = "l",
                    col = "blue"))
legend("topright", col = c("black", "red", "blue"),                        
       lty = 1,
       lwd = 2,
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"))

dev.off()