setwd("ExData_Plotting1")

power <- read.table("household_power_consumption.txt",
                    sep = ";", 
                    header = TRUE, 
                    stringsAsFactors = FALSE)

# look at structure of data 
dim(power)
str(power)



# subset to just two desired days
power <- power[power$Date == "1/2/2007" |
                 power$Date == "2/2/2007",]

# convert to date
power$Date_Time <- paste0(power$Date, " ", power$Time)
power$Date_Time <- strptime(power$Date_Time, "%d/%m/%Y %H:%M:%S")

# convert date and time to appropriate types
power$Global_active_power <- as.numeric(power$Global_active_power)



png(file = 'plot4.png', 
    width = 480, 
    height = 480,
    units = "px")

# set window for 4 plots
par(mfrow=c(2, 2))

# Plot 2
plot(x = power$Date_Time,
     y = power$Global_active_power,
     xaxt = "n",
     type = "l",
     axes = FALSE,
     ylab = "Global Active Power",
     xlab = "")
box(which = "plot", lty = "solid")
axis.POSIXct(side = 1, 
             labels = c("Thu", "Fri", "Sat"),
             at = c("2007-02-01 00:00:00",
                    "2007-02-02 00:00:00",
                    "2007-02-02 23:59:00"))
axis(side = 2, at = seq(0, 6, 2))

# New Plot - voltage by datetime 
plot(x = power$Date_Time,
     y = power$Voltage,
     xaxt = "n",
     type = "l",
     axes = FALSE,
     ylab = "Voltage",
     xlab = " datetime")
box(which = "plot", lty = "solid")
axis.POSIXct(side = 1, 
             labels = c("Thu", "Fri", "Sat"),
             at = c("2007-02-01 00:00:00",
                    "2007-02-02 00:00:00",
                    "2007-02-02 23:59:00"))
axis(side = 2, at = seq(234, 246, 2))




# Plot 3
# convert date and time to appropriate types
power$Global_active_power <- as.numeric(power$Global_active_power)
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)

plot(x = power$Date_Time,
     y = power$Sub_metering_1,
     col = "black",
     type = "l",
     axes = FALSE,
     ylab = "Energy Sub metering",
     xlab = "")
lines(power$Date_Time, power$Sub_metering_2, col = "red")
lines(power$Date_Time, power$Sub_metering_3, col = "blue")
legend("topright",
       bty = "n",
       lty = "solid",
       col = c("black", "red", "blue") ,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
)
box(which = "plot", lty = "solid")
axis.POSIXct(side = 1, 
             labels = c("Thu", "Fri", "Sat"),
             at = c("2007-02-01 00:00:00",
                    "2007-02-02 00:00:00",
                    "2007-02-02 23:59:00"))

axis(side = 2, at = seq(0, 30, 10))

# New Plot - global_reactive_power by datetime 
plot(x = power$Date_Time,
     y = power$Global_reactive_power,
     xaxt = "n",
     type = "l",
     axes = FALSE,
     ylab = "Global_reactive_power",
     xlab = " datetime")
box(which = "plot", lty = "solid")
axis.POSIXct(side = 1, 
             labels = c("Thu", "Fri", "Sat"),
             at = c("2007-02-01 00:00:00",
                    "2007-02-02 00:00:00",
                    "2007-02-02 23:59:00"))
axis(side = 2, at = seq(0.0, 0.5, 0.1))


dev.off()
