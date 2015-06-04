# load plotting libary and dataset
library(ggplot2)
nyc <- read.csv("C:/Users/gabriel/Downloads/turnstile_data_master_with_weather.csv")

# provide a nice label for the ggplot2 fill option
nyc$Rain[nyc$rain == 1] <- "Rain"
nyc$Rain[nyc$rain == 0] <- "No Rain"
nyc$Rain <- as.factor(nyc$Rain)

# plot first visualization; histogram of ridership with and without rain
p <- ggplot(data=nyc, aes(ENTRIESn_hourly, fill=Rain))
p <- p + ggtitle("Histogram of Subway Turnstile Entries, With and Without Rain")
p <- p + ylab("Frequency per bin")
p <- p + xlab("Hourly Entries, bin size of 100")
p <- p + geom_histogram(binwidth=100, position="dodge")
p <- p + scale_x_continuous(limits=c(0, 5000))
print(p)

# aggregate mean ridership by hour
nycHourly <- aggregate(nyc, by=list(nyc$Hour), FUN=mean)

# plot second visualization; bar graph of average ridership by hour
p <- ggplot(nycHourly, aes(Hour, ENTRIESn_hourly))
p <- p + ggtitle("Average Subway Entries by Hour")
p <- p + ylab("Average Entries")
p <- p + xlab("Hour")
p <- p + geom_bar(stat="identity")
p <- p + scale_x_continuous(breaks=c(0:23))
print(p)
