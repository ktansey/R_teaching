# Lecture2_Practicals
Katherine Tansey  
7/3/2017  

# Learning Objectives
* Find and install packages into R
* Import and Export data from R
* Understand coercion 
* Write conditional statements with *if()* and *else()*
* Write and understand *for()* loops
* Use the apply family of functions

# What we did last time
Basic math

```r
5 - 3 + 2 * 4^2
```

```
## [1] 34
```

Assign values to variables

```r
dogs <- 2
cats <- 6
goldfish <- 4
```

Math with variables

```r
household <- dogs + cats + goldfish
household
```

```
## [1] 12
```

Learned about data types

```r
class(household)
```

```
## [1] "numeric"
```

```r
class("household")
```

```
## [1] "character"
```

Learned how to get help

```r
?class
??class
help(class)
```

Learned about vectors

```r
character_vector <- c("Harry Potter", "Ron Weasley", "Hermione Granger", "Neville Longbottom")
character_vector[1:3]
```

```
## [1] "Harry Potter"     "Ron Weasley"      "Hermione Granger"
```

And factors

```r
sex_vector <- c("Male", "Female", "Female", "Male", "Male")
factor_sex_vector <- factor(sex_vector)
factor_sex_vector
```

```
## [1] Male   Female Female Male   Male  
## Levels: Female Male
```

and dataframes

```r
str(iris)
```

```
## 'data.frame':	150 obs. of  5 variables:
##  $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
##  $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
##  $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
##  $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
##  $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
```

```r
dim(iris)
```

```
## [1] 150   5
```

```r
colnames(iris)
```

```
## [1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width" 
## [5] "Species"
```


```r
iris[2:5,1:2]
```

```
##   Sepal.Length Sepal.Width
## 2          4.9         3.0
## 3          4.7         3.2
## 4          4.6         3.1
## 5          5.0         3.6
```

```r
iris[which(iris$Petal.Length > 6), ]
```

```
##     Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
## 106          7.6         3.0          6.6         2.1 virginica
## 108          7.3         2.9          6.3         1.8 virginica
## 110          7.2         3.6          6.1         2.5 virginica
## 118          7.7         3.8          6.7         2.2 virginica
## 119          7.7         2.6          6.9         2.3 virginica
## 123          7.7         2.8          6.7         2.0 virginica
## 131          7.4         2.8          6.1         1.9 virginica
## 132          7.9         3.8          6.4         2.0 virginica
## 136          7.7         3.0          6.1         2.3 virginica
```

Used some built-in functions

```r
mean(iris[,"Petal.Length"])
```

```
## [1] 3.758
```


```r
number_list <- seq(1, 100, 2)
```

