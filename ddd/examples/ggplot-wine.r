# Machine Learning Repository - Wine Quality Data Set
# https://archive.ics.uci.edu/ml/datasets/Wine+Quality
url <- 'https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv'
filename <- '/tmp/winequality-red.csv'
download.file(url, filename)
wine <- read.csv(filename, sep=';')
summary(wine)
 fixed.acidity   volatile.acidity  citric.acid    residual.sugar  
 Min.   : 4.60   Min.   :0.1200   Min.   :0.000   Min.   : 0.900  
 1st Qu.: 7.10   1st Qu.:0.3900   1st Qu.:0.090   1st Qu.: 1.900  
 Median : 7.90   Median :0.5200   Median :0.260   Median : 2.200  
 Mean   : 8.32   Mean   :0.5278   Mean   :0.271   Mean   : 2.539  
 3rd Qu.: 9.20   3rd Qu.:0.6400   3rd Qu.:0.420   3rd Qu.: 2.600  
 Max.   :15.90   Max.   :1.5800   Max.   :1.000   Max.   :15.500  
   chlorides       free.sulfur.dioxide total.sulfur.dioxide    density      
 Min.   :0.01200   Min.   : 1.00       Min.   :  6.00       Min.   :0.9901  
 1st Qu.:0.07000   1st Qu.: 7.00       1st Qu.: 22.00       1st Qu.:0.9956  
 Median :0.07900   Median :14.00       Median : 38.00       Median :0.9968  
 Mean   :0.08747   Mean   :15.87       Mean   : 46.47       Mean   :0.9967  
 3rd Qu.:0.09000   3rd Qu.:21.00       3rd Qu.: 62.00       3rd Qu.:0.9978  
 Max.   :0.61100   Max.   :72.00       Max.   :289.00       Max.   :1.0037  
       pH          sulphates         alcohol         quality     
 Min.   :2.740   Min.   :0.3300   Min.   : 8.40   Min.   :3.000  
 1st Qu.:3.210   1st Qu.:0.5500   1st Qu.: 9.50   1st Qu.:5.000  
 Median :3.310   Median :0.6200   Median :10.20   Median :6.000  
 Mean   :3.311   Mean   :0.6581   Mean   :10.42   Mean   :5.636  
 3rd Qu.:3.400   3rd Qu.:0.7300   3rd Qu.:11.10   3rd Qu.:6.000  
 Max.   :4.010   Max.   :2.0000   Max.   :14.90   Max.   :8.000  
summary(factor(wine$quality))
  3   4   5   6   7   8 
 10  53 681 638 199  18 
wine$quality_levels <- cut(wine$quality, c(2,5,7,9), right=FALSE)
wine$quality_labels <- as.factor(wine$quality_levels)
levels(wine$quality_labels) <- c('bad','average','good')

library(ggplot2)
ggplot(wine, aes(x=quality)) + geom_histogram()
ggsave('ex-ggplot-01.pdf')
ggplot(data=wine, aes(x=quality)) + geom_histogram(binwidth=1) + theme_minimal() + ggtitle('Histogram of Quality')
ggsave('ex-ggplot-02.pdf')
ggplot(data=wine, aes(x=quality)) + geom_histogram(binwidth=1) + scale_x_continuous(breaks=seq(min(wine$quality),max(wine$quality),1)) + theme_minimal() + ggtitle('Histogram of Quality')
ggsave('ex-ggplot-03.pdf')
ggplot(data=wine, aes(x=quality)) + geom_histogram(fill='black', binwidth=1) + theme_void()
ggsave('ex-ggplot-04.pdf')
ggplot(data=wine, aes(x=pH)) + geom_histogram(binwidth=0.1) + theme_minimal() + ggtitle('Histogram of pH')
ggsave('ex-ggplot-05.pdf')
ggplot(data=wine, aes(x=pH)) + geom_histogram(binwidth=0.1) + facet_wrap(~quality) + theme_minimal()
ggsave('ex-ggplot-06.pdf')
ggplot(data=wine, aes(fixed.acidity, citric.acid)) + geom_point() 
ggsave('ex-ggplot-07.pdf')
ggplot(data=wine, aes(fixed.acidity, citric.acid)) + geom_point() + geom_smooth(method='lm') + theme_minimal()
ggsave('ex-ggplot-08.pdf')
ggplot(data=wine, aes(x=pH, fill=factor(quality), colour=factor(quality))) + geom_density(alpha=0.2) + theme_minimal() + theme(aspect.ratio=9/16)
ggsave('ex-ggplot-09.pdf')
ggplot(data=wine, aes(x=citric.acid, y=pH)) + geom_point(aes(color=factor(quality))) + geom_smooth(method='lm') + facet_wrap(~quality_labels) + theme_minimal() + theme(aspect.ratio=3/4)
ggsave('ex-ggplot-10.pdf')
ggplot(data=wine, aes(x=quality, y=citric.acid)) + geom_boxplot(aes(fill=quality_labels, color=I('black'))) + theme_minimal() + theme(aspect.ratio=1) 
ggsave('ex-ggplot-11.pdf')
# for FILE in ./ex*.pdf; do pdfcrop "${FILE}"; done
