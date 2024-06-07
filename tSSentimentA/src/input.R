#brief: inputting lyrics and setting up rdata file for sentiment analysis

path <- "tSSentimentA/src/closure.txt"
lyrics <- paste(scan(path, what="character", sep= "\n"))

#refining by setting up data frame
dflyrics<-enframe (lyrics, name = "lineno", value = "lyricline")

linenum<-dflyrics["lineno"]
lyricwords=dflyrics[,"lyricline"]
dftib=tibble(linenum, lyricwords)
which(dftib$lyricline == "[Verse 2]")
clean_lyrics <- dftib[-c(1, 8, 16, 22, 37), ]




