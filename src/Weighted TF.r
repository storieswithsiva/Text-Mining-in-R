# This R file consists of all the preprocessing techniques with TF-IDF Vectorizer

# This R File creates the Bag of Words as a Result and also finds the frequencies

library(tm)
library(dplyr)
library(stringr)

# Function to remove emails
removeEmail <- function(X) {
  str_replace_all(X, "[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+", "")
} 

# Funtion to remove most common terms by percentage
removeCommonTerms <- function(X, percentage) {
  x <- t(X)
  t <- table(x$i) < x$ncol * percentage
  X[, as.numeric(names(t[t]))]
}

# Using pipes to not allocate extra memmory
# Edit the Dir source with the Directory of the Dataset with 4 Folders
corups.clean <- Corpus( DirSource("C:/Users/siva/Desktop/Data Mining Assignment/Final Assignment/corpus/20_newsgroup/texts",
                                  encoding = "UTF-8",                     # encoding used
                                  recursive = TRUE,                       # read folder recursevly
                                  ignore.case = FALSE,                    # case sensitive
                                  mode = "text"                           # document mode
),
readerControl = list(
  reader = readPlain,
  language = "en"
)
) %>%
  tm_map(content_transformer(tolower)) %>%        # no uppercase
  tm_map(content_transformer(removeEmail)) %>%    # remove email
  tm_map(removeNumbers) %>%                       # no numbers
  tm_map(removeWords, stopwords('en')) %>%        # remove stopwords
  tm_map(removePunctuation) %>%                   # no punctuation
  tm_map(stripWhitespace) %>%                     # no extra whitespaces
  tm_map(stemDocument) %>%                        # reduce to radical
  DocumentTermMatrix(
    control = list(
      weighting = weightTfIdf,
      wordLengths = c(4,20),                  # radical between 2 and 20
      minDocFreq = 1                          # appears at least 1 times
    )
    
  ) %>%
  removeSparseTerms(0.99) %>%                     # at least in 1% documents
  removeCommonTerms(0.50) %>%                     # maximun 50% documents
  as.matrix()                                     # to matrix
  
# To write the Matrix to Bag of Words File
corpus.clean%>%                                
write.csv2(file = "C:/Users/siva/Desktop/Data Mining Assignment/Final Assignment/data/20_newsgroup/bag_of_words_TFIDF.csv")


  
# Calculating Frequency with Word Lengths minimum=4 and maximum=20 with TF-IDF Vectorizer
frequency<- colSums(corups.clean)
frequency<- sort(frequency, decreasing = TRUE)
