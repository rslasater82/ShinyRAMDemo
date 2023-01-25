library(tidyverse)
library(purrr)
library(data.table)
data <- read_csv("../movies.csv")

i = 1
#Just for data generation
index = 0
for(i in 1:10){
  df <-  tibble(Movie = paste0("Release_",i), Rating = "G", Genre = "Magical", ID = paste0(Sys.Date(),"_",i))
  write_csv(df,paste0(df$ID,".csv"))
}
read_csv(paste0(Sys.Date(),"_",i,".csv"))

files <- dir(pattern = "*.csv")
files

#Read in all files, using data.table package
df <- list.files(path=".", pattern = "*.csv") %>%
  map_df(~fread(.))

#Bind rows together, allows for NA's for incomplete sets
full <- bind_rows(data,df)
full

#Load individual record
Query = "2023-01-24_15"
Row = subset(full,ID == Query)

#Update Record
Row$DateReleased = Sys.Date()
write_csv(Row, paste0(Row$ID,".csv"))

#Reload data
df <- list.files(path=".", pattern = "*.csv") %>%
  map_df(~fread(.))

df