# R packages
R is open source and easily expandable. Therefore **a lot** of people have contributed *packages* to R over the years. These are functions people have written to perform a wide variety of tasks. See [here](https://cran.r-project.org/web/packages/available_packages_by_name.html) for a long list of available packages.  There is also a biology specific repository called [BioConductor](http://bioconductor.org/packages/release/BiocViews.html#___Software).    

You can also contribute to R in the same way, by writing a package, but we will not be covering this in this course, but there is an entire book about it available [here](http://r-pkgs.had.co.nz/).

It is easy to install packages, and can be done via R. There are two general steps:

1. Install the package
This means downloaded the required code from the web repository. Packages may require other packages to work, therefore more than one pacakge may download when installing a single package.   
          
    * install.packages("packagename") to install packagename

2. Load the package into R
Once the packages is downloaded, it then needs to be loaded into the R environment for use. Downloading the package does not make the commands available, it must be loaded into R first.    
                  
    * library(packagename) to load a package and make the commands available

> Get and load the dplyr package

``` 


```



**You only have to install the package once** (not once per script, just once), but you have to load the package every single time you want to use it (once per script).

A few other useful commands:

    installed.packages() to see what packages are installed 
    update.packages() to update installed packages

# Importing/Exporting data into R

## Importing data into R
1. Need to tell R where on our computer the data files is  
2. Load data via a specific R command   
    * **Command used to import data is dependent on the data format**  

* Need to tell R where on our computer the data files is    
There are two ways to do this:  
1. Set a working directory  
    + You should **ALWAYS** set a working directory
    + This where you are working for this particular analysis/project
    + Like UNIX, R has a “home” directory
    + Check where you are in R using **getwd()**
    
    ```r
    getwd()
    ```
    
    ```
    ## [1] "/Users/katherine/Documents/Courses_and_Workshops/Medic_Masters/Compute_Module_2017/R"
    ```
    + To change to a new working directory use **setwd()**
    
    ```r
    setwd("/Users/katherine/Documents/Courses_and_Workshops/Medic_Masters/Compute_Module_2017/R/")
    ```

2. Using full/absolute path names  
    * Same meaning as in UNIX
    * Include entire path to the file from the root directory      

**Why would you want to both setwd() and use a full/absolute path name to a file?**       
 
* Load data via a specific R command     

Text tab delimited file (extension .txt)

```r
phenotype_data <- read.table("pheno.txt")
```
Comma separated file (extension .csv)

```r
phenotype_data <- read.table("pheno.csv")
```
Excel file (extension .xlsx)

```r
install.packages("readxl")
library(readxl)
phenotype_data <- read_excel("pheno.xlsx", sheet = 1)
```
Stata format (extension .dta)

```r
install.packages("haven")
library(haven)
phenotype_data <- read_dta("pheno.dta")
```
SPSS format (extension .sav)

```r
install.packages("haven")
library(haven)
phenotype_data <- read_sav("pheno.sav")
```
There are **A LOT** of options when it comes to reading data in like:    

* is there a header row?    
* do you want to skip any leading rows?     
* is the a certain identifier for missing data?     
* what type of seperator is used between columns?     
* what character is used in the file as a decimal point?     
 
> Getting data into R       

You have been given 3 datasets to load into R.     

1. Load life_expec.csv and store as life_expec     
```   
```   



2. Load U.S._Chronic_Disease_Indicators_CDI.xlsx and store as US_CDI    

```   
```    



3. Load GSE62085_Non-normalized_data.txt and store as TCF4_KD    

```    
```    



## Exporting data from R
1. Need to tell R where on our computer we want the output to go    
2. Output in the format you want    

* Need to tell R where on our computer we want the output to go 
1. Just output
    + Data will be saved in the current *setwd()* which can be checked using *getwd()*

2. Use full/absolute pathnames

* Output in the format you want      
Text tab delimited file (extension .txt)    

```r
write.table(mydata, ”mydata.txt”, sep=“\t”)
```
Comma separated file (extension .csv)

```r
write.table(mydata, ”mydata.csv”, sep=“,”)
```
Excel file (extension .xlsx)

```r
install.packages("xlsx")
library(xlsx)
write.xlsx(mydata, “mydata.xlsx”)
```

> Get data out of R    

Export the three loaded datasets out of R    

1. Export life_expec as life_expec.txt
```
```



2. Export US_CDI as U.S._Chronic_Disease_Indicators_CDI.csv 
```
```


3. Export TCF4_KD as GSE62085_Non-normalized_data.xlsx
```
```


# Coercion
Sometime R gets it wrong. Each column of a data frame must be a single data type and this is because each column of a data frame is stored as a vector. When joining columns together with two different data types, R will make a choice:     
    
    Character + Anything_Else  ->  Character    
    Number + Integer or Logical  ->  Number    
    Integer + Logical  ->  Integer     

There are commands to force data into a particular type:    

* force to be a number     
    + as.numeric(data$column)    
* force to be a character   
    + as.character(data$column)   
* force to be a vector   
    + as.vector(data$column)   
* force to be a data.frame    
    + as.data.frame(data)   

> Examine coercion

Load babynames from USA dataset

```r
#install.packages("babynames")
library(babynames)
```
Make sex a factor

```r
babynames$sex <- as.factor(babynames$sex)
```
Change sex into a character and a numeric -- Examine the differences    

```r
babynames$sex1 <- as.character(babynames$sex)
babynames$sex2 <- as.numeric(babynames$sex)
summary(babynames)
```

# Conditionals and Control Flow
Conditional expressions in R are the same as in UNIX, however there is a difference in R between & / && and | / ||.   && and || only examines the first element of the vector, whereas & and | examine all the elements of the vectors. 

> Examine the difference between & and &&, | and ||

Can you guess the output of these lines?

```r
1:3==1:3 && 1:3==c(1,3,3)
1:3==1:3 & 1:3==c(1,3,3)

1:3==1:3 && 1:3==c(3,3,3)
```


```r
1:3==1:3 || 1:3==c(1,3,3)
1:3==1:3 | 1:3==c(1,3,3)

1:3==1:3 || 1:3==c(3,3,3)
```

Effects on subsetting using babynames     

```r
babynames_1980_robert <- babynames[which(babynames$year == 1980 && babynames$name == "Robert"),]

babynames_1980_robert <- babynames[which(babynames$year == 1980 & babynames$name == "Robert"),]
```

**Which one produces the desired output?**         

# if else statements     

![](/Users/katherine/Documents/Courses_and_Workshops/Medic_Masters/Compute_Module_2017/R/Pictures/IF.png)      
Notice the body of the statement is wrapped in curly brackets 
**{ }**.   


```r
if(condition) {
	do_this
}
```
![](/Users/katherine/Documents/Courses_and_Workshops/Medic_Masters/Compute_Module_2017/R/Pictures/If_else.png)      
Notice that the body of the statement is indented.    

```r
if(condition) {
	do_this
} else {
	do_this_instead
}
```

![](/Users/katherine/Documents/Courses_and_Workshops/Medic_Masters/Compute_Module_2017/R/Pictures/If_elseif_else.png)    

```r
if(condition) {
	do_this
} else if(condition_2) {
	do_this_instead
} else {
	do_this_instead_2
}
```

There are certain style elements to writing R code, which are not set in stone but are highly recommended for making code easier to read and interpret. See [here](http://adv-r.had.co.nz/Style.html#undefined) for more information.  While indenting does not really matter to R, it does to other programming languages, like python, so it is a good habit to get into. Also, it really really does make it easier to read.    


```r
x = 33
if (x < 50) { 
	if (x < 25) { 
		result <- "little" 
	} else {
		 result <- "almost half" 
	} 
} else if (x < 75) { 
	result <- "most" 
} else {
	result <- "almost all" 
}
result
```

```
## [1] "almost half"
```

> If else statements

Create an if else statement about the weather which says "Too hot" if the temperature is greater than 30, "Warm" if the temperature is greater than 23 but less than 30, "just right" if the temperature is less than 23 and greater than 16, "chilly" if the temperature is greater than 10 and less than 16, and "cold" if the temperature is below 10.  Set temp before running the if else.    

```

```



**Why doesn't the following work?**        
          

```r
if(babynames$prop > 0.02){
    babynames$popular == 1
}
```
What does the error message mean? What needs to be changed in order to fix this?                    

**What is ifelse() doing here?**       


```r
babynames$popular <- ifelse(babynames$prop >= 0.02, 1, 0)
```

# Loops
There are two types of loops:          
1. while          
2. for               

## while loops 

![](/Users/katherine/Documents/Courses_and_Workshops/Medic_Masters/Compute_Module_2017/R/Pictures/while.png)       

In a while loop, as long as the condition continues to be TRUE, R will perform the task within the curly brackets. However, while loops should be used with some caution as an incorrectly set up while loop may never terminate. If the condition **NEVER becomes FALSE**, the *loop will go on indefinitely*.            


```r
while (condition) { 
	do_this
}
```

What will happen if we run this loop?               

```r
x = 1
while (x < 20) { 
	print("number too low")
	x = x + 1
}
```

> while loops

Create a while loop that ticks down from 10 to 1, outputting "not there yet" for each number greater than 1.      
```
```



## for loops
![](/Users/katherine/Documents/Courses_and_Workshops/Medic_Masters/Compute_Module_2017/R/Pictures/loop.png)     
Idea is the same as UNIX, just with different syntax.         

```r
for (iterator in set_of_values) {
	do_this
}
```
Iterator can be declared as anything with x and i are often being used. These are just stand in for values within the loop.         

**What do you think will happen with this loop?**           


```r
for (x in 1:10) {
	print(x)
}
```

You can loop over vectors as well.                 

**What do you think will happen with this loop?**                   

```r
num_list <- c(1,2,3,4,5,6,7,8,9,10)
for (x in 1:length(num_list)) {
	print(num_list[x])
}
```
What is part of the script **1:length(num_list)** telling R to do?                        

Loops can get slow in R, but only if you do certain things (like continuely add rows or columns to a data frame).              
                           
Generally:                    
1. Don’t use a loop when a vectorized alternative exists               
2. Don’t grow objects (via c, cbind, etc) during the loop              
3. Allocate an object to hold the results and fill it in during the loop                       

> for loops

Write a for loop that takes in a vector of numbers and squares each number.               

```
```


## for loops output results to a file        
Most of the time with loops, you want the output created in the loop to be saved and made available in a results files, particularly if you are looping over rows or columns in a dataframe. There are a few different ways to acheive this.             


```r
# create empty lists to populate the loop output
loop_output <- list()

# perform the for loop
for(i in ppl){
	do_things
    # save reults to the empty list marking it by the number (row or column number)
	loop_output[[i]] <- results
}

# run do.call and rbind to bring together output from loop
# this should also work with bind_rows command
loop_results <- do.call(rbind, loop_output)
```

**What do you think is happening in this for loop?**                  

```r
# loop output into a dataframe 
obj <- data.frame(mean=0)

for (i in score_list) {  
	obj[i,] <- mean(i)
}
```

> for Loops output to file

Iterate over every row in iris datasets and create sepal.area and petal.area. save these in a new dataframe called iris_areas.          

```
```
 




## Mixed loops
Most of the time, we want a combination of loops. Something to iterate over a vector or rows in a dataframe that over conditional control flow. 


```r
num_list <- 1:200

for(i in num_list){
	if(i > 100){
		print("large number")
	} else {
		print("small number")
	}
}
```

> Mixed loops

Create a few if statements using the babynames data.             

There are *a lot* of babynames, so we are just going to examine 1880 for the moment. First subset the data to just get 1880 data             

```r
babynames_1880 <- babynames[babynames$year == 1880, ]
```
*SIDENOTE*:
What is the difference between these pieces of code? What is being returned in each statement? Which one do you want to use to subset the data?                

```r
babynames_1880 <- babynames[babynames$year == 1880, ]
babynames_1880 <- babynames$year == 1880
```

Next create a new empty column in the dataset that you will populate via the loops. This command will create a new column called "popular" where all the entries will currently be NA.              

```r
babynames_1880$popular <- NA
```

1. create a new variable called popular, and make popular = 1 if the proportion of names in the population is greater than 0.02                   

```r
babynames_1880 <- babynames[babynames$year == 1880, ]
babynames_1880$popular <- NA

for(i in 1:nrow(babynames_1880)){
    if(babynames_1880[i, ]$prop  ){
        babynames_1880[i, ]$popular 
    }
}
```
**What is the for loop doing?**                  
**What information are you telling R you want with this *babynames_1880[i, ]$prop* code?**                  



2. create a new variable called popular, and make popular = "common" if the proportion of names in the population is greater than 0.02, and popular = "not as common" if the proportion of names in the population is less than 0.02      


```r
babynames_1880 <- babynames[babynames$year == 1880, ]
babynames_1880$popular <- NA

for(i in 1:nrow(babynames_1880)){
    if() {
        
    } else {
        
    }
}
```



**Convert the above into a ifelse statement**               

3. create a new variable called popular, and make popular = "common" if the proportion of names in the population is greater than 0.02, and popular = "rare" if the proportion of names in the population is less than 0.001,  and popular = "not as common" if not either                   


```r
for(i in 1:nrow(babynames_1880)){
    
}
```


**Convert the above into a ifelse statement**                


# Apply functions
There are a variety of different apply functions that all operate slightly differently. Apply commands are vectorized functions that are alternatives to loops. We are only going to covering a few, but there are more, so see [here](https://rstudio-pubs-static.s3.amazonaws.com/84967_12ec13425c82452a8f357ba87a4f641f.html), [here](https://nsaunders.wordpress.com/2010/08/20/a-brief-introduction-to-apply-in-r/) and [here](https://www.datacamp.com/community/tutorials/r-tutorial-apply-family#gs.rVVD37s) for information on the apply functions we are not going over. 

Which apply function you choose is dependent upon the input data and what format you want the output in, therefore it is worth looking at what type of options exist within the apply family for input types and outputs. The general format of the functions are highly similar.      

## apply
Apply performs the same command over all rows or columns of a matrix. 

```r
apply(X, MARGIN, FUNCTION, ...)
```
X is the matrix. MARGIN is the direction (1 = rows and 2 = columns), FUNCTION is the function you wish to apply to X.   
While apply can be used on a dataframe, know that to work on a dataframe, apply first coerces it into a matrix. A matrix is like a dataframe in that it is two dimensional (has rows and columns), but unlike a dataframe **must** contain only the same data type (all numeric or all characters). Remember that a dataframe allows each column to be a different data type. Therefore incorrect usage of apply on a dataframe could result in the apply function altering the data types in order to coerce the dataframe to be a matrix. 

> apply

Create a matrix of alcohol consumption by G8 countries


```r
# G8 Alcohol consumption (beer, spirit, wine)
UK <- c(219, 126, 195)
Canada <- c(240, 122, 100)
France <- c(127, 151, 370)
USA <- c(249, 158, 84)
Russia <- c(247, 326, 73)
Germany <- c(346, 117, 175)
Italy <- c(85, 42, 237)
Japan <- c(77, 202, 16)

# Create alcohol_G8
alcohol_G8 <- c(UK, Canada, France, USA, Russia, Germany, Italy, Japan)

# Construct alcohol_G8_matrix
alcohol_G8_matrix <- matrix(alcohol_G8, byrow=T, nrow=8)

# Vectors type of alcohol and countries, used for naming
types <- c("Beer", "Spirit", "Wine")
countries <- c("UK", "Canada", "France", "USA", "Russia", "Germany", "Italy", "Japan")
```

Using this matrix, get average alcohol consumption by country and by alcohol type. 

```
```



## tapply and by
Applies a function to each level of a factor or factors.    


```r
by(X, FACTOR, FUNCTION)
```
where X is the data (array), FACTOR are the categories you want X quantified by, and FUNCTION is what you want to quantify.      

by is a wrapper for tapply applied to data frames, where tapply only work on a single column, by wraps around multiple columns.     


```r
by(data[,1:4], sex, colMeans)

tapply(data[,1], sex, colMeans)
```
**What does colMeans do? Why use it instead of mean?**

> tapply and by

Get the means for each column in the iris dataset by species. Write a tapply command to do the first column.      

```
```
And a by command to do all at once.     
```
```





## Add in your own functions
We will revisit the apply family when we learn how to create our own functions later on. However it is worth looking at the syntax for apply functions when using your own function. 


```r
apply(data, 2, function(x) length(x[x<0]))

apply(data, 2, function(x) mean(x[x>0]))

apply(data, 2, my_function_I_created)
```


# Wrapping Up

## Key Points
* Importing and Exporting data  
* *install.packages()* to install packages (libraries)
* *library()* to load packages
* Use conditional statements (*if*, *else if*, *else*) to make choices
* Use loops (*while*, *for*) to repeat commands 
* Every *for* loop needs a variable to refer to the thing it is currently operating on
* **Same idea as UNIX, different syntax**
* Bodies of loops or conditional statements must be surrounded by curly brackets *{ }*
* Apply family of functions for vectorized loops


Do not use spaces, quotes, special characters, or wildcard characters such as ‘*’ or ‘?’ in filenames, as it complicates variable expansion.

Give files consistent names that make logical sense, reflect what the data is and that are easy to match with wildcard patterns to make it easy to select them for looping.


## Self Directed Learning

Examine more of the apply family of functions: [sapply](https://www.datacamp.com/community/tutorials/r-tutorial-apply-family#codesapplycode), [lapply](https://www.datacamp.com/community/tutorials/r-tutorial-apply-family#codelapplycode), [mapply](https://www.datacamp.com/community/tutorials/r-tutorial-apply-family#codemapplycode), [vapply](https://www.rdocumentation.org/packages/functools/versions/0.2.0/topics/Vapply), [eapply](https://www.rdocumentation.org/packages/base/versions/3.4.1/topics/eapply), [rapply](https://www.rdocumentation.org/packages/base/versions/3.4.1/topics/rapply)        

Useful functions related to apply: [sweep](https://www.datacamp.com/community/tutorials/r-tutorial-apply-family#sweep) and [aggregate](https://www.datacamp.com/community/tutorials/r-tutorial-apply-family#codeaggregatecode)          

[Read for next time](https://www.jstatsoft.org/index.php/jss/article/view/v059i10/v59i10.pdf) and [here](http://r4ds.had.co.nz/tidy-data.html)      

Further Reading: 
Hadley Wickham’s Advanced R -- [Vocabulary](http://adv-r.had.co.nz/Vocabulary.html)      


## Cheat Sheet
[Data Transformation](https://github.com/rstudio/cheatsheets/raw/master/source/pdfs/data-transformation-cheatsheet.pdf)	
