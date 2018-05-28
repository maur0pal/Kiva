#Assignment module Background Soller College. 
#Assignment based on the file named as Background Module - Assignment 1.pdf
#One of the points for this assigment is the use of a Github repository. It has been created.
#Edgar Roman 28/05/2018

#Point 1
#Name of the repository in Github is maur0pal/Kiva, I'd need the name of a user 
#share my repository

#Point 2
#A folder in my own computer has been created and syncronized

#Point 3
#Data set "Data Science for Good: Kiva Crowdfunding" has been downloaded and I have been work with this data set accross this
#assignment

#Point 4

#know the path work
getwd()

#set the path work in my computer
setwd("C:\\Users\\Mauricio\\Desktop\\01 Background sollers\\Assignment\\Kiva\\data")

#load data into R
df <- read.csv("kiva_loans.csv")

#This is a file with only 50 records in order to try the different functions of R and reduce the processing time
#with all records of the original file.  The original file can be load with the last instruction insted of this one.
#df <- read.csv("what_is_it.csv", header = TRUE, sep = ",")

View(df)

#Point 4.1
unique(df$sector)
length(unique(df$sector))

#Point 4.2
boxplot(df$funded_amount~df$sector, ylimit=c(0,4000), 
        las = 2, par(mar = c(6, 5, 2, 2)), col = c("red", "blue", "grey", "green"),
        ylab=("Amount Founded"), xlab=("Sector"), main=("Sector vs Founding"))


#Point 4.3
df["gender"] <-- NA
df$gender
index <- c("male", "female")
values <- c("male", "female")
df$gender <- values[match(df$borrower_genders, index)]
df$gender

#Point 4.4
plot(df$funded_amount, df$loan_amount, df$borrower_genders=="male")

help("plot")


#Point 4.5


#Import some package that we are going to need
install.packages("dplyr")
install.packages("tidyr")

library(dplyr) 
library(tidyr)

#I want use another data frame with the same information
MyData <- df

#Print headers
names(MyData)

#New Data Frame with the requiered frames
MyDataRecortado <- MyData[,c(1,21,17)]
names(MyDataRecortado)

View(MyDataRecortado)


#New vector with the new field tag separated 
df_split <- separate(data =  MyDataRecortado, 
                     col  =  tags,  
                     into =  c("tag01", " tag02", " tag03", "tag04", "tag05"), 
                     sep  =  ",")

#View(df_split)

#one record for each listed tag
df_row <- gather(data = df_split, key = "taags", value = "tags", 3:7)
View(df_row)


##Point 4.6 -- Count and sort to show the top five tags for males vs. females.

#Sort information by id
ndx = order(df_row$id)
df_row_sorted <- df_row[ndx,]
View(df_row_sorted)

#### top five tags

##I intall package that I need
install.packages("data.table")
library(data.table) 


p6 <- df_row_sorted %>% group_by(tags, gender) %>% summarise(count=n()) 
p6 <- p6 %>% 
       arrange(desc(count, tags, gender)) %>% 
       group_by(tags) %>% 
       slice(1:5)

View(p6)

##### END

