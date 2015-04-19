read.data <- function(){
        df <- read.table("data/household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?")
        df$Date <- as.Date(df$Date, "%d/%m/%Y")
        df <- subset(df, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))                
        df$DateTime <- paste(df$Date, df$Time)
        df$DateTime <- as.POSIXct(df$DateTime)
        df
}

saveto.png <- function(){
        dev.copy(png, file="plot2.png", height=500, width=500)
        dev.off()
}

plot.chart <- function(df = read.data()){
        plot(df$Global_active_power ~ df$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")        
}