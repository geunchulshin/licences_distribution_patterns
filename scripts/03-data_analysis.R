#### Preamble ####
# Purpose: Tests... [...UPDATE THIS...]
# Author: Geunchul Shin
# Date: January 21 2024
# Contact: joey.shin@mail.utoronto.ca
# License: MIT
# Pre-requisites: 02-data_cleaning.R


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]

#### Test data ####
cleaned_data <- read_csv("outputs/data/cleaned_data.csv")

head(cleaned_data)

df_2015_2018 <- cleaned_data %>% filter(Issued_year %in% seq(2015, 2018))
df_2019_2022 <- cleaned_data %>% filter(Issued_year %in% seq(2019, 2022))


df1 <- as.data.frame(prop.table(table(cleaned_data$Category)))
colnames(df1) <- c("Category", "Percentage")
df1$Percentage <- df1$Percentage*100
print(df1)

df2 <- as.data.frame(prop.table(table(df_2015_2018$Category)))
colnames(df2) <- c("Category", "Percentage")
df2$Percentage <- df2$Percentage*100
print(df2)

df3 <- as.data.frame(prop.table(table(df_2019_2022$Category)))
colnames(df3) <- c("Category", "Percentage")
df3$Percentage <- df3$Percentage*100
print(df3)

df_2015_2018_duration <- df_2015_2018 %>% group_by(Category) %>% summarise(mean(Issue_duration, na.rm = T))
colnames(df_2015_2018_duration) <- c("Category", "AverageDuration")
df_2015_2018_duration <- df_2015_2018_duration %>% arrange(desc(AverageDuration)) %>% drop_na()

df_2019_2022_duration <- df_2019_2022 %>% group_by(Category) %>% summarise(mean(Issue_duration, na.rm = T))
colnames(df_2019_2022_duration) <- c("Category", "AverageDuration")
df_2019_2022_duration <- df_2019_2022_duration %>% arrange(desc(AverageDuration)) %>% drop_na()


g1 <- ggplot(df_2015_2018_duration, aes(x = reorder(Category, AverageDuration), y = AverageDuration)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Category wise average licence duration during (2015-2018)", 
       x = "Category", y = "Average Licence Duration (months)") +
  theme_minimal() + coord_flip()
print(g1)

g2 <- ggplot(df_2019_2022_duration, aes(x = reorder(Category, AverageDuration), y = AverageDuration)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Category wise average licence duration during (2019-2022)", 
       x = "Category", y = "Average Licence Duration (months)") +
  theme_minimal() + coord_flip()
print(g2)

df_2015_2018 <- df_2015_2018 %>% drop_na()
g3 <- ggplot(df_2015_2018, aes(x = Category, y = Issue_duration))
g3 <- g3 + geom_boxplot() + 
  labs(title = "Licence Duration given to each Category (2015-2018)", 
                                 x = "Category", 
       y = "Average Licence Duration (months)") +
  theme_minimal() + coord_flip()
print(g3)


g4 <- ggplot(df_2019_2022, 
             aes(x = Category, y = Issue_duration))
g4 <- g4 + geom_boxplot() + 
  labs(title = "Licence Duration given to each Category (2019-2022)", 
                                x = "Category", 
       y = "Average Licence Duration (months)") +
  theme_minimal() + coord_flip()
print(g4)


df_2015_2018$Term <- "2015-2018"
df_2019_2022$Term <- "2019-2022"
df_combined <- rbind(df_2015_2018, df_2019_2022)
df_combined_duration <- df_combined %>% group_by(Term, Category) %>% summarise(mean(Issue_duration, na.rm = T))
colnames(df_combined_duration) <- c("Term", "Category", "AverageDuration")

g5 <- ggplot(df_combined_duration, aes(x = Category, 
                                       y = AverageDuration, fill=Term)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Average Licence Duration given to each 
       Category, group by comparison", 
       x = "Category", y = "Average Licence Duration (months)") +
  theme_minimal() + coord_flip()
print(g5)


g6 <- ggplot(df_combined, aes(x = Category, 
                                       y = Issue_duration, fill=Term)) +
  geom_boxplot() +
  labs(title = "Licence Duration given to each 
       Category, group wise comparison", 
       x = "Category", y = "Average Licence Duration (months)") +
  theme_minimal() + coord_flip()
print(g6)


df_combined_num_exp <- df_combined %>% group_by(Term, Category) %>% summarise(mean(Num_Endorsements, na.rm = T))
colnames(df_combined_num_exp) <- c("Term", "Category", "AverageNumExp")
g7 <- ggplot(df_combined_num_exp, aes(x = Category, 
                                       y = AverageNumExp, fill=Term)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Average Number of Endorsements for which license was given by
  each category in both term", 
       x = "Category", y = "Average Number of Endorsements") +
  theme_minimal() + coord_flip()
print(g7)

# 
# g8 <- ggplot(df_combined, aes(x = Category, 
#                               y = Num_Endorsements, fill=Term)) +
#   geom_boxplot() +
#   labs(title = "Percentage Distribution by Category", 
#        x = "Category", y = "Average Licence Duration (months)") +
#   theme_minimal() + coord_flip()
# print(g8)
