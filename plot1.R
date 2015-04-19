read.data <- function(){
        df <- read.table("data/household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?")
        df$Date <- as.Date(df$Date, "%d/%m/%Y")
        df <- subset(df, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))        
        df
        
}

saveto.png <- function(){
        dev.copy(png, file="plot1.png", height=500, width=500)
        dev.off()
}

plot.chart <- function(df = read.data()){
        hist(df$Global_active_power, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
}