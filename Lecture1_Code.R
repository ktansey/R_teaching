
x <- 43 # a number
y <- "hello" # a word/character


horses <- 9
cows <- 32
chickens <- 19
sheep <- 24
dogs <- 2
cats <- 6
goldfish <- 4


farmyard <- horses + cows + chickens + sheep


household <- dogs + cats + goldfish


farmyard/household

# Vectorization
1:5
2^(1:5)

character_vector <- c("Harry Potter", "Ron Weasley", "Hermione Granger", "Neville Longbottom")



numeric_vector <- c(1,2,3,4,5,6)
logical_vector <- c(TRUE, FALSE, FALSE, TRUE)

character_vector[1]
character_vector[3]
character_vector[1:3]
character_vector[c(1,3)]

money_earned <- c(85, 14, 67, 33, 54)
money_spent <- c(62, 42, 36, 75, 94)

money_total <- money_earned - money_spent

made_money <- money_total > 0

good_days <- money_total[made_money]

good_days2 <- money_total[made_money > 0]

HP <- c("Harry Potter", "Ron Weasley", "Hermione Granger")
HG <- c("Katniss Everdeen", "Peeta Mellark", "Gale Hawthorne")

Book_PPL <- HP + HG


v1 <- c(TRUE, FALSE, FALSE, TRUE)
v2 <- c(TRUE, FALSE, FALSE, TRUE)

v3 <- v1 + v2



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

# Name the columns with alcohol
colnames(alcohol_G8_matrix) <- types

# Name the rows with countries
rownames(alcohol_G8_matrix) <- countries

# Print out alcohol_G8_matrix
alcohol_G8_matrix

alcohol_G8_matrix[,2]
alcohol_G8_matrix[4,]
alcohol_G8_matrix[,"Beer"]
alcohol_G8_matrix["UK",]
alcohol_G8_matrix[1:2,2]
alcohol_G8_matrix[2:5,1:2]
alcohol_G8_matrix[c(1,4,7), c(1,3)]


country_totals <- rowSums(alcohol_G8_matrix)
alcohol_totals <- colSums(alcohol_G8_matrix)

China <- c(79, 192, 8)

alcohol_G9_matrix <- rbind(alcohol_G8_matrix, China)


Brazil <- c(245, 145)
alcohol_G10_matrix <- rbind(alcohol_G9_matrix, Brazil)


units <- alcohol_G8_matrix/3
units

mean(alcohol_G8_matrix)

mean(alcohol_G8_matrix[,1])

averageBeerConsumption <- sum(alcohol_G8_matrix[,"Beer"]) / nrow(alcohol_G8_matrix)
highestWine <- max(alcohol_G8_matrix[, "Wine"])
lowestWine <- min(alcohol_G8_matrix[, "Wine"])




sex_vector <- c("Male", "Female", "Female", "Male", "Male")

factor_sex_vector <- factor(sex_vector)

factor_sex_vector

summary(factor_sex_vector)


movie_ratings <- c("bad", "okay", "okay", "good", "amazing", "horrible", "bad", "amazing")

# Convert movie_ratings to non-ordered factor vector
factor_movie_ratings <- factor(movie_ratings)

# Print factor_movie_ratings
factor_movie_ratings
summary(factor_movie_ratings)

# Convert movie_ratings to ordered factor vector
factor_movie_ratings2 <- factor(movie_ratings, ordered=T, levels = c("horrible", "bad", "okay", "good", "amazing"))

# Print factor_movie_ratings
factor_movie_ratings2
summary(factor_movie_ratings2)

# what is the difference 



# dataframe
iris

head(iris)

tail(iris)

str(iris)

iris[,2]
iris[4,]
iris[,"Species"]
iris[1:2,2]
iris[2:5,1:2]
iris[c(1,4,7), c(1,3)]



sum(iris[,"Sepal.Length"])


mean(iris[,"Sepal.Length"])


min(iris[,"Sepal.Length"])


max(iris[,"Sepal.Length"])



# install packages
install.packages("dplyr")
library(dplyr)
mutate()


# importing data

# Import .csv
gapminder <- read.csv("gapminder-FiveYearData.csv")

