x <- 2 #assign number 2 to variable x
y <- 5 #assign number 5 to variable y
x #show contents of x
y #show contents of y
a <- b <- 7 # assigns 7 to a and b
rm(a) #remove variable a
class(x) #provides class of x
is.numeric() #test if it is numeric function
is.integer() # whole numbers, no decimals, checks for integer value
#use L after a number, it's integer
nchar() # find length of characters - doesn't work with factor data
#date data 1st January 1970 epock time, structured in american time format
as.numeric(date) # gives number of days since epock date
as.POSICXct ("date in years, months, days, seconds")
TRUE = 1
FALSE = 0
#Vector collection of elements with all the same type, no row/column, it's a one dimensional array
#matrices are two dimensional arrays

my_vectr <- c(10, 150, 30, 40, 55.6) # c = character vector
my_vectr

c(10, 150, 30, 40, 55.6) -> my_vectr # another way of doing it, the other way around


install.packages("swirl")
library(swirl)
install_course_zip("c:/swirl_courses-master.zip", multi = TRUE, which_course = "R Programming")
swirl()

x <- c(10.4, 5.6, 3.1, 6.4, 21.7)
y <- c(x, 0, x)
z <- 2 * x + y + 1

#check if we have empty cells
z <- c(1:3,NA)
result <- is.na(z)

# below you can use for the diabetes assignment it categorizes the data, for example type1 diabetes and type 2 diabetes
vec1 <- c("Hockey", "Fooball", "Baseball", "Curling", "Rugby", "Hurling", "Basketball", "Tennis", "Cricket", "Lacrosse")
vec2 <- c(vec1, "Hockey", "Lacrosse", "Hockey", "Water Polo", "Hockey", "Lacrosse")
vec2_factor <- as.factor(vec2)
vec2_factor

x <- c(34, 56, 55, 87, NA, 4, 77, NA, 21, NA, 39)
length(is.na(x)) # counts items in the vector

sum(is.na(x)) # counts how many NA's

count(!is.na(x)) # doesn't work
sum(!is.na(x))
y <- is.na(x) # gives the true and falses in X
y
#Lecture
colnames <- c("Date", "Country", "Gender", "Age", "q1", "q2", "q3", "q4", "q5")
date_column <- c("2018-15-10", "2018-11-01", "2018-21-10", "2018-28-10", "2018-01-05")
country <- c("US", "US", "IRL", "IRL", "IRL")
gender <- c("M", "F", "F", "M", "F")
age <- c(32, 45, 25, 39, 99)
q1 <- c(5, 3, 3, 3, 2)
q2 <- c(4, 5, 5, 3, 2)
q3 <- c(5, 2, 5, 4, 1)
q4 <- c(5, 5, 5, NA, 2)
q5 <- c(5, 5, 2, NA, 1)

my_data <- data.frame(date_column, country, gender, age, q1, q2, q3, q4, q5)
colnames(my_data) <- colnames
my_data
head(my_data) # first 5 rows, tail is the last 5 rows
str(my_data)

my_data$Age[my_data$Age == 99] <- NA # check my data age column and if the column has 99 put NA
my_data

my_data$AgeCat[my_data$Age >= 45] <- "Elder"
my_data$AgeCat[my_data$Age >= 26 && my_data$Age <= 44] <- "Middle Aged"
my_data$AgeCat[my_data$Age <= 25] <- "Young"
my_data$AgeCat[is.na(my_data$Age)] <- "Elder"
my_data

#Recoding Variables
AgeCat <- factor(my_data$AgeCat, order = TRUE, levels = c("Young", "Middle Aged", "Elder"))
AgeCat
my_data$AgeCat <- AgeCat
my_data

#add new column called summary_col that shows a summary of each row in the data frame
summary_col <- my_data$q1 + my_data$q2 + my_data$q3 + my_data$q4 + my_data$q5
summary_col
my_data <- data.frame(my_data, summary_col)
my_data

