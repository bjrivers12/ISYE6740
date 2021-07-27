

library(keras)
#install_keras()

raw_dat <- read.csv("C:/Users/Andrew/Documents/Georgia Tech/ISYE6740/Project/raw_data.csv")
raw_dat <- raw_dat[1:5000,]
raw_data <- as.matrix(raw_dat)

x_train <- as.matrix(raw_dat[1:4500,3:8])
y_train <- as.matrix(raw_dat[1:4500,2])
x_test <- as.matrix(raw_dat[4501:5000,3:8])
y_test <- as.matrix(raw_dat[4501:5000,2])



# x_train <- array_reshape(x_train, c(nrow(x_train), 784))
# x_test <- array_reshape(x_test, c(nrow(x_test), 784))
# x_train <- x_train / 255; x_test <- x_test / 255

x_train <- to_categorical(x_train, 196)
x_test <- to_categorical(x_test, 196)
y_train <- to_categorical(y_train, 196)
y_test <- to_categorical(y_test,196)

x_train <- array_reshape(x_train, c(nrow(x_train), 1176))
x_test <- array_reshape(x_test, c(nrow(x_test), 1176))
 

model <- keras_model_sequential()
model %>%
  layer_dense(units = 196, activation = 'relu',
              input_shape = c(1176)) %>%
  layer_dropout(rate = 0.4) %>%
  layer_dense(units = 4, activation = 'relu') %>%
  layer_dense(units = 196, activation = 'softmax') 


model %>% compile(
  loss = 'categorical_crossentropy',
  optimizer = optimizer_rmsprop(),
  metrics = c('accuracy')
) 


model %>% fit(
  x_train, y_train,
  epochs = 30, batch_size = 15,
  validation_split = 0.2
)
model %>% evaluate(x_test, y_test)
model %>% predict_classes(x_test)