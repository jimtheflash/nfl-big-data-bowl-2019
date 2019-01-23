rm(list = ls())
setwd("~/Documents/data/nfl-big-data-bowl-2019_data")
req <- httr::GET("https://api.github.com/repos/nfl-football-ops/Big-Data-Bowl/git/trees/master?recursive=1")
httr::stop_for_status(req)
filelist <- unlist(lapply(httr::content(req)$tree, "[", "path"), use.names = FALSE)
files_to_download <- grep("csv", filelist, value = TRUE, fixed = TRUE)
for (i in files_to_download) {
  fn <- paste0("https://raw.githubusercontent.com/nfl-football-ops/Big-Data-Bowl/master/", i)
  dest <- gsub("Data/", "", i, fixed = TRUE)
  if (file.exists(dest)) {
    next
  }
  download.file(url = fn, destfile = dest)
}
