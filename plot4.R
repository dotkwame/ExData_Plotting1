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
        dev.copy(png, file="plot4.png", height=1024, width=1024)
        dev.off()
}

plot.chart <- function(df = read.data()){
        par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
        with(df, {
                plot(Global_active_power~DateTime, type="l", 
                     ylab="Global Active Power")
                plot(Voltage~DateTime, type="l", 
                     ylab="Voltage")
                plot(Sub_metering_1~DateTime, type="l", 
                     ylab="Energy sub metering")
                lines(Sub_metering_2~DateTime,col='red')
                lines(Sub_metering_3~DateTime,col='blue')
                legend("topright", col=c("black", "red", "blue"), 
                       lty=1, lwd=2, bty="n", cex = 0.5,
                       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
                plot(Global_reactive_power~DateTime, type="l",)
        })
}