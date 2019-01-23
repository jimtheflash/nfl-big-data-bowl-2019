rm(list = ls())
library(data.table)
setwd("~/Documents/data/nfl-big-data-bowl-2019_data")
dt_list <- list()
for (i in list.files()) {
  temp <- data.table::fread(i)
  obj_name <- gsub(".csv", "", i, fixed = TRUE)
  dt_list[[obj_name]] <- temp
  rm(i, temp, obj_name)
}
