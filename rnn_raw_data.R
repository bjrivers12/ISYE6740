library(keras) # for deep learning
library(tidyverse) # general utility functions
library(caret) # machine learning utility functions
library(tensorflow)

use_condaenv("r-tensorflow")


raw_dat <- read_csv("C:/Users/Andrew/Documents/Georgia Tech/ISYE6740/Project/raw_data.csv")
raw_dat <- raw_dat[1:5000,]
raw_data <- as.matrix(raw_dat)

X_train <- raw_dat[,2:8]
Y_train <- raw_dat[,1]

# set some parameters for our model
max_len <- 6 # the number of previous examples we'll look at
batch_size <- 32 # number of sequences to look at at one time during training
total_epochs <- 15 # how many times we'll look @ the whole dataset while training our model

# set a random seed for reproducability
set.seed(123)


#X_train <- as.array(data=X_train)
X_train <- as.matrix(X_train)
Y_train <- as.matrix(Y_train)


X <- raw_data[,2:8]
y <- raw_data[,1]

training_index <- createDataPartition(y, p = .9, 
                                      list = FALSE, 
                                      times = 1)

# training data
X_train <- array(X[training_index,], dim = c(length(training_index), max_len, 1))
y_train <- y[training_index]

# testing data
X_test <- array(X[-training_index,], dim = c(length(y) - length(training_index), max_len, 1))
y_test <- y[-training_index]


model <- keras_model_sequential()


# dimensions of our input data
dim(X_train)

# our input layer
model %>%
  layer_dense(input_shape = dim(X_train)[2:3], units = max_len)

model %>% 
  layer_simple_rnn(units = 6)

model %>%
  layer_dense(units = 1, activation = 'softmax') # output

summary(model)


model %>% compile(loss = 'categorical_crossentropy', 
                  optimizer = optimizer_rmsprop(), 
                  metrics = c('accuracy'))


# model %>% compile(loss = 'categorical_crossentropy', 
#                   optimizer = 'RMSprop', 
#                   metrics = c('accuracy'))

# Actually train our model! This step will take a while
trained_model <- model %>% fit(
  x = X_train, # sequence we're using for prediction 
  y = y_train, # sequence we're predicting
  batch_size = batch_size, # how many samples to pass to our model at a time
  epochs = total_epochs, # how many times we'll look @ the whole dataset
  validation_split = 0.1) # how much data to hold out for testing as we go along

trained_model

plot(trained_model)



# Predict the classes for the test data
classes <- model %>% predict_classes(X_test, batch_size = batch_size)

# Confusion matrix
table(y_test, classes)

model %>% evaluate(X_test, y_test, batch_size = batch_size)

# baseline: just guess the weather will be the same as yesterday
day_before <- X_test[,max_len - 1,1]

# Confusion matrix
table(y_test, day_before)

# accuracy
sum(day_before == classes)/length(classes)