# Print the structure of gapminder
str(gapminder)

read.csv

help(read.csv)

# Import .txt


hp_first_1 <- c("Harry", "Hermione", "Ron")
hp_last_1 <- c("Potter", "Granger", "Weasley")
hp_house_1 <- c("Gryffindor", "Gryffindor", "Gryffindor")
hp_mentions_1 <- c(18956, 5486, 6464)

data1 <- data.frame(hp_first_1, hp_last_1, hp_house_1)
data2 <- data.frame(hp_first_1, hp_last_1, hp_mentions_1)

bind_cols(data1, data2)


#Let's first get a dataset to work on. Download data from [Data.gov](https://catalog.data.gov/dataset?_organization_limit=0&organization=hhs-gov#topic=health_navigation) about nutrition, physical activity and obesity. 

#Load data into R

data <- read.csv("/Users/katherine/Downloads/P00000001-NJ.csv")

#Examine the data


library(dplyr)
class(data)
dim(data)
colnames(data)
str(data)
glimpse(data) 
summary(data) 



data1 <- data.frame(replicate(10,sample(0:1,1000,rep=TRUE)))
z_score <- function(x) {
    zscore <- (x - mean(x)) / sd(x)
    zscore
}
data1[] <- lapply(data1, z_score)




df <- data.frame(A = 1:10, B = 11:20, c = 21:30)
df <- as.data.frame(lapply(df, function(cc) cc[ sample(c(TRUE, NA), prob = c(0.85, 0.15), size = length(cc), replace = TRUE) ]))
z_score <- function(x,missing=TRUE) {
    zscore <- (x - mean(x, na.rm=missing)) / sd(x, na.rm=missing)
}
df1 <- apply(df, 2, z_score)

y <- 400
add_squared_numbers <- function(x) {
    z <- x * x
    a <- y * y
    z + a
}

add_squared_numbers(6)


data1 <- data.frame(replicate(10,sample(seq(0,10,1),1000,rep=TRUE)))
make_histogram <- function(data, color, ...) {
    hist(data, col=color, ... )
}
make_histogram(data1[,1], "red", breaks=10, border = "green")

x <- 1
h <- function() {
    y <- 2
    i <- function() {
        z <- 3
        c(x, y, z)
    }
    i()
}
h()



add_squared_numbers <- function(x,y) {
    if (is.numeric(x) == FALSE | is.numeric(y) == FALSE) {
        stop("'x' and 'y' must be numbers", call.=FALSE)
    }
    z <- x * x
    a <- y * y
    z + a
}
add_squared_numbers("dog" ,10)

add_squared_numbers <- function(x,y) {
    stopifnot(is.numeric(x)  & is.numeric(y))
    z <- x * x
    a <- y * y
    z + a
}
add_squared_numbers("6",10)


library(plotly)

set.seed(100)
d <- diamonds[sample(nrow(diamonds), 1000), ]

p <- ggplot(data = d, aes(x = carat, y = price)) +
    geom_point(aes(text = paste("Clarity:", clarity)), size = .5) +
    geom_smooth(aes(colour = cut, fill = cut)) + facet_wrap(~ cut)

p <- ggplotly(p)

p



library(tidycensus)
library(tidyverse)

census_api_key("6ad79b8a3cf32f80027b2be66c6ff02007af0814")

m90 <- get_decennial(geography = "state", variables = "H043A001", year = 1990)
head(m90)

m90 %>%
    ggplot(aes(x = value, y = reorder(NAME, value))) + 
    geom_point()
v15 <- load_variables(2015, "acs5", cache = TRUE)

View(v15)

nj <- get_acs(geography = "county", variables = "B19013_001", state = "NJ")

head(nj)

nj %>%
    mutate(NAME = gsub(" County, NJ", "", NAME)) %>%
    ggplot(aes(x = estimate, y = reorder(NAME, estimate))) +
    geom_errorbarh(aes(xmin = estimate - moe, xmax = estimate + moe)) +
    geom_point(color = "red", size = 3) +
    labs(title = "Household income by county in NJ",
         subtitle = "2011-2015 American Community Survey",
         y = "",
         x = "ACS estimate (bars represent margin of error)")


