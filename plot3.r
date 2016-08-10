

#### Load the data

hp <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F)

hp1 <- unite(hp, Date.time, Date:Time, sep = " ", remove = TRUE)

### It'd be easier to deal with the date and time in the following steps

hp1$Date.time <- strptime(hp1$Date.time, format = "%d/%m/%Y %H:%M:%S")

hp1$Date.time <- as.POSIXct(hp1$Date.time)

hp1 <- tbl_df(hp1)

###Get 2007-02-01 and 2007-02-02

hp_2007 <- hp1[grep("^2007\\-02\\-01|^2007\\-02\\-02", hp1$Date.time),] #### select 2007-02-01, 2007-02-02




hp_2007$Sub_metering_1 <- as.numeric(hp_2007$Sub_metering_1)
hp_2007$Sub_metering_2 <- as.numeric(hp_2007$Sub_metering_2)

plot(x=hp_2007$Date.time, y=hp_2007$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(x=hp_2007$Date.time, y=hp_2007$Sub_metering_2,  col = "red")
lines(x=hp_2007$Date.time, y=hp_2007$Sub_metering_3,  col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.65, pt.cex = 2)