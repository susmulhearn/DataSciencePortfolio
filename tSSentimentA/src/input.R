#brief: inputting lyrics and setting up rdata file for sentiment analysis

path <- "tSSentimentA/src/closure.txt"
lyrics <- paste(scan(path, what="character", sep= "\n"))

#refining by setting up data frame
dflyrics<-enframe (lyrics, name = "lineno", value = "lyricline")

linenum<-dflyrics["lineno"]
lyricwords=dflyrics[,"lyricline"]
dftib=tibble(linenum, lyricwords)
#finding junk lines and removing them
verse<-which(dftib$lyricline == "[Verse 2]")
chorus<-which(dftib$lyricline == "[Chorus]")
remout<- c(verse, chorus)
clean_lyrics <- dftib[-c(1,remout), ]
#cleaning last row
last_row<-clean_lyrics%>%tail(1)
no_embed=last_row$lyricline=substr(last_row$lyricline, 1, nchar(last_row$lyricline)-5)
clean_var<-gsub('[[:digit:]]+', '', last_row$lyricline)
#fixing last element
x=last_row[1,1]
row_clean_var=tibble(x, lyricline=clean_var)
#replacing last row
cl_no_embeddf <- clean_lyrics %>% filter(row_number() <= n()-1)
cl_final<-rbind(cl_no_embeddf, row_clean_var)
