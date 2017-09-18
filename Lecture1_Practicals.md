# Medic Masters - Intro R
Katherine Tansey  
7/3/2017  

# Learning Objectives

* Get familiar and comfortable with RStudio and Rmarkdown  
* Understand the basic syntax of R  
* Know the different data types and structures used by R  
* Learn where to find help   

# Introduction to Basics

## Do math
Very basic use of R is getting R to perform mathmatical operations. 

```r
2 + 2
```

```
## [1] 4
```


```r
5 - 3 + 2 * 4^2
```

```
## [1] 34
```


```r
11465 * 2358971436
```

```
## [1] 2.704561e+13
```


```r
options(scipen = 999)
11465 * 2358971436
```

```
## [1] 27045607513740
```
What is the difference between these last two runs?    
**What do you think *options(scipen = 999)* is doing?**      

> Do some of your own mathmatical operations in R     

```
```


## Prompt   

Copy and paste the below into the Console.   

```r
5 - 3 + 2 * 4^
```
    
    To get back to the input prompt (>) for R, hit ESC     

## Comments

```r
# comments start with a hash just like UNIX
# these are not evaluated in R
# calculate rate of change
45/100
```

```
## [1] 0.45
```

Commands can come after the command on the same line as well. 

```r
x <- 43 # a number
y <- "hello" # a word/character
```

## Assigning values to variables

Variables are extremely handy. Store a value or an object as a single word.   

```r
x <- 43 # a number
y <- "hello" # a word/character
```
Variable names **can not** contain spaces or special characters.   

    <- used to assign values to variables

> Assign values to variables   

Create a list of different animals (barnyard and household animals) each with a different value. Create at least 7 variables. 

```r
dogs <- 
cats <-
horses <- 
cows <- 
```



## Variables can be used like values
Can use the variables instead of values to perform mathmatical operations. R will replace the variable name with the value it represents. 

*Change these below to match the variable names you create above*

```r
farmyard <- horses + cows + chickens + sheep
farmyard
```

```
## [1] 84
```


```r
household <- dogs + cats + goldfish
household
```

```
## [1] 12
```


```r
farmyard/household
```

```
## [1] 7
```

> Perform other mathmatical operations with variables created

```
```

## Displaying values of variables

There are two ways to do this:

1. Type the variable name in R

```r
dogs
```

```
## [1] 2
```

2. Use **print()** function

```r
print(dogs)
```

```
## [1] 2
```

> Print values to console  

```
```

> Test out tab completion on already created variables

```
```

### Data Types
Not all data are the same. R treats data differently depending on what type of data it is. To determine what type of data something is you can use the **class()** function. Variable inherit their class from the value or object assigned to that variable. 


```r
class(x)
```

```
## [1] "numeric"
```

```r
class(y)
```

```
## [1] "character"
```

# Project Management

> Create a project for the Medic Masters R learning

```
```

# Using Markdown

