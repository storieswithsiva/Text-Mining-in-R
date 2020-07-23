# Text Mining in R
[![Makes people smile](https://forthebadge.com/images/badges/makes-people-smile.svg)](https://github.com/iamsivab)

[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fiamsivab%2FText-Mining-in-R)](https://hits.seeyoufarm.com)

## Sentiment Analysis Text Mining using R

[![Generic badge](https://img.shields.io/badge/Text-Mining-teal.svg?style=for-the-badge)](https://github.com/iamsivab/Text-Mining-in-R) 
[![Generic badge](https://img.shields.io/badge/LinkedIn-Connect-blue.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/iamsivab/) [![Generic badge](https://img.shields.io/badge/R-Language-blue.svg?style=for-the-badge)](https://github.com/iamsivab/Text-Mining-in-R/blob/master/Sivasubramanian-Text%20Mining%20Report.pdf) [![ForTheBadge uses-git](http://ForTheBadge.com/images/badges/uses-git.svg)](https://GitHub.com/)

#### The project is about searching the text mining for classification using bag of words [#bagofwords](https://github.com/iamsivab/Text-Mining-in-R) and applying machine learning models on this.

[![GitHub repo size](https://img.shields.io/github/repo-size/iamsivab/Text-Mining-in-R.svg?logo=github&style=social)](https://github.com/iamsivab) [![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/iamsivab/Text-Mining-in-R.svg?logo=git&style=social)](https://github.com/iamsivab/)[![GitHub top language](https://img.shields.io/github/languages/top/iamsivab/Text-Mining-in-R.svg?logo=python&style=social)](https://github.com/iamsivab)

#### Few popular hashtags - 
### `#R` `#MachineLearning` `#NLP`
### `#patternlearning` `#BagofWords` `#textanalytics`

### Motivation

Nowadays, a daily increase of online available data leads to a growing need for that data to be organized and regularized. Textual data is all around us starting from web pages, e-books, media articles to emails or user comments. There are a lot of cases where automatic text classification would accelerate processing time (for example, detection of spam pages, personal email sorting, tagging products or document filtering). We can say that all organizations (e.g. academia, marketing or government) that deal with a lot of unstructured text, could handle that data much easier if it was standardized by categories/tags. This Dataset is a collection newsgroup documents. The 4 newsgroups collection can be used for experiments in text applications of machine learning techniques, such as text classification and text clustering.

### About the Project

#### What is Text Mining?

Text classification or text categorization is an activity of labelling natural language texts with relevant predefined categories. The idea is to automatically organize text in different classes. It can drastically simplify and speed-up your search through the documents or texts!

#### Steps involved in this project

3 major steps in `Text-Mining-in-R` code :

1. While training and building a model keep in mind that the first model is never the best one, so the best practice is the “trial and error” method. To make that process simpler, you should create a function for training and in each attempt save results and accuracies.

2. I decided to sort the EDA process into two categories: general pre-processing steps that were common across all vectorizers and models and certain pre-processing steps that I put as options to measure model performance with or without them

3. Accuracy was chosen as a measure of comparison between models since greater the accuracy, better the model performance on test data.

[![Made with Python](https://forthebadge.com/images/badges/made-with-python.svg)](https://github.com/iamsivab/Text-Mining-in-R) [![Made with love](https://forthebadge.com/images/badges/built-with-love.svg)](https://www.linkedin.com/in/iamsivab/) [![ForTheBadge built-with-swag](http://ForTheBadge.com/images/badges/built-with-swag.svg)](https://www.linkedin.com/in/iamsivab/)

#### Explanation

- First of all, I've created a **Bag of Words** file. This file `clean_data.R` contains all the methods to preprocess and generate bag of words. We use `Corpus` library to handle preprocessing and to generate Bag of Words .

- The following **general pre-processing steps** were carried out since any document being input to a model would be required to be in a certain format:
1.	Converting to lowercase
2.	Removal of stop words
3.	Removing alphanumeric characters
4.	Removal of punctuations
5.	Vectorization: TfVectorizer was used. The model accuracy was compared with those that used TfIDFVectorizer. In all cases, when TfVectorizer was used, it gave better results and hence was chosen as the default Vectorizer.

- The following steps were added to the pre-processing steps as optional to see how model performance changed with and without these steps:
`1.	Stemming`
`2.	Lemmatization`
`3.	Using Unigrams/Bigrams`

Confusion Matrix for Support Vector Machine using Bag of Words Generated using `clean_data.r`

```R
> confusionMatrix(table(predsvm,data.test$folder_class))
Confusion Matrix and Statistics

       
predsvm  1  2  3  4
      1 31  0  0  0
      2  0 29  6  0
      3  0  3 28  0
      4  0  0  0 23

Overall Statistics
                                          
               Accuracy : 0.925           
                 95% CI : (0.8624, 0.9651)
    No Information Rate : 0.2833          
    P-Value [Acc > NIR] : < 2.2e-16       
                                          
                  Kappa : 0.8994          
                                          
 Mcnemar's Test P-Value : NA              

Statistics by Class:

                     Class: 1 Class: 2 Class: 3 Class: 4
```

-The most interesting deduction is that the **more specific the newsgroup topic** is, the more accurate that the Naïve Bayes classifier can determine what newsgroup a document belongs to and the converse is also true where the less specific the newsgroup is, the accuracy rate plummets. 

-We can see this in Accuracy where every newsgroup that isn’t a misc will always have an accuracy rate of at least 50%. The bottom newsgroups for terms of accuracy rate are all misc which includes a 0.25% accuracy rate for talk.politics.misc.

-A reason for this is that the posts that are written in misc newsgroups are rarely related to the actual root of the newsgroup. The misc section caters to other topics of **discussion other than the “root newsgroup” meaning** that it is much easier for the classifier to confuse a document from a misc newsgroup with another newsgroup and much harder for the classifier to even consider the root newsgroup since topics regarding the **root newsgroup at posted there instead.**

-For example, a post about guns is **posted in talk.religion.misc can be easily classified as being talk.politics.guns** because it would have to use similar words found in the posts found in talk.politics.guns. Likewise, posts about politics in talk.politics.misc are less likely **because you are more likely to post in or talk.politics.guns** (where wildcard is the relevant section for the type of politics to be discussed).


### Libraries Used

![R Studio](https://img.shields.io/badge/R-dplyr-blue.svg?style=flat&logo=r&logoColor=white) 
![R Studio](https://img.shields.io/badge/R-stringr-blue.svg?style=flat&logo=r&logoColor=white)
![R Studio](https://img.shields.io/badge/R-readtext-blue.svg?style=flat&logo=r&logoColor=white) 
![R Studio](https://img.shields.io/badge/R-e1071-blue.svg?style=flat&logo=r&logoColor=white) 
![R Studio](https://img.shields.io/badge/R-mlr-blue.svg?style=flat&logo=r&logoColor=white)
![R Studio](https://img.shields.io/badge/R-caret-blue.svg?style=flat&logo=r&logoColor=white) 
![R Studio](https://img.shields.io/badge/R-randomForest-blue.svg?style=flat&logo=r&logoColor=white) 


### Installation

- Install **randomForest** using pip command: `install.packages("randomForest")`
- Install **caret** using pip command: `install.packages("caret")`
- Install **mlr** using pip command: `install.packages("mlr")`
- Install **MASS** using pip command: `install.packages("MASS")`

### How to run?

[![R Studio](https://img.shields.io/badge/R-clean_data.R.-lightgrey.svg?logo=R&style=social)](https://github.com/iamsivab/Text-Mining-in-R/tree/master/src)


### Project Reports

[![report](https://img.shields.io/static/v1.svg?label=Project&message=Report&logo=microsoft-word&style=social)](https://github.com/iamsivab/Text-Mining-in-R/blob/master/Sivasubramanian-Text%20Mining%20Report.pdf)

- [Download](https://github.com/iamsivab/Text-Mining-in-R/blob/master/Sivasubramanian-Text%20Mining%20Report.pdf) for the report.

### Useful Links

1. [Why Term Frequency is better than TF-IDF for text classification](https://www.quora.com/Why-does-TF-term-frequency-sometimes-give-better-F-scores-than-TF-IDF-does-for-text-classification)
2. [Naïve Bayes Classification for 20 News Group Dataset]( https://github.com/Loc-Tran/NaiveBayes20NewsGroup)
3. [Analyzing word and document frequency: tf-idf]( https://www.tidytextmining.com/tfidf.html  )
4. [Natural Language Processing](https://krakensystems.co/blog/2018/nlp-syntax-processing)
5. [K Nearest Neighbor in R]( https://www.edureka.co/blog/knn-algorithm-in-r/)
6. [MLR Package]( https://www.analyticsvidhya.com/blog/2016/08/practicing-machine-learning-techniques-in-r-with-mlr-package/)
 

 
### Related Work

[![Sentiment Analysis](https://img.shields.io/static/v1.svg?label=Text&message=Mining&color=lightgray&logo=linkedin&style=social&colorA=critical)](https://www.linkedin.com/in/iamsivab/) [![GitHub top language](https://img.shields.io/github/languages/top/iamsivab/Text-Mining-in-R.svg?logo=php&style=social)](https://github.com/iamsivab/)

[Text Mining Analyzer](https://github.com/iamsivab/Text-Mining-in-R) - A Detailed Report on the Analysis


### Contributing

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?logo=github)](https://github.com/iamsivab/Text-Mining-in-R/pulls) [![GitHub issues](https://img.shields.io/github/issues/iamsivab/Text-Mining-in-R?logo=github)](https://github.com/iamsivab/Text-Mining-in-R/issues) ![GitHub pull requests](https://img.shields.io/github/issues-pr/viamsivab/Text-Mining-in-R?color=blue&logo=github) 
[![GitHub commit activity](https://img.shields.io/github/commit-activity/y/iamsivab/Text-Mining-in-R?logo=github)](https://github.com/iamsivab/Text-Mining-in-R/)

- Clone [this](https://github.com/iamsivab/Text-Mining-in-R/) repository: 

```bash
git clone https://github.com/iamsivab/Text-Mining-in-R.git
```

- Check out any issue from [here](https://github.com/iamsivab/Text-Mining-in-R/issues).

- Make changes and send [Pull Request](https://github.com/iamsivab/Text-Mining-in-R/pulls).
 
### Need help?

[![Facebook](https://img.shields.io/static/v1.svg?label=follow&message=@iamsivab&color=9cf&logo=facebook&style=flat&logoColor=white&colorA=informational)](https://www.facebook.com/iamsivab)  [![Instagram](https://img.shields.io/static/v1.svg?label=follow&message=@iamsivab&color=grey&logo=instagram&style=flat&logoColor=white&colorA=critical)](https://www.instagram.com/iamsivab/) [![LinkedIn](https://img.shields.io/static/v1.svg?label=connect&message=@iamsivab&color=success&logo=linkedin&style=flat&logoColor=white&colorA=blue)](https://www.linkedin.com/in/iamsivab/)

:email: Feel free to contact me @ [balasiva001@gmail.com](https://mail.google.com/mail/)

[![GMAIL](https://img.shields.io/static/v1.svg?label=send&message=balasiva001@gmail.com&color=red&logo=gmail&style=social)](https://www.github.com/iamsivab) [![Twitter Follow](https://img.shields.io/twitter/follow/iamsivab?style=social)](https://twitter.com/iamsivab)


### License

MIT &copy; [Sivasubramanian](https://github.com/iamsivab/Text-Mining-in-R/blob/master/LICENSE)

[![](https://sourcerer.io/fame/iamsivab/iamsivab/Text-Mining-in-R/images/0)](https://sourcerer.io/fame/iamsivab/iamsivab/Text-Mining-in-R/links/0)[![](https://sourcerer.io/fame/iamsivab/iamsivab/Text-Mining-in-R/images/1)](https://sourcerer.io/fame/iamsivab/iamsivab/Text-Mining-in-R/links/1)[![](https://sourcerer.io/fame/iamsivab/iamsivab/Text-Mining-in-R/images/2)](https://sourcerer.io/fame/iamsivab/iamsivab/Text-Mining-in-R/links/2)[![](https://sourcerer.io/fame/iamsivab/iamsivab/Text-Mining-in-R/images/3)](https://sourcerer.io/fame/iamsivab/iamsivab/Text-Mining-in-R/links/3)[![](https://sourcerer.io/fame/iamsivab/iamsivab/Text-Mining-in-R/images/4)](https://sourcerer.io/fame/iamsivab/iamsivab/Text-Mining-in-R/links/4)[![](https://sourcerer.io/fame/iamsivab/iamsivab/Text-Mining-in-R/images/5)](https://sourcerer.io/fame/iamsivab/iamsivab/Text-Mining-in-R/links/5)[![](https://sourcerer.io/fame/iamsivab/iamsivab/Text-Mining-in-R/images/6)](https://sourcerer.io/fame/iamsivab/iamsivab/Text-Mining-in-R/links/6)[![](https://sourcerer.io/fame/iamsivab/iamsivab/Text-Mining-in-R/images/7)](https://sourcerer.io/fame/iamsivab/iamsivab/Text-Mining-in-R/links/7)


[![GitHub license](https://img.shields.io/github/license/iamsivab/Text-Mining-in-R.svg?style=social&logo=github)](https://github.com/iamsivab/Text-Mining-in-R/blob/master/LICENSE) 
[![GitHub forks](https://img.shields.io/github/forks/iamsivab/Text-Mining-in-R.svg?style=social)](https://github.com/iamsivab/Text-Mining-in-R/network) [![GitHub stars](https://img.shields.io/github/stars/iamsivab/Text-Mining-in-R.svg?style=social)](https://github.com/iamsivab/Text-Mining-in-R/stargazers) [![GitHub followers](https://img.shields.io/github/followers/iamsivab.svg?label=Follow&style=social)](https://github.com/iamsivab/) [![Ask Me Anything !](https://img.shields.io/badge/Ask%20me-anything-1abc9c.svg)](https://GitHub.com/iamsivab/ama)
