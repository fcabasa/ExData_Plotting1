## For each plot you should

## Construct the plot and save it to a PNG file with a width of 480 pixels 
## and a height of 480 pixels.

## Name each of the plot files as plot1.png, plot2.png, etc.

## Create a separate R code file (plot1.R, plot2.R, etc.) that constructs 
## the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. 
## Your code file should include code for reading the data so that the plot 
## can be fully reproduced. You should also include the code that creates the PNG file.

## Add the PNG file and R code file to your git repository

## When you are finished with the assignment, push your git repository to 
## GitHub so that the GitHub version of your repository is up to date. 
## There should be four PNG files and four R code files.

## 1) Create data frame object from text file
epc <- read.table("household_power_consumption.txt",header=T,sep=";")

## 2) Prepare fields in data frame 
epc$Global_active_power <- as.numeric(as.character(epc$Global_active_power))
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")

## 3) Subset data for dates between 2/1/2007 and 2/2/2007
epc_plot1 <- subset(epc, epc$Date >= "2007-02-01" & epc$Date <= "2007-02-02")

## 4) Create final histogram and png file
png("plot1.png", width=480, height=480)
hist(epc_plot1$Global_active_power, main="Global Active Power", col="orangered", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()