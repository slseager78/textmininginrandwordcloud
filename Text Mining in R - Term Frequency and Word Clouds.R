install.packages("tm")

library(tm)

##loading in the data
setwd("//ntfnvf01/Sarah Seager$/Work/Exit Survey")
reviews <- read.csv("reviews.csv", stringsAsFactors = FALSE)

###check the data 
View(reviews)

#combining all the reviews together in one big lump (vector)
review_text <- paste(reviews$text, collapse = " ")

##check the big lump of data
review_text

#setting up source and corpus
review_source <- VectorSource(review_text)
corpus <- Corpus(review_source)
corpus

##Cleaning (tm_map is a multipurpose function which does text cleaning)
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, removeWords, stopwords("english"))

##Making a document-term matrix (DTM)
dtm <- DocumentTermMatrix(corpus)
dmt2 <- as.matrix(dtm) ##converting the data into a matrix

##finding the most frequent terms
frequency <- colSums(dtm2)   ###find the column sums
str(frequency)              ###tells us that its a named numeric vector and the number of elements
frequency <- sort(frequency, decreasing = TRUE)  ##sort the vector descendingly
head(frequency) #tells us the top six most frequent messages


##Creating a wordcloud
install.packages("wordcloud")
library(wordcloud)

wordcloud(words[1:25], frequency[1:25])   ###produces a word cloud showing number of most frequent words


