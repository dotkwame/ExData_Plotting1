read.data <- function(){
        dt <- fread("data/household_power_consumption.txt", 
                    sep = ";", 
                    header=TRUE, 
                    na.strings = "?")[Date %in% c("1/2/2007", "2/2/2007")]
        
        dt <- transform(dt, Date = as.Date(Date, "%d/%m/%Y"), 
                        Global_active_power = as.numeric(Global_active_power),
                        Global_reactive_power = as.numeric(Global_reactive_power),
                        Voltage = as.numeric(Voltage),
                        Global_intensity = as.numeric(Global_intensity),
                        Sub_metering_1 = as.numeric(Sub_metering_1),
                        Sub_metering_2 = as.numeric(Sub_metering_2), 
                        Sub_metering_3 = as.numeric(Sub_metering_3))
        dt
        
        
}

saveto.png <- function(){
        dev.copy(png, file="plot1.png", height=480, width=480)
        dev.off()
}

plot.chart <- function(df = read.data()){
        hist(df$Global_active_power, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
}