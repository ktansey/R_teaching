# Lecture3_Practicals
Katherine Tansey  
7/3/2017  

# Learning Objectives

* Familiarity with dplyr and tidyr packages     
* Understand the meaning of tidy data     
* Do dataframe manipulations      
* Join data sets together      
* Perform data manipulations with dplyr      

# What we did last time
We learned where to find R packages: [CRAN](https://cran.r-project.org/web/packages/available_packages_by_name.html) and [BioConductor](http://bioconductor.org/packages/release/BiocViews.html#___Software). How to install and load packages in R.    

```r
install.packages("dplyr")
library(dplyr)
```

How to import and export data. Both need two things:   
1. Need to tell R where data is or where we want data to go  
2. Load or export data via a specific R command     


```r
setwd("/Users/katherine/Documents/Courses_and_Workshops/Medic_Masters/Compute_Module_2017/R/")

life_expec <- read.table("/Users/katherine/Documents/Courses_and_Workshops/Medic_Masters/Compute_Module_2017/R/Lecture2_data/life_expec.csv", sep=",")

write.table(life_expec, file = "/Users/katherine/Documents/Courses_and_Workshops/Medic_Masters/Compute_Module_2017/R/Lecture2_data/life_expec.txt")
```

About how R sometimes gets data types incorrect which can lead to coercion. 

```r
#install.packages("babynames")
library(babynames)
babynames$sex <- as.factor(babynames$sex)
babynames$sex1 <- as.character(babynames$sex)
babynames$sex2 <- as.numeric(babynames$sex)
summary(babynames)
```

Learned the R syntax for control flow (if/else statements)

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
And the R syntax for while loops

```r
x = 1
while (x < 20) { 
	print("number too low")
	x = x + 1
}
```
And for loops

```r
for (x in 1:10) {
	print(x)
}
```
How to create an output file for results in a for loop

```r
# loop output into a dataframe 
obj <- data.frame(sepal.area=0, petal.area)

for(i in 1:nrow(iris)){
	sepal.area <- iris[i, ]$Sepal.Length * iris[i, ]$Sepal.Width 
	petal.area <- iris[i, ]$Petal.Length * iris[i, ]$Petal.Width
    # save reults to the empty list marking it by the number (row or column number)
	obj[i,] <- c(sepal.area, petal.area)
}
```
Putting different loop and conditionals together

```r
babynames_1880 <- babynames[babynames$year == 1880, ]
babynames_1880$popular <- NA
for(i in 1:nrow(babynames_1880)){
    if(babynames_1880[i, ]$prop > 0.02){
        babynames_1880[i, ]$popular <- "common"
    } else {
        babynames_1880[i, ]$popular <-  "not as common"
    }
}
```
About apply functions

```r
apply(alcohol_G8_matrix, 1, mean)
apply(alcohol_G8_matrix, 2, mean)

by(iris[,1:4], iris$Species, colMeans)

tapply(iris[,1], iris$Species, mean)
```

# Tidy data and tidyr
We will be working mainly with packages from [tidyverse](http://tidyverse.org/) to perform data manipulations and transformations. The tidyverse package is a package of packages, does not contain its own funcitons per se but includes a [variety of other packages](https://blog.rstudio.org/2016/09/15/tidyverse-1-0-0/), like [dplyr](http://dplyr.tidyverse.org/), [tidyr](http://tidyr.tidyverse.org/), [ggplot2](http://ggplot2.org/). Therefore by installing and loading the tidyverse package, we install and load all of these other packages as well.        

## Understanding the structure of the data
Various functions exist to look at the data and give you basic information about it (like what type of data it is (numeric, character, etc.)). We have already looked at most of these (class, dim, colnames, str, and summary)

* class() -> class of data
* dim() -> how many rows and columns
* colnames() -> column names
* str() -> data preview, and column data types
* glimpse() -> similar to str(), dplyr function
* summary() -> summary of data

> Let’s examine the data

Let's first get a dataset to work on. Download data from [OECD](https://data.oecd.org/emp/hours-worked.htm) about annual hours work by country. 

Load data into R and call it *data*    
```
```



Examine the data
```
```



## Looking at your data
We have looked at these previously:        
* head() -> prints to screen first few rows of data         
* tail() -> prints to screen last few rows of data        
* print() -> prints to screen data             

*Do not use print if you have a lot of data.*  This will print all the rows and columns in the dataset to the screen and if you have a few thousand rows or columns it is really pointless.  

> View the data
```
```



## Tidy data
Data currently looking at is pretty tidy. There is one row per each observation (Country and Year). However this is not always the case. Let's have a look at messy data. 

> Look at two datasets, what makes one tidy and the other not?      

Download data from [Data.gov](https://catalog.data.gov/dataset?_organization_limit=0&organization=hhs-gov#topic=health_navigation) about nutrition, physical activity and obesity.  Load data into R and call the data *messy_data*.

Load data into R
```
```



Examine and view the messy_data
```
```



**Why would I think this data is messy?**

## Reshape data
Wide data contains multiple columns for recurring entries, like year, day, book, etc. So one row will have multiple values for a single observation, seperates by some factor. Whereas long data contains one row for every observation. Depending on what type of statistics or plot you are making will determine which data format is most appropriate for your data. 

To go from wide to long format:

```r
gather(data, key, value, columns_info)

# Example
gather(hp_data, Book, Mentions, -Name)
```

To go from long to wide format:

```r
spread(data, key, value)

# Example
spread(hp_data, Book, Mentions)
```

**What format is data in?**

> Reshape data

Reshape *data* to wide format, and save as a new dataframe called *data_wide*
```
```




Reshape *data_wide* to long format, and save as a new dataframe called *data_long*
```
```



**How is data_long different from data?**
Is there a way we could prevent this? 



There are other ways to reshape data in R. One way is to use the package [reshape2](https://cran.r-project.org/web/packages/reshape2/reshape2.pdf). [Melt](https://www.rdocumentation.org/packages/reshape2/versions/1.4.2/topics/melt) function performs the same task as gather, and [cast](https://www.rdocumentation.org/packages/reshape2/versions/1.4.2/topics/cast) performs the same task as spread. There is not a pro/con to which one you use, both will achieve the same result just using different approaches (and different command syntax) to get there.       

## Transpose data

Sometimes there is a need to complete switch the data, meaning the rows need to become columns and the columns need to be the rows. This is called transposing the dataset. This is easily accomplished in R using the following syntax. 


```r
tdata <- t(data_wide[,-c(2:6)])
```
This results in not having column names where we want them which can be solved.  Google to see what solutions the internet gives you for this problem


```r
tdata <- t(data_wide[,-c(1:6)])
colnames(tdata) <- data_wide[,1]
```


```r
tdata <- setNames(data.frame(t(data_wide[,-c(1:6)])), data_wide[,1])
```

## Manipulate data in columns
There are multiple differnt ways to manipulate column information. 
Create two columns from one column, where information is seperate within the column by a specific delimiter.     

```r
separate(dataset1, col = chr_pos_(b36), into = c("CHR", "BP"), sep = ":")
```


```r
unite(dataset1, ID, CHR, BP, A1, A2, sep = ":")
```

Multiple ways to manipulate the text within datasets. These functions come from the R package [stringr](https://www.rdocumentation.org/packages/stringr/versions/1.1.0). 

* str_trim(x, side = c("both", "left", "right")) -> remove leading and trailing white spaces
* str_pad(x, width, side = c("left", "right", "both"), pad = " ") -> add additional characters
* str_detect(x, pattern) -> look for a  pattern
* str_replace(x, pattern, replacemnt)  -> find and replace 
* str_split(x, pattern) -> splits string into multiple pieces
* to_upper(x) -> make all uppercase
* to_lower(x) -> make all lowercase

> Manipulating columns in dataset

There are three different Genome wide association results in Lecture3_data folder. Each needs a different manipulation.

1. File called CHIC_Summary_Benyamin2014_chr22.txt which contains the results from chromosome 22 for childhood intelligence from [Benyamin et al 2014](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3935975/). Load the data into R and remove the "chr" before the chromosome number.

```
```



2. File called Cardiogram_GWAS_results_chr22.txt which contains the results from chromosome 22 for coronary artery disease from [Schunkert et al 2010](http://www.nature.com/ng/journal/v43/n4/full/ng.784.html). Load the data into R and do two things (1) split the column into two, one that contains chr information and one that contains base position information, and (2) remove the "chr", and 

```
```



3. File called ucmeta-sumstats_chr22.txt which contains the results from chromosome 22 for ulcerative colitis from [Anderson et al 2011](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3084597/). And assess what needs to be done. 

```
```


**Can you do the above in one step using the [tidyr command extract](https://rdrr.io/cran/tidyr/man/extract.html)?**      
Extract uses regular expressions which are a powerful tools but can be difficult to understand. Try to do this in one step with extract, and see [here](https://stackoverflow.com/questions/34814927/break-string-into-several-columns-using-tidyrextract-regex) for some useful tips.       

# Missing Data
Missing data in R is given a unique identifier *NA*. This literally means *not available*.        

When importing data from other sources (Excel, SPSS, etc.) it is good to know what the missing notation is in those files. Some use -9 or another numeric, or have just a blank space. When importing data into, the notation for missing can be set, so missing data is correctly identified by R.       

To convert missing notations to R notations:

```r
data$col1[data$col1 == “-9"] <- NA
```

There are a few other special notations in R.  

* *Inf* means *Infinity*        
If you are not expecting infinite values this probably indicates an outlier or bad data input value.  

* *NaN* means *not a number*      
This can occur if mixed data type coerced to a number.       

Quantifing missingness using **summary()** or **is.na()**         

To remove missingness:


```r
complete.cases(data_wide)
```
This just returns a logical for each row, which isn't overly infomative. Wrapping the command around **summary()** is much more interpretable. 


```r
summary(complete.cases(data_wide))
```

FALSE means there is missing data for that row, and TRUE is that there is no missing data for that row. To create a new dataset without any missingness using **complete.cases()** run the code below:


```r
data_wide_nomissing <- data_wide[complete.cases(data_wide),]
```
That leaves use with nothing as each row had missing data, but trust me it should work.   

Another way to remove missing data is to use **na.omit()**


```r
data_wide_nomissing <- na.omit(data_wide)
```

## Missing and Utilites

```r
mean(data_wide[,"1980"])
```
**Why is this result occuring? What does the documentation about mean tell you?**


If there is missing information, a lot of built-in statistical utilities will return *NA* instead of the expected result. This is due to the default parameters within the fucntions. *na.rm = FALSE* is the default for these utilies, meaning that missing data is not removed, and therefore means, sd or any other operation can not perform its task because not all the information is there. To correct of this, the default needs to be over ridden.       


```r
mean(data_wide[,"1980"], na.rm = TRUE)
```

> How much missing is there?

Using data from [gapminder](http://www.gapminder.org/data/) about working hours per week by year for multiple countries. File is called *indicator_hours per week.xlsx* and is located in the Lecture3_data folder. Load the data into R and determine the amount of missing per year.

```
```



# Joining data    
Datasets must share at least one column with the same/similar infomration that you wan to join them together on, called a **key**. This can be one or multiple columns, but most important is the hte **key** or **keys** uniquely identify each row. If not, and there are multiple matches, all combination of the matches will occur.

There are a variety of different joins.      
![](/Users/katherine/Documents/Courses_and_Workshops/Medic_Masters/Compute_Module_2017/R/Pictures/joins.png)

## Left join
Join dataset2 to dataset1 

```r
left_join(dataset1, dataset2, by = "key")
left_join(dataset1, dataset2, by = c("key1", "key2"))
```
Return all rows from dataset1, and all columns from dataset1 and dataset2. If a row exists only in dataset1, data is retained. If a row exists only in dataset2, data is not retained.     

## Right join
Does the exact opposite of a left_join.   
Join dataset1 to dataset2  

```r
right_join(dataset1, dataset2, by = "key")
right_join(dataset1, dataset2, by = c("key1", "key2"))
```
Return all rows from dataset2, and all columns from dataset1 and dataset2. If a row exists only in dataset1, data is not retained. If a row exists only in dataset2, data is retained.       

## Inner join

```r
inner_join(dataset1, dataset2, by = "key")
```
Return only rows that exist in both datasets        

## Full join

```r
full_join(dataset1, dataset2, by = "key")
```
Return all rows in both datasets       

> Play with joins

1. Gapminder data.
Get working hours per week (indicator_hours per week.xlsx) with countries annotated by continent (Countries_data.csv).

```
```




2. How many SNPs are shared between Cardiogram_GWAS_results_chr22.txt and CHIC_Summary_Benyamin2014_chr22.txt?       

```
```
3. How many are shared if matching on SNP, CHR and BP?       

```
```
4. What is going on here? Is the same true if you join ucmeta-sumstats_chr22.txt to Cardiogram_GWAS_results_chr22.txt based on SNP, CHRand BP?   

```
```


## Filtering joins

###Semi join  
Filters dataset1 based on data in dataset2

```r
semi_join(dataset1, dataset2, by="key")
```
Return all rows of dataset1 that match rows in dataset2, AND only the columns from dataset1. *Does not actually join the datasets together*. Results do not included data from dataset2.      

### Anti join  
Filters dataset1 based on data in dataset2          

```r
anti_join(dataset1, dataset2, by="key")
```
Return all rows of dataset1 that DO NOT match rows in dataset2, AND only the columns from dataset1. *Does not actually join the datasets together*. Results do not included data from dataset2.        

> Play with joins

1. Just the SNPs in ucmeta-sumstats_chr22.txt that match those in Cardiogram_GWAS_results_chr22.txt        

```
```


 
2. Just the SNPs in ucmeta-sumstats_chr22.txt that *do not* match those in Cardiogram_GWAS_results_chr22.txt      

```
```


 
## Set operations
![](/Users/katherine/Documents/Courses_and_Workshops/Medic_Masters/Compute_Module_2017/R/Pictures/sets.png)
Used for datasets that have the exact same columns.  Unlike joins which can be used on datasets with differing columns as long as there is a *key* or *keys* to match on. Honestly, I would use joins and not these, but it is worth knowing these exist. 

All the set operations have the same syntax returning differing results. There is no key option.

```r
union(dataset1, dataset2)

intersect(dataset1, dataset2)

setdiff(dataset1, dataset2)

setequal(dataset1, dataset2)
```

> Set operations

In Lecture3_data, there are four datasets about characters in Harry Potter Universe separated by house. Use union to join these all together.

```
```



**Is there a better way to do this?**

## Binds
Datasets contain the **exact same columns** in the **exact same order**        
Use **bind_rows** to append dataset2 to dataset2       

```r
bind_rows(dataset1, dataset2)
```

Or use **bind_cols** to lazy join dataset2 as new columns in dataset1. However, **bind_cols** does *NOTHING to match the rows*! It *assumes rows in matching order*, which may be a big assumption!!!!             

```r
bind_cols(dataset1, dataset2)
```

Or with multiple datasets      

```r
bind_rows(list(dataset1, dataset2, dataset3))
```

> binds

Perform the same join as above (when we used union), but instead do in one step with [bind_rows](https://rdrr.io/cran/dplyr/man/bind.html)       
```
```



**What is the difference between union and bind_rows?**     

# Data Manipulation with dplyr

## Select 
Use to select only certain columns from a datasets (or to remove certain columns from a dataset).               

![](/Users/katherine/Documents/Courses_and_Workshops/Medic_Masters/Compute_Module_2017/R/Pictures/select.png)


```r
select(gapminder, country, year, lifeExp)

# vectorized
select(gapminder, country:year)

# to not select a column
select(gapminder, -country
```

If you want to use the gapminder data made available in R, install the gapminder packages and load the library.                

The select command in dplyr is problematic as it is a function named used by lots of other packages. Therefore, depending on what packages you have loaded, you may get an error when using dplyr's select that does not make any sense. You can call the dplyr select function specifically using the following syntax:


```r
dplyr::select()
```
This tells R to use the dplyr select function specifically.   

There are *LOADS* of helper functions that work with select, to make it easier to select multiple columns at once in larger datasets.            

* starts_with("Hap") -> ALL columns whose name starts with "Hap"        
* ends_with("ppy") -> ALL columns whose name ends with "ppy"          
* contains("app") -> ALL columns whose name contains "app"           
* matches("^(SNP|CHR)_") -> ALL columns who name match a regular expression         
* num_range("x", 1980:1983) -> ALL columns named x1980, x1981, x1982, and x1983        
* one_of(char_vector) -> ALL columns who name appears in character vector (char_vector)          

> select          

Import data about countries (Countries_data.csv) from Lecture3_data. Keep only the relevant columns (name, region, sub-region)                  

```
```



## Filter          
Use to filter to keep only certain rows from a datasets (or to remove certain rows from a dataset). Use conditional to keep only the rows that match the criteria.                

![](/Users/katherine/Documents/Courses_and_Workshops/Medic_Masters/Compute_Module_2017/R/Pictures/filter.png)


```r
# single filter
filter(gapminder, year == 1997)

# multiple filters
filter(gapminder, year == 1997 & gdpPercap > 1000)
filter(gapminder, year == 1997 | year == 1967)
```

> filter         

Filter countries to keep only those in North America and Europe.

```
```



## Arrange 
Use to arrange rows by values or sort columns in a dataset. Can do ascending or descending sorts.              

![](/Users/katherine/Documents/Courses_and_Workshops/Medic_Masters/Compute_Module_2017/R/Pictures/arrange.png)


```r
# single parameter ascending arrange
arrange(gapminder, lifeExp)

# single parameter descending arrange
arrange(gapminder, desc(lifeExp))

# multiple parameter arrange
arrange(gapminder, desc(lifeExp), pop)
```
In a multiple parameter arrange, the order is important. In the example above, the gapminder data is first sorted by *desc(lifeExp)* with any ties broken by value of *pop*.         

> arrange 

Load the working hours per week data (indicator_hours per week.xlsx) in Lecture3_data. Which country worked the most hours per week in 2007? 


```
```




## Group
Group together rows of data by some factor within the dataset. This command does very little on its own, but is very useful and powerful once combined with summarise. 


```r
# single variables
group_by(gapminder, continent)

# multiple variables
group_by(gapminder, country, continent)
```

> group

Group countries (Countries_data.csv) by region and look at what the dataset looks like     
```
```


Does the output look different if you group by region and sub.region?        

## Summarise 
Create summary statistics from datasets. Really works best when combined with group_by.             

![](/Users/katherine/Documents/Courses_and_Workshops/Medic_Masters/Compute_Module_2017/R/Pictures/summarise.png)

> summarise

Merge the smaller version of countries (just name, region and sub region) with hours.  Get the mean and median hours worked by region and sub region for 2007.        
```
```


Notice the output is in table format, which can be saved as dataframe. 

## Mutate
Create new variables in a dataset using existing columns.        

![](/Users/katherine/Documents/Courses_and_Workshops/Medic_Masters/Compute_Module_2017/R/Pictures/mutate.png)
 

```r
# single variables
mutate(gapminder, gdp_billion=gdpPercap*pop/10^9)

#  multiple variables
mutate(dataset1, rate = NUM1/100, norm = Value2 - 50)
```

> mutate

Create a new variable which is the estimated total number of hours worked in 2007.    

```
```




## Pipe
Like in UNIX, dplyr allows for commands to be piped together using the **%>%** operator.       


```r
gapminder %>%
    group_by(country) %>%
    summarise(mean_LE = mean(lifeExp, na.rm=TRUE))
```
*NOTICE* input data information for each command is now missing, and the subsequent "piped" commands are indented. The indentation makes it easier to follow the trail of commands within the pipe.      

When to not use a pipe:      

1. Multiple inputs or outputs                  
    + Pipes should focus on one clear task for one object       
2. More than 10 steps           
3. Directed graph structure              
    + Pipes are linear, they don’t loop back round!            

> pipe

1. Use gapminder data from R. Average life expectancy by country and year, and sorted for the longest life expectancy.   

Access gapminder data by:

```r
# remember you only have to install a package once
install.packages("gapminder")
library(gapminder)
head(gapminder)
```

```
```




2. Redo this task, but pipe them all together

Merge the smaller version of countries (just name, region and sub region) with hours.  Get the mean and median hours worked by region and sub region for 2007.        
```
```




3. Use gapminder data from R. Sort countries by their change in GDP from 1952 to 2007. This one is definite challenge and these other dplyr commands may help [lead and lag](https://rdrr.io/cran/dplyr/man/lead-lag.html) and [n](https://www.rdocumentation.org/packages/dplyr/versions/0.5.0/topics/n).  

```
```




# Wrapping Up
## Key Points
* Concepts of tidy data and how to create it     
    + Reshape data, manipulate columns, manipulate strings      
* Missing data      
    + Symbol      
    + Quantification          
    + Concept of informative missingness           
* Multiple options to join data together depending on outcome wanted         
* dplyr for data manipulation         
    + 6 key verbs         
    + Pipe (%>%) commands together         

## Self Directed Learning
There are **A LOT** of other dplyr functions that are helpful, like [distinct()](https://www.rdocumentation.org/packages/dplyr/versions/0.5.0/topics/distinct), [tally()](https://www.rdocumentation.org/packages/dplyr/versions/0.5.0/topics/tally), [n()](https://www.rdocumentation.org/packages/dplyr/versions/0.5.0/topics/n)

For more see: [Window functions](https://cran.r-project.org/web/packages/dplyr/vignettes/window-functions.html) or [Full list of package commands](https://cran.r-project.org/web/packages/dplyr/dplyr.pdf)


Working with dates in R is difficult, or really working with dates in any coding/programming language is more difficult than one would assume. Two resources to look at:        

1. [lubridate](https://cran.r-project.org/web/packages/lubridate/vignettes/lubridate.html)             
2. Hadley Wickham’s R for Data Science : [Dates and Time](http://r4ds.had.co.nz/dates-and-times.html)         

Other packages for data manipulation: [data.table](https://cran.r-project.org/web/packages/data.table/vignettes/datatable-intro.html)       

## Cheat Sheet
[Data Transformation](https://github.com/rstudio/cheatsheets/raw/master/source/pdfs/data-transformation-cheatsheet.pdf)       

## More Reading 
[R for Data Science](http://r4ds.had.co.nz/index.html)         
[Tidy Data](https://cran.r-project.org/web/packages/tidyr/vignettes/tidy-data.html)             
[Data Transformations](http://r4ds.had.co.nz/transform.html)
[Joins](https://cran.r-project.org/web/packages/dplyr/vignettes/two-table.html)


# Something to try out for next time
Use BMI data in Lecture3_data (Indicator_BMI female ASM.xlsx) and (Indicator_BMI male ASM.xlsx).    

Rearrange into long format and join datasets together.    
Join data with country region information (Countries_data.csv).       
Which countries have the highest BMI for males in females?       
Which have the lowest?        
What are the top regions and sub-regions for high and low BMI? 
