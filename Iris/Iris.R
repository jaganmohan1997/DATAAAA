

setwd("i:/CAP_Profile/Desktop/DATAAAA/Iris")

df <- read.csv('Iris.csv')

str(df)
# Clearly It is a classification Problem....I am using SVM here

y <- df$Class

boxplot(PetalLengthCm ~ Class, data = df)
boxplot(SepalLengthCm ~ Class, data = df)
boxplot(PetalWidthCm ~ Class, data = df)
boxplot(SepalWidthCm ~ Class, data = df)


library('ggplot2')

ggplot(df, aes(x = PetalLengthCm, y = SepalLengthCm, colour = Class)) +
  geom_point()
ggplot(df, aes(x = PetalWidthCm, y = SepalWidthCm, colour = Class)) +
  geom_point()


library('e1071')
model.svm <- svm(Class ~ PetalLengthCm + PetalWidthCm + SepalLengthCm, data = df, na.action = na.omit)
model.svm_all <- svm(Class ~ ., data = df, na.action = na.omit)

pred <- predict(model.svm, df)

table(y, pred)
# Hene we have built a pretty good model for starters