See [here](http://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf) for reference guide, and [here](http://rmarkdown.rstudio.com/lesson-15.html) for a cheat sheet. 

> Examine Markdown HTML file and Rmd to compare

```
```

> Altering a markdown file   

Add a code chunks to this markdown file, using this template:    
```
farmyard/household
```
1. Code chunk and results are printed.   

```
```

2. Code chunk is printed but the results are not.

```
```

3. Code chunk is not printed but the results are.  

```
```

4. R does not run the code chunk.  

```
```

# Getting Help
There are various ways to get help in R. Let's see how to get help for the mean fuction in R (**mean()**).

1. Go to the help tab in RStudio in the bottom right quadrant, and type the function name into the search box
2. Use **?**

```r
?mean
```
3. Use **??**

```r
??mean
```
4. Use **help()**

```r
help(mean)
```

Also google it. These are the results from googling [R mean help](https://www.google.co.uk/search?q=R+mean+help&oq=R+mean+help&aqs=chrome..69i57j0l4.1679j0j7&sourceid=chrome&ie=UTF-8) 

# Data Structures
There are a variety of different data structures in R. We are only going to cover three of them:
1. Vector
2. Data Frame
3. Factor

For more information on the rest of them, see [here](http://adv-r.had.co.nz/Data-structures.html), [here](http://www.statmethods.net/input/datatypes.html) and [here](https://rstudio-pubs-static.s3.amazonaws.com/90282_db0ce980e867436fa9f4c4f7695edf0f.html#chapter-5---data-structures)

## Vector
Vectors are collections of values all of the same type (meaning characters, numeric, logicals). 

    c() used to combine values into a vector


```r
character_vector <- c("Harry Potter", "Ron Weasley", "Hermione Granger", "Neville Longbottom")
numeric_vector <- c(1,2,3,4,5,6)
logical_vector <- c(TRUE, FALSE, FALSE, TRUE)
```

Subsetting, or extracting, individual elements from a vector occurs by using square bracket notation **[ ]** and the number of the elements in the vector that you want. 

*REMEMBER: R counts from 1*

> Can you guess what these will return?  


```r
character_vector[1]
```


```r
character_vector[3]
```


```r
character_vector[1:3]
```


```r
character_vector[c(1,3)]
```

Mathmatical operations can also occur on vectors like they do on numbers and variables. Let's walk through the following code:

Create two vectors. One for money earned in one week on each weekday. The second is money spent on each weekday in that week. 

```r
money_earned <- c(85, 14, 67, 33, 54)
money_spent <- c(62, 42, 36, 75, 94)
```

Caluclate the total (net amount) of money for each weekday

```r
money_total <- money_earned - money_spent
money_total
```

```
## [1]  23 -28  31 -42 -40
```

Find which days in which we earned money (made more money than we spent). Returns a logical, where TRUE is when money_total is greater than 0 and FALSE when it is not.  

```r
made_money <- money_total > 0
made_money
```

```
## [1]  TRUE FALSE  TRUE FALSE FALSE
```

Extract out just the total money for the days that we earned money.

```r
good_days <- money_total[made_money]
good_days
```

```
## [1] 23 31
```

Another possible way to do this, can you see what is occuring here?

```r
good_days2 <- money_total[made_money > 0]
good_days2
```

```
## [1] 23 31
```

> Play with vectors

Merge two vectors together.

```r
HP <- c("Harry Potter", "Ron Weasley", "Hermione Granger")
HG <- c("Katniss Everdeen", "Peeta Mellark", "Gale Hawthorne")

Book_PPL <- c(HP, HG)
```


## Factor
Factors store categorical data. Use the fuction **factor()** to convert a vector in a factor. 


```r
sex_vector <- c("Male", "Female", "Female", "Male", "Male")
factor_sex_vector <- factor(sex_vector)
factor_sex_vector
```

```
## [1] Male   Female Female Male   Male  
## Levels: Female Male
```

```r
summary(factor_sex_vector)
```

```
## Female   Male 
##      2      3
```
**What is summary function doing?**      
    
Factors can be ordered. This aligns with ordinal data, which is categorical but has a set order to it.    


```r
age_vector <- c("35-50", "51-69", "35-50", "18-34", "51-69", "18-34", "35-50", "18-34", "51-69", "18-34","35-50", "35-50")
factor_age_vector <- factor(age_vector, ordered=T, levels = c("Under 18", "18-34", "35-50", "51-69", "Over 70"))
factor_age_vector
```

```
##  [1] 35-50 51-69 35-50 18-34 51-69 18-34 35-50 18-34 51-69 18-34 35-50
## [12] 35-50
## Levels: Under 18 < 18-34 < 35-50 < 51-69 < Over 70
```

```r
summary(factor_age_vector)
```

```
## Under 18    18-34    35-50    51-69  Over 70 
##        0        4        5        3        0
```

> Create Factors


```r
movie_ratings <- c("bad", "okay", "okay", "good", "amazing", "horrible", "bad", "amazing")
```
1. Convert movie_ratings to non-ordered factor vector and print to screen factor_movie_ratings
```

```
2. Convert movie_ratings to ordered factor vector and print to screen factor_movie_ratings
```

```
Which one do you think is more informative?

## Data Frame
Two dimensional object that include both rows and columns. Columns are variables and rows are the observations. Each column can have a different data type. 

    data.frame() used to create a data frame

Use a data set that is in data.frame format which is preloaded into R called "iris". For more information about this dataset, see [here](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/iris.html).

Print the entire dataset to screen

```r
iris
```

```
##     Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
## 1            5.1         3.5          1.4         0.2     setosa
## 2            4.9         3.0          1.4         0.2     setosa
## 3            4.7         3.2          1.3         0.2     setosa
## 4            4.6         3.1          1.5         0.2     setosa
## 5            5.0         3.6          1.4         0.2     setosa
## 6            5.4         3.9          1.7         0.4     setosa
## 7            4.6         3.4          1.4         0.3     setosa
## 8            5.0         3.4          1.5         0.2     setosa
## 9            4.4         2.9          1.4         0.2     setosa
## 10           4.9         3.1          1.5         0.1     setosa
## 11           5.4         3.7          1.5         0.2     setosa
## 12           4.8         3.4          1.6         0.2     setosa
## 13           4.8         3.0          1.4         0.1     setosa
## 14           4.3         3.0          1.1         0.1     setosa
## 15           5.8         4.0          1.2         0.2     setosa
## 16           5.7         4.4          1.5         0.4     setosa
## 17           5.4         3.9          1.3         0.4     setosa
## 18           5.1         3.5          1.4         0.3     setosa
## 19           5.7         3.8          1.7         0.3     setosa
## 20           5.1         3.8          1.5         0.3     setosa
## 21           5.4         3.4          1.7         0.2     setosa
## 22           5.1         3.7          1.5         0.4     setosa
## 23           4.6         3.6          1.0         0.2     setosa
## 24           5.1         3.3          1.7         0.5     setosa
## 25           4.8         3.4          1.9         0.2     setosa
## 26           5.0         3.0          1.6         0.2     setosa
## 27           5.0         3.4          1.6         0.4     setosa
## 28           5.2         3.5          1.5         0.2     setosa
## 29           5.2         3.4          1.4         0.2     setosa
## 30           4.7         3.2          1.6         0.2     setosa
## 31           4.8         3.1          1.6         0.2     setosa
## 32           5.4         3.4          1.5         0.4     setosa
## 33           5.2         4.1          1.5         0.1     setosa
## 34           5.5         4.2          1.4         0.2     setosa
## 35           4.9         3.1          1.5         0.2     setosa
## 36           5.0         3.2          1.2         0.2     setosa
## 37           5.5         3.5          1.3         0.2     setosa
## 38           4.9         3.6          1.4         0.1     setosa
## 39           4.4         3.0          1.3         0.2     setosa
## 40           5.1         3.4          1.5         0.2     setosa
## 41           5.0         3.5          1.3         0.3     setosa
## 42           4.5         2.3          1.3         0.3     setosa
## 43           4.4         3.2          1.3         0.2     setosa
## 44           5.0         3.5          1.6         0.6     setosa
## 45           5.1         3.8          1.9         0.4     setosa
## 46           4.8         3.0          1.4         0.3     setosa
## 47           5.1         3.8          1.6         0.2     setosa
## 48           4.6         3.2          1.4         0.2     setosa
## 49           5.3         3.7          1.5         0.2     setosa
## 50           5.0         3.3          1.4         0.2     setosa
## 51           7.0         3.2          4.7         1.4 versicolor
## 52           6.4         3.2          4.5         1.5 versicolor
## 53           6.9         3.1          4.9         1.5 versicolor
## 54           5.5         2.3          4.0         1.3 versicolor
## 55           6.5         2.8          4.6         1.5 versicolor
## 56           5.7         2.8          4.5         1.3 versicolor
## 57           6.3         3.3          4.7         1.6 versicolor
## 58           4.9         2.4          3.3         1.0 versicolor
## 59           6.6         2.9          4.6         1.3 versicolor
## 60           5.2         2.7          3.9         1.4 versicolor
## 61           5.0         2.0          3.5         1.0 versicolor
## 62           5.9         3.0          4.2         1.5 versicolor
## 63           6.0         2.2          4.0         1.0 versicolor
## 64           6.1         2.9          4.7         1.4 versicolor
## 65           5.6         2.9          3.6         1.3 versicolor
## 66           6.7         3.1          4.4         1.4 versicolor
## 67           5.6         3.0          4.5         1.5 versicolor
## 68           5.8         2.7          4.1         1.0 versicolor
## 69           6.2         2.2          4.5         1.5 versicolor
## 70           5.6         2.5          3.9         1.1 versicolor
## 71           5.9         3.2          4.8         1.8 versicolor
## 72           6.1         2.8          4.0         1.3 versicolor
## 73           6.3         2.5          4.9         1.5 versicolor
## 74           6.1         2.8          4.7         1.2 versicolor
## 75           6.4         2.9          4.3         1.3 versicolor
## 76           6.6         3.0          4.4         1.4 versicolor
## 77           6.8         2.8          4.8         1.4 versicolor
## 78           6.7         3.0          5.0         1.7 versicolor
## 79           6.0         2.9          4.5         1.5 versicolor
## 80           5.7         2.6          3.5         1.0 versicolor
## 81           5.5         2.4          3.8         1.1 versicolor
## 82           5.5         2.4          3.7         1.0 versicolor
## 83           5.8         2.7          3.9         1.2 versicolor
## 84           6.0         2.7          5.1         1.6 versicolor
## 85           5.4         3.0          4.5         1.5 versicolor
## 86           6.0         3.4          4.5         1.6 versicolor
## 87           6.7         3.1          4.7         1.5 versicolor
## 88           6.3         2.3          4.4         1.3 versicolor
## 89           5.6         3.0          4.1         1.3 versicolor
## 90           5.5         2.5          4.0         1.3 versicolor
## 91           5.5         2.6          4.4         1.2 versicolor
## 92           6.1         3.0          4.6         1.4 versicolor
## 93           5.8         2.6          4.0         1.2 versicolor
## 94           5.0         2.3          3.3         1.0 versicolor
## 95           5.6         2.7          4.2         1.3 versicolor
## 96           5.7         3.0          4.2         1.2 versicolor
## 97           5.7         2.9          4.2         1.3 versicolor
## 98           6.2         2.9          4.3         1.3 versicolor
## 99           5.1         2.5          3.0         1.1 versicolor
## 100          5.7         2.8          4.1         1.3 versicolor
## 101          6.3         3.3          6.0         2.5  virginica
## 102          5.8         2.7          5.1         1.9  virginica
## 103          7.1         3.0          5.9         2.1  virginica
## 104          6.3         2.9          5.6         1.8  virginica
## 105          6.5         3.0          5.8         2.2  virginica
## 106          7.6         3.0          6.6         2.1  virginica
## 107          4.9         2.5          4.5         1.7  virginica
## 108          7.3         2.9          6.3         1.8  virginica
## 109          6.7         2.5          5.8         1.8  virginica
## 110          7.2         3.6          6.1         2.5  virginica
## 111          6.5         3.2          5.1         2.0  virginica
## 112          6.4         2.7          5.3         1.9  virginica
## 113          6.8         3.0          5.5         2.1  virginica
## 114          5.7         2.5          5.0         2.0  virginica
## 115          5.8         2.8          5.1         2.4  virginica
## 116          6.4         3.2          5.3         2.3  virginica
## 117          6.5         3.0          5.5         1.8  virginica
## 118          7.7         3.8          6.7         2.2  virginica
## 119          7.7         2.6          6.9         2.3  virginica
## 120          6.0         2.2          5.0         1.5  virginica
## 121          6.9         3.2          5.7         2.3  virginica
## 122          5.6         2.8          4.9         2.0  virginica
## 123          7.7         2.8          6.7         2.0  virginica
## 124          6.3         2.7          4.9         1.8  virginica
## 125          6.7         3.3          5.7         2.1  virginica
## 126          7.2         3.2          6.0         1.8  virginica
## 127          6.2         2.8          4.8         1.8  virginica
## 128          6.1         3.0          4.9         1.8  virginica
## 129          6.4         2.8          5.6         2.1  virginica
## 130          7.2         3.0          5.8         1.6  virginica
## 131          7.4         2.8          6.1         1.9  virginica
## 132          7.9         3.8          6.4         2.0  virginica
## 133          6.4         2.8          5.6         2.2  virginica
## 134          6.3         2.8          5.1         1.5  virginica
## 135          6.1         2.6          5.6         1.4  virginica
## 136          7.7         3.0          6.1         2.3  virginica
## 137          6.3         3.4          5.6         2.4  virginica
## 138          6.4         3.1          5.5         1.8  virginica
## 139          6.0         3.0          4.8         1.8  virginica
## 140          6.9         3.1          5.4         2.1  virginica
## 141          6.7         3.1          5.6         2.4  virginica
## 142          6.9         3.1          5.1         2.3  virginica
## 143          5.8         2.7          5.1         1.9  virginica
## 144          6.8         3.2          5.9         2.3  virginica
## 145          6.7         3.3          5.7         2.5  virginica
## 146          6.7         3.0          5.2         2.3  virginica
## 147          6.3         2.5          5.0         1.9  virginica
## 148          6.5         3.0          5.2         2.0  virginica
## 149          6.2         3.4          5.4         2.3  virginica
## 150          5.9         3.0          5.1         1.8  virginica
```
Print the first 6 rows. Command the same as in UNIX, just syntax slightly different (meaing UNIX does not use () around commands).

```r
head(iris)
```

```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1          5.1         3.5          1.4         0.2  setosa
## 2          4.9         3.0          1.4         0.2  setosa
## 3          4.7         3.2          1.3         0.2  setosa
## 4          4.6         3.1          1.5         0.2  setosa
## 5          5.0         3.6          1.4         0.2  setosa
## 6          5.4         3.9          1.7         0.4  setosa
```
Print the last 6 rows. Command the same as in UNIX, just syntax slightly different.

```r
tail(iris)
```

```
##     Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
## 145          6.7         3.3          5.7         2.5 virginica
## 146          6.7         3.0          5.2         2.3 virginica
## 147          6.3         2.5          5.0         1.9 virginica
## 148          6.5         3.0          5.2         2.0 virginica
## 149          6.2         3.4          5.4         2.3 virginica
## 150          5.9         3.0          5.1         1.8 virginica
```
**How do you alter how many lines get printed with head() or tail()?**

    str() prints nice summary of the data.frame including data type of each column   
    

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

*REMEMBER: R counts from 1*

### Retrive elements from a data.frame
> Can you guess what these will return?   


```r
iris[,2]
```


```r
iris[4,]
```


```r
iris[,"Species"]
```


```r
iris[1:2,2]
```


```r
iris[2:5,1:2]
```


```r
iris[c(1,4,7), c(1,3)]
```


```r
iris[which(iris$Sepal.Length > 7.5), ]
```
**What do you think the which() command is doing?**    

### Datafame size

    nrow() to find out the number of rows in the dataframe


```r
nrow(iris)
```

```
## [1] 150
```

    dim() returns the number of rows and columns 


```r
dim(iris)
```

```
## [1] 150   5
```

    colnames() returns the column names of the dataframe 


```r
colnames(iris)
```

```
## [1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width" 
## [5] "Species"
```


# Utilities
There is no need to rewrite a function that already exists in R, either in base R or in the vast amount of packages available for R. Built-in functions, those included with base R, are faster than re-writing them because they are actually written in C. Most of these built-in functions are related to stats, see [here](http://www.statmethods.net/management/functions.html) for more information. 

Get the sum for a column in a dataframe

```r
sum(iris[,"Sepal.Length"])
```

```
## [1] 876.5
```

Get the average (mean) for a column in a dataframe

```r
mean(iris[,"Sepal.Length"])
```

```
## [1] 5.843333
```

Get the smallest value for a column in a dataframe

```r
min(iris[,"Sepal.Length"])
```

```
## [1] 4.3
```

Get the largest value for a column in a dataframe

```r
max(iris[,"Sepal.Length"])
```

```
## [1] 7.9
```

> Play with built in functions    

1. Get the standard deviation for Sepal.Width  

```
```



2. Get the median for Petal.Width  

```
```



3. Create a new variable called "number_list" that goes from 1 to 100 including odds using seq()   

```
```



4. Create a normal distribution using rnorm with length of 100 and the same mean and sd as Sepal.Width  

```
```



# Wrapping Up

* Use Rstudio 
    + Markdown, project management, git !
* Data Structures and Data Types
    + Vectors and Dataframes
* Getting help

## Key Points
* R has the usual arithmetic operators and mathematical functions  
* <- assign values to variables  
* Treat raw data as read-only  
* Treat generated output as disposable  
* Separate function definition and application   
* Use R built-in functions – they are fast  

Do not use spaces, quotes, special characters, or wildcard characters such as ‘*’ or ‘?’ in filenames, as it complicates variable expansion.

Give files consistent names that make logical sense, reflect what the data is and that are easy to match with wildcard patterns to make it easy to select them for looping.


## Self Directed Learning
Data Structures: [Matrix](http://adv-r.had.co.nz/Data-structures.html#matrices-and-arrays), [List](http://r4ds.had.co.nz/lists.html)       

Further Reading : Hadley Wickham’s Advanced R            

* [Data structures](http://adv-r.had.co.nz/Data-structures.html)          
* [Style](http://adv-r.had.co.nz/Style.html)              
* [Subsetting](http://adv-r.had.co.nz/Subsetting.html)             

## Cheat Sheets   
[RStudio](https://www.rstudio.com/wp-content/uploads/2016/01/rstudio-IDE-cheatsheet.pdf)          
[R Markdown](https://www.rstudio.com/wp-content/uploads/2016/03/rmarkdown-cheatsheet-2.0.pdf)           
[R Markdown Reference Guide](https://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf)           
[Data Import](https://github.com/rstudio/cheatsheets/raw/master/source/pdfs/data-import-cheatsheet.pdf)             

## Citation
[Software Carpentry](https://software-carpentry.org/lessons/)          


