### load the data: note the preliminary settings

hp <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F)

hp1 <- unite(hp, Date.time, Date:Time, sep = " ", remove = TRUE)

### It'd be easier to deal with the date and time in the following steps

hp1$Date.time <- strptime(hp1$Date.time, format = "%d/%m/%Y %H:%M:%S")

hp1$Date.time <- as.POSIXct(hp1$Date.time)

hp1 <- tbl_df(hp1)

###Get 2007-02-01 and 2007-02-02

hp_2007 <- hp1[grep("^2007\\-02\\-01|^2007\\-02\\-02", hp1$Date.time),] #### select 2007-02-01, 2007-02-02


### plot1 Global acitive power

hp_2007$Global_active_power <- as.numeric(hp_2007$Global_active_power)

hist(hp_2007$Global_active_power, breaks = 13, col = "red", ylim=c(0,1200), xlab = "Global Active Power(kilowatts)", main = "Global Active Power")

dev.copy(png, file = "plot1.png")
dev.off()
