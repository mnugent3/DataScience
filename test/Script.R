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