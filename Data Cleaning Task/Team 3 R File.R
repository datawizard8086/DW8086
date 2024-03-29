install.packages("readxl")
library("readxl")

##Import csv file, skip the first 2 rows, and use the 3rd row as header
my_data<-read_excel("C:/Users/hatha/Desktop/DataExploration/MasterWaterQualityEntryTempAdded.xlsx",sheet="Sheet1", skip = 2,col_types =NULL ,col_names = TRUE)

##Remove the first row since it is a unit row
dataset <- my_data [-c (1),]

##Filter 2013-2017 data
newdata1<- subset(dataset,dataset$Year>2012 & dataset$Year<2018)

##Combine Day, Month, & Year columns into Date column
newdata1$Date <- as.Date(with(newdata1, paste(Year, Month, Day,sep="-")), "%Y-%m-%d")

##Remove unnecessary columns 
newdata2<-newdata1[,c(4,5,6,8,10,11,12,13,17,24,25,46,47,50,53)]

##Rename header names
names (newdata2)[2]<- "ObservationSite"
names (newdata2)[3]<- "TempF"
names (newdata2)[4]<- "Precipitation"
names (newdata2)[5]<- "WaterTemp"
names (newdata2)[8]<- "DissolvedOxygen"
names (newdata2)[10]<- "FloatAverage"
names (newdata2)[13]<- "Phosphates"
names (newdata2)[14]<- "Sulfate"
names (newdata2)[15]<- "Alkalinity"


##Write Function
write.csv(newdata1,"reviseddata.csv")


## Capitalized first letter in observation site

> capFirst<- function(s){
  + paste(toupper(substring(s, 1, 1)), substring(s, 2), sep = "")
  + }
> newdata2$ObservationSite<-capFirst(newdata2$ObservationSite)
> newdata2


## Replaced NA with the mean value of Water temp

> data1<-newdata2
> data1$WaterTemp= as.numeric(as.character(data1$WaterTemp))
> data1$WaterTemp[which(is.na(data1$WaterTemp))]<-mean(data1$WaterTemp,na.rm= TRUE)

## convert the data in numeric form and upto 2 decimal points
data1$WaterTemp= as.numeric(as.character(data1$WaterTemp))
data1$WaterTemp<-round(data1$WaterTemp,2)

data1$TempF=as.numeric(as.character(data1$TempF))
data1$TempF<-round(data1$TempF,2)

data1$Precipitation=as.numeric(as.character(data1$Precipitation))
data1$Precipitation<-round(data1$Precipitation,2)

data1$pH=as.numeric(as.character(data1$pH))
data1$pH<-round(data1$pH,2)

data1$Conductivity=as.numeric(as.character(data1$Conductivity))
data1$Conductivity<-round(data1$Conductivity,2)

data1$DissolvedOxygen=as.numeric(as.character(data1$DissolvedOxygen))
data1$DissolvedOxygen<-round(data1$DissolvedOxygen,2)

data1$Turbidity=as.numeric(as.character(data1$Turbidity))
data1$Turbidity<-round(data1$Turbidity,2)

data1$FloatAverage=as.numeric(as.character(data1$FloatAverage))
data1$FloatAverage<-round(data1$FloatAverage,2)

data1$Velocity=as.numeric(as.character(data1$Velocity))
data1$Velocity<-round(data1$Velocity,2)

data1$Nitrates=as.numeric(as.character(data1$Nitrates))
data1$Nitrates<-round(data1$Nitrates,2)

data1$Phosphates=as.numeric(as.character(data1$Phosphates))
data1$Phosphates<-round(data1$Phosphates,2)

data1$Sulfate=as.numeric(as.character(data1$Sulfate))
data1$Sulfate<-round(data1$Sulfate,2)

data1$Alkalinity=as.numeric(as.character(data1$Alkalinity))
data1$Alkalinity<-round(data1$Alkalinity,2)

##Write Function
write.csv(data1,"/Users/rajeshkumarpanigrahi/Desktop/Data Cleaning/cleanData.csv")



## Description 
/*
First in the R file we read the Excel file, you need to change the path to match up with the directory where the excel file is located.
Change the Path, next we filter for the year 2012 and 2018. Third step unnecessary columns are removed. Fourth step all header names are renamed to remain consistent.
Finally once the data set has all the necessary felds we need some rows which have NV value they are replaced with NA.  Few values are converted to numeric and using the
write.csv command we store the file in CSV format.

For Replication:-
Please downlaod this R file and change the path for the excel sheet and after running the R code we can get the revised dataset which is cleaned and can be used for further analysis.


*/