#example of changing the output date
date_format <- "%b %d %Y"
today <- Sys.Date()
output_date <- format(today, format = date_format)
output_date

#Display difference between 13th Feb 2004 and 22nd Jan 2018
startdate <- as.Date("2004-02-13")
enddate <- as.Date("2018-01-22")
days <- enddate - startdate
days

#calculate number of days/weeks from your birth date
todays_date <- Sys.Date()
dob <- as.Date("1973-08-30")
diff_dates <- difftime(todays_date, dob, units = "weeks")
diff_dates

#sort data by age
my_data
new_data <- my_data[order(my_data$Age),]
new_data

#sorty your date - multiple sorts
#We can use attach command to bypass need for '$' sign
#to identify variables in the data frame
attach(my_data)
str(my_data$Age)
str(my_data$Gender)
new_data <- my_data[order(Gender, Age),]
new_data

#removes any roews that contains NA - listwise deletion
new_data <- na.omit(my_data) # listwise deletion
new_data

#use complete.cases to show rows where data is missing
complete_data <- complete.cases(my_data)
complete_data

#show sum of missing rows
sum(complete_data)

#list the rows that do not have missing values
#Note that the ',' and no number inside square brackets means "all columns"
complete_data <- my_data[complete.cases(my_data),]
complete_data

#list rows with missing values
my_data[!complete.cases(my_data),]

#Find sum of all missing values in the age ttribute
sum(is.na(my_data$Age))

#Use sum() to show a total of complete rows
sum(!is.na(my_data))

#mean() to show mean of complete values in Age attribute
mean(is.na(my_data$Age)

#Find the mean() to rows with complete values



#Selecting data between 2 date reanges
my_data$Date <- as.Date(my_data$Date, "%Y-%m-%d")
startdate <- as.Date("2018-01-01")
enddate <- as.Date("2018-01-31")
new_data <- my_data[(my_data$Date >= startdate & my_data$Date <= enddate),]
new_data

#Dropping Observations
#Deleting atrributes from data

include_list <- names(my_data %in% c("Q3", "Q4"))
#This list can be used to extract this data
new_data <- my_data[include_list_list)]

#Create a subset
#Using the subset function
#to extract all records from my_data where age > 35 or age < 24. Only select
#the listed attributes
attach(my_data)
new_data <- subset(my_data, Age >= 35 | Age < 24, select = c(Q1, Q2, Q3, Q4))
new_data

head(new_data)
attach(my_data)
new_data <- subset(my_data, Gender = M | age >= 24, select = c(Gender:q4))
new_data

#creating a random sample
my_sample <- my_data[sample(1:nrow(my_data), 3, replace = FALSE),]
my_sample

#merging data sets

total <- merge(dataframeA, dataframeB, by = "ID")
total <- merge(dataframeA, dataframeB, by = c("ID", "")

#merging datasets horizontally
total <- cbind(A, B) # 

total <-rbind(dataframeA, dataframeB) # same attributes

#Funtions
myfunction <- function(arg1, arg2, ... .) {
    statements
    return(object)
}

#test function
add_two_numbers <- function(no1, no2, no3 = 10) {
    result = no1 + no2 + no3
    return(result)
}

result <- add_two_numbers(2, 4)
result

#lotto exercise
temp <- read.csv("c:/lotto/1999.csv")
str(temp)
head(temp)
csv_file_list <- list.files(path = "c:/lotto", pattern = "*.csv")
csv_file_list

combined_results <- function(file_list) {
    lotto_data <- NULL
    for (csv_file in file_list) {
        lotto_record <- read.csv(header = TRUE, paste("c:/lotto/", csv_file, sep = ""), stringsAsFactors = FALSE)
        data_of_interest <- lotto_record[2:9]
        lotto_data <- rbind(lotto_data, data_of_interest)
    }
    return(lotto_data)
}

my_data <- combined_results(csv_file_list)
my_data