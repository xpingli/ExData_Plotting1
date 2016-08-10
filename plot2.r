

#### Load the data

hp <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F)

hp1 <- unite(hp, Date.time, Date:Time, sep = " ", remove = TRUE)

### It'd be easier to deal with the date and time in the following steps

hp1$Date.time <- strptime(hp1$Date.time, format = "%d/%m/%Y %H:%M:%S")

hp1$Date.time <- as.POSIXct(hp1$Date.time)

hp1 <- tbl_df(hp1)

###Get 2007-02-01 and 2007-02-02

hp_2007 <- hp1[grep("^2007\\-02\\-01|^2007\\-02\\-02", hp1$Date.time),] #### select 2007-02-01, 2007-02-02


### plot1 histogram Global acitive power

hp_2007$Global_active_power <- as.numeric(hp_2007$Global_active_power)

with(hp_2007, plot(x = Date.time, y = Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

dev.copy(png, "plot2.png")
dev.off()
