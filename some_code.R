## This is my test code

library(reghelper)
library(tidyverse)

options(scipen = 999)
## 

model <- lm(mpg ~ disp + hp, data = mtcars)

# Std
beta(model)

# Unstd
summary(model)


## 

model <- lm(Sepal.Width ~ Sepal.Length * Species, data = iris)
graph_model(model, y = Sepal.Width, x = Sepal.Length, lines = Species)