library(ukbabynames)

royal <- ukbabynames %>% filter(name==c("William", "George", "Harry")) 

ggplot(diamonds, aes(x = carat, y = price )) +
    geom_point(color = "blue")

ggplot(diamonds, aes(x = carat, y = price )) +
    geom_point()

ggplot(diamonds, aes(x = carat, y = price )) +
    geom_jitter(alpha = 0.2, shape = 1)

ggplot(Vocab, aes(x=education, y = vocabulary)) +
    geom_point()

ggplot(Vocab, aes(x=education, y = vocabulary)) +
    geom_jitter(alpha = 0.2, shape = 1)

ggplot(diamonds, aes(x = color, y = price, fill = color)) +
    geom_boxplot()


ggplot(diamonds) +
    geom_histogram(mapping = aes(x = price))

ggplot(diamonds) +
    geom_density(mapping = aes(x = price))

ggplot(diamonds) + 
    geom_bar(mapping = aes(x = cut))

ggplot(diamonds) + 
    geom_bar(mapping = aes(x = cut, fill = clarity), position = "stack")

ggplot(diamonds) + 
    geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

ggplot(diamonds) + 
    geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

diamonds_avg <- diamonds %>%
    group_by(clarity) %>%
    summarise(price_mean = mean(price, na.rm = T),
              price_sd = sd(price, na.rm = T) ) 
               
ggplot(diamonds_avg) + 
    geom_errorbar(mapping = aes(x = factor(clarity), 
                                ymin = price_mean - price_sd, 
                                ymax = price_mean + price_sd ))


ggplot(mtcars) +
    geom_point(mapping = aes(x = mpg, y = wt))

ggplot(mtcars) +
    geom_jitter(mapping = aes(x = mpg, y = wt))

ggplot(mtcars) +
    geom_smooth(mapping = aes(x = mpg, y = wt))

ggplot(mtcars) +
    geom_text(mapping = aes(x = mpg, y = wt, label = cyl))

ggplot(mtcars) +
    geom_point(mapping = aes(x = mpg, y = wt)) +
    geom_abline(slope = -0.1409 , intercept = 6.0473 )

ggplot(mtcars) +
    geom_point(mapping = aes(x = mpg, y = wt)) +
    geom_vline(xintercept = 30) +
    geom_hline(yintercept = 3)

USPersonalExpenditure <- as.data.frame(USPersonalExpenditure)
USPersonalExpenditure_long <- USPersonalExpenditure %>%
    rownames_to_column(var="Expense") %>%
    gather(key = year, value = amount, -Expense)

ggplot(USPersonalExpenditure_long) +
    geom_line(mapping = aes(x=year, y = amount, group = Expense))

ggplot(USPersonalExpenditure_long) +
    geom_line(mapping = aes(x=year, y = amount, group = Expense, col = Expense))

ggplot(mtcars) + 
    geom_boxplot(mapping = aes(x = factor(cyl), y=wt  ))

ggplot(mtcars) + 
    geom_violin(mapping = aes(x = factor(cyl), y=wt  ))

ggplot(mtcars) + 
    geom_violin(mapping = aes(x = factor(cyl), y=wt  ))  + 
    geom_boxplot(mapping = aes(x = factor(cyl), y=wt  ), width = 0.1)

ggplot(diamonds) + 
    geom_boxplot(mapping = aes(x = cut, y = price)) +
    facet_grid(color ~ clarity)

ggplot(diamonds) + 
    geom_point(mapping = aes(x = carat, y = price, color = color )) +
    facet_grid(. ~ clarity)

ggplot(cps1) +
    geom_histogram(mapping = aes(x = re74 )) +
    facet_grid(nodeg ~ marr, scales = "fixed")

ggplot(cps1) +
    geom_histogram(mapping = aes(x = re74 )) +
    facet_grid(nodeg ~ marr, scales = "free")

ggplot(mtcars, mapping = aes(x = mpg, y = wt)) +
    geom_jitter() +
    geom_smooth()

