setwd("ExData_Plotting1")

power <- read.table("household_power_consumption.txt",
                    sep = ";", 
                    header = TRUE, 
                    stringsAsFactors = FALSE)


# subset to just two desired days
power <- power[power$Date == "1/2/2007" |
               power$Date == "2/2/2007",]

# convert to date
power$Date_Time <- paste0(power$Date, " ", power$Time)
power$Date_Time <- strptime(power$Date_Time, "%d/%m/%Y %H:%M:%S")

# convert to numeric
power$Global_active_power <- as.numeric(power$Global_active_power)

plot(x = power$Date_Time,
     y = power$Global_active_power,
     xaxt = "n",
     type = "l",
     axes = FALSE,
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
box(which = "plot", lty = "solid")
axis.POSIXct(side = 1, 
             labels = c("Thu", "Fri", "Sat"),
             at = c("2007-02-01 00:00:00",
                    "2007-02-02 00:00:00",
                    "2007-02-02 23:59:00"))
axis(side = 2, at = seq(0, 6, 2))

dev.copy(device = png, 
         file = 'plot2.png', 
         width = 480, 
         height = 480,
         units = "px")
dev.off()
