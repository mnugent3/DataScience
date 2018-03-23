#Lab practial 1 - Importing Diabetes data into data frame

#1) Import the diabetes data available on Blackboard called diabetes-md into new data frame called my_data

getwd() #check where my working directory is so that I can save my .csv file there.

file.exists("diabetes-md.csv") #check whether it can find my file in the directory

my_data <- read.csv("diabetes-md.csv") # import my csv file into my_data dataframe

my_data #show my dataframe

#2) show the structure and class type of my_data and configure the neames of the attributes to: Patient name, NI address, Type, Age, Health status.

str(my_data) #show the structure of my_data dataframe

class(my_data) #show the class of my_data dataframe

colnames <- c("Patient name", "NI address", "Type", "Age", "Health status") #create a vector with the column names
colnames(my_data) <- colnames #apply the column names to my_data dataframe
head(my_data) #display first 5 rows, so that we can check that the column names have changed.

#3) Refactor diabetes type and status attributes

TypeCategory <- factor(my_data$Type, order = TRUE, levels = c("Type 1", "Type 2")) #refactor type1 and type2 sorting them from lower to higher levels
HealthStatusCategory <- factor(my_data$"Health status", order = TRUE, levels = c("Poor", "Improved", "Excellent")) #refactor health status from lower to higher levels
head(TypeCategory) #check Levels to see if they are ordered from lower to higher
head(HealthStatusCategory) #check levels to see if they are ordered from lower to higher

#4) Create a copy of the Patient name attribute into a data frame called patient_names. Show the first 10 names contained in patient_names

patient_names <- data.frame(my_data$`Patient name`) # copy the names from Patient name attribute and save them in patient_names
class(patient_names) #check that patient_names is class data.frame
head(patient_names, 10) # show the first 10 names in patient_names

#5) Count missing values in data frame my_data, and count this.
length(my_data[my_data == '']) #count missing values in the data frame

#6) I'm replacing the missing values in my_data dataframe and then removing the rows with NA values.
my_data[my_data == ''] <- NA #replace all empty fields with NA
my_data <- na.omit(my_data) #keep all the records with no empty cells or NA's and overwrite my data with all records with no empty cells
nrow(my_data) #count how many records are left.
my_data #show the records that are left.