ggplot(mtcars, mapping = aes(x = mpg, y = wt)) +
    geom_jitter() +
    geom_smooth(method = "lm")

ggplot(mtcars, mapping = aes(x = mpg, y = wt)) +
    geom_jitter() +
    geom_smooth(method = "lm", se = F)

ggplot(mtcars, mapping = aes(x = mpg, y = wt, col = factor(cyl))) +
    geom_jitter() +
    geom_smooth( se = F)

ggplot(mtcars, mapping = aes(x = mpg, y = wt, col = factor(cyl))) +
    geom_jitter() +
    geom_smooth(method = "lm", se = T, fullrange = TRUE)

ggplot(diamonds, mapping = aes(x = cut, y = price)) +
    stat_summary(fun.data = mean_sdl, fun.args = list(mult=1))

install.packages("ggplot2movies")
library(ggplot2movies)

movies_budget <- movies[!is.na(movies$budget) &movies$mpaa != "", ]

ggplot(movies_budget, aes(x = mpaa, y = rating, group = mpaa)) +
    geom_point() +
    stat_summary(fun.y = median, fun.ymax = max, fun.ymin = min, color = "red")

ggplot(movies_budget, aes(x = mpaa, y = rating, group = mpaa)) +
    stat_summary(fun.y = median, fun.ymax = max, fun.ymin = min, color = "red")

ggplot(movies_budget, aes(x = mpaa, y = rating, group = mpaa)) +
    geom_point() +
    stat_summary(fun.data = "mean_cl_boot", color = "red", geom = "crossbar")

ggplot(movies_budget, aes(x = mpaa, y = rating, group = mpaa)) +
    geom_point() +
    stat_summary(fun.data = "mean_sdl", color = "red", geom = "crossbar")


ggplot(movies_budget, aes(x = budget, y = rating, group = mpaa)) +
    geom_point() 

ggplot(movies_budget, aes(x = budget, y = rating, group = mpaa)) +
    geom_point() +
    coord_fixed()

ggplot(movies_budget, aes(x = budget, y = rating, group = mpaa)) +
    geom_point() +
    ylim(0,10) 

ggplot(movies_budget, aes(x = mpaa)) +
    geom_bar()

ggplot(movies_budget, aes(x = mpaa)) +
    geom_bar() +
    coord_flip()

ggplot(movies_budget, aes(y= budget, x = rating)) +
    geom_point() +
    geom_smooth()

ggplot(movies_budget, aes(y= budget, x = rating)) +
    geom_point() +
    geom_smooth() +
    xlim(7.5, 10)

ggplot(movies_budget, aes(y= budget, x = rating)) +
    geom_point() +
    geom_smooth() +
    coord_cartesian(xlim=c(7.5,10))


ggplot(movies_budget, aes(y= budget, x = rating)) +
    geom_point()

qplot(y= budget, x = rating, data = movies_budget)

ggplot(movies_budget, aes(x = rating)) +
    geom_histogram()

qplot( x = rating, data = movies_budget)


data_pgc <- read.table("/Users/katherine/Dropbox/other_GWAS_results/PGC/pgc.bip1.full.txt", h = T)

data_pgc_min <- data_pgc %>%
    filter(hg18chr == 20 | hg18chr == 21 | hg18chr == 22) %>%
    arrange(hg18chr, bp)

png("/Users/katherine/Documents/Courses_and_Workshops/Medic_Masters/Compute_Module_2017/R/Manhattan.png",
    height = 250, width = 750)
ggplot(data_pgc) +
    geom_point(mapping = aes(x = bp, 
                             y = -log10(pval), 
                             col = hg18chr %% 2 + 1))  +
    facet_grid( . ~ hg18chr, scales="free_x", space="free_x", 
               switch = "x") +
    xlab("Location (Chromosome and Base Pair)") +
    theme(axis.ticks.x = element_blank(),
          axis.text.x = element_blank(),
          legend.position="none", 
          panel.spacing = unit(0, "cm"), 
          panel.grid.major = element_blank(), 
          panel.grid.minor = element_blank(),
          panel.border = element_blank(),
          panel.background = element_blank(),
          strip.background =element_rect(fill="white"),
          strip.text = element_text(angle = 45)
    ) +
    geom_hline(yintercept = -log10(0.00000005), col="red") +
    ylim(0, 10)
