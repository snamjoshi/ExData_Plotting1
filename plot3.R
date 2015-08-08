## Course project 1 uses data from the Electric power consumption data set.

# Load date from working directory
dat <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# Subset to only include dates from Feb. 1st and 2nd, 2007
power <- subset(dat, dat$Date %in% c("1/2/2007", "2/2/2007"))

# Convert date and time columns to correct class
power$Time <- strptime(paste(power$Date, power$Time, sep = ", "), format = "%d/%m/%Y, %H:%M:%S")   # Replace Time column with date and time info
power <- power[, -1]   # Remove date column
colnames(power)[1] <- "Date_and_time"   # Rename time column to a date and time column

# Plot 3 (480 x 480)
plot(x = power$Date_and_time, 
		 y = power$Sub_metering_1,
		 type = "l",
		 col = "black",
		 ylim = c(0,40),
		 ylab = "Energy sub metering",
		 xlab = "")

lines(x = power$Date_and_time, 
			y = power$Sub_metering_2,
			col = "red")

lines(x = power$Date_and_time, 
			y = power$Sub_metering_3,
			col = "blue")

legend(x = "topright", 
			 lty = 1, 
			 col = c("black", "red", "blue"), 
			 legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png,'plot3.png')
dev.off()