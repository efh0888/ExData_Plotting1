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

# convert to numeric
power$Global_active_power <- as.numeric(power$Global_active_power)

hist(x = power$Global_active_power, 
     axes = FALSE,
     main = "Global Active Power",
     col = "red",
     xlab = "Global Active Power (kilowatts)")
axis(side = 1, at = seq(0, 6, 2))
axis(side = 2, at = seq(0, 1200, 200))

dev.copy(device = png, 
         file = 'plot1.png', 
         width = 480, 
         height = 480,
         units = "px")
dev.off()