dev.off()   


install.packages("devtools")
library(devtools)
devtools::install_github('ropensci/plotly')
devtools::install_github('hadley/ggplot2')
library(plotly)
library(ggplot2)

plot1 <- ggplot(movies_budget, aes(y= budget, x = rating)) +
    geom_point()
ggplotly(plot1)

movies_budget_long <- movies_budget %>%
    select(-c(r1,r2,r3,r4,r5,r6,r7,r7,r8,r9,r10)) %>%
    gather(key = "Genre", value = "Ticks", -c(title, year, length, budget, rating, votes, mpaa)) %>%
    filter(Ticks != 0)

movies_budget_long$mpaa <- factor(movies_budget_long$mpaa, 
                                  levels = c("G", "PG", "PG-13", "R", "NC-17"))

plot1 <- ggplot(movies_budget_long, aes(x=mpaa, fill = Genre)) +
    geom_bar(position = "fill")
ggplotly(plot1)

plot1 <- ggplot(movies_budget_long, aes(y= budget, x = rating)) +
    geom_point() +
    facet_grid(Genre ~ mpaa)
ggplotly(plot1)

plot1 <- ggplot(movies_budget_long, aes(y= budget, x = Genre)) +
    geom_boxplot() +
    facet_grid(. ~ mpaa)
ggplotly(plot1)

plot1 <- ggplot(movies_budget_long, aes(y= rating, x = Genre)) +
    geom_boxplot() +
    facet_grid(. ~ mpaa)
ggplotly(plot1)

movies_budget_mean <- movies_budget_long %>%
        group_by(year, Genre) %>%
        summarise(avg_genre_year_budget = mean(budget, na.rm = TRUE), 
                  avg_genre_year_rating = mean(rating, na.rm = TRUE))

plot1 <- ggplot(movies_budget_mean, aes(x = year, y = avg_genre_year_budget, 
                                        group = Genre, col = Genre)) +
    geom_line()
ggplotly(plot1)

plot1 <- ggplot(movies_budget_mean, aes(x = year, y = avg_genre_year_rating, 
                                        group = Genre, col = Genre)) +
    geom_line()
ggplotly(plot1)


plot1 <- ggplot(movies_budget, aes(y= budget, x = rating, text = paste("Title:", title))) +
    geom_point()
ggplotly(plot1)

plot1 <- ggplot(movies_budget_long, aes(y= budget, x = rating, text = paste("Title:", title, "\nGenre:", Genre))) +
    geom_point()
ggplotly(plot1)




library(readxl)
vol_data <- read_xlsx("/Users/katherine/Documents/Courses_and_Workshops/Medic_Masters/Compute_Module_2017/R/13229_2017_124_MOESM4_ESM.xlsx", 
                      sheet = 1, skip = 2, na = "NA")

vol_data_NPC <- select(vol_data, c(log2FC_NPC, padj.NPC))
vol_data_NPC$threshold = as.factor(abs(vol_data_NPC$log2FC_NPC) > 2 & vol_data_NPC$padj.NPC < 0.05)


ggplot(vol_data_NPC, aes(x = log2FC_NPC, y = -log10(padj.NPC), col = threshold)) +
    geom_point() +
    xlim(-15,15) +
    ylim(0, 50) +
    xlab("log2 Fold Change NPC") +
    ylab("-log10 adjusted P value NPC") +
    theme_bw() +
    theme(legend.position = "none") +
    scale_color_manual(values = c("black", "red"))

vol_plot <- ggplot(vol_data_NPC, aes(x = log2FC_NPC, y = -log10(padj.NPC), 
                                     col = threshold)) +
    geom_point() +
    xlim(-15,15) +
    ylim(0, 50) +
    xlab("log2 Fold Change NPC") +
    ylab("-log10 adjusted P value NPC") +
    theme_bw() +
    theme(legend.position = "none") +
    scale_color_manual(values = c("black", "red"))
ggplotly(vol_plot)
