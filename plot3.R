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
        
        dt[,DateTime := as.POSIXct(paste(Date, Time))]
        dt
}

saveto.png <- function(){
        dev.copy(png, file="plot3.png", height=480, width=850)
        dev.off()
}

plot.chart <- function(df = read.data()){
        plot(df$Sub_metering_1 ~ df$DateTime, type="l", ylab="Ernergy sub metering", xlab="", col = "black")  
        lines(df$Sub_metering_2 ~ df$DateTime, col = "red")
        lines(df$Sub_metering_3 ~ df$DateTime, col = "blue")
        legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
}