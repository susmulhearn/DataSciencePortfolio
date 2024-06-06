path <- "tSSentimentA/src/closure.txt"

clean_table(read.table(path))
head(clean_table)




library(stringr)
str_replace_all(string, pattern, replacement)
