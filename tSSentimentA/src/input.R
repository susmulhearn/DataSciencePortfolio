#brief: create input file list to cycle through for cleaning, and then storing it in a file
main_dir <- "tSSentimentA/data/Albums/forAnalysis"
albumList <- list.dirs(main_dir)[- 1]
print(albumList)
for (albums in albumList)
{
  filelist <- list.files(path=albums, pattern="*.txt", full.names=TRUE, recursive=FALSE)
  print(filelist)
  source("tSSentimentA/src/cleanText.R")
  for (files in filelist){
    name<-files
    cleaned_lyrics<-clean_text(path=name)
    save_path<-file.path("/Users/susanmulhearn/R_portfolio/DataSciencePortfolio","tSSentimentA/data/Album/cleanedData", fsep="/")
    setwd(save_path)
  }
  #save to rda file
  save(cleaned_lyrics, file = "mydata.rda")
}
