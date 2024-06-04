#brief: inputting lyrics and setting up rdata file for sentiment analysis

path <- "tSSentimentA/src/closure.txt"
lyrics <- paste(scan(path, what="character", sep= "\n"))

#refining by setting up data frame
dflyrics<-enframe (lyrics, name = "lineno", value = "lyricline")
linenum<-aframe[,"lineno"]
lyricwords=aframe[,"lyricline"]
dftib=tibble(linenum, lyricwords)
#creating data frame by each word on a new line
library(tidyr)
separate_rows(dflyrics, lyricwords, convert = TRUE)
df_by_word%>%separate_longer_delim(c(lyricwords), delim = " ")
