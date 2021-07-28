

library(keras)
#install_keras()

raw_dat <- read.csv("C:/Users/Andrew/Documents/Georgia Tech/ISYE6740/Project/raw_data5.csv")
#raw_dat <- raw_dat[1:5000,]
raw_data <- as.matrix(raw_dat)

dt = sort(sample(nrow(raw_dat), nrow(raw_data)*.8))
train<-raw_dat[dt,]
test<-raw_dat[-dt,]


x_train <- as.matrix(train[,as.numeric(3:8)])
y_train <- as.matrix(train[,2])
x_test <- as.matrix(train[,3:8])
y_test <- as.matrix(train[,2])
mode(x_train) <- "integer"



# x_train <- array_reshape(x_train, c(nrow(x_train), 784))
# x_test <- array_reshape(x_test, c(nrow(x_test), 784))
# x_train <- x_train / 255; x_test <- x_test / 255

x_train1 <- x_train[1:200000,]
x_train2 <- x_train[200001:400000,]
x_train3 <- x_train[400001:600000,]
x_train4 <- x_train[600001:889377,]

#gotta chop data...bummer
x_train1 <- to_categorical(x_train1, 255)
x_train2 <- to_categorical(x_train2, 255)
x_train3 <- to_categorical(x_train3, 255)
x_train4 <- to_categorical(x_train4, 255)
#x_trainer2 <- to_categorical(x_train1, 255)
x_train <- to_categorical(x_train, 255)
x_test <- to_categorical(x_test, 100)
y_train <- to_categorical(y_train, 255)
y_test <- to_categorical(y_test,255)
x_full <- to_categorical(x_full,255)



x_train <- array_reshape(x_train1, c(nrow(x_train1), 1530))
x_test <- array_reshape(x_test, c(nrow(x_test), 1530))
x_full <- array_reshape(x_full, c(nrow(x_full), 1530))

model <- keras_model_sequential()
model %>%
  layer_dense(units = 255, activation = 'relu',
              input_shape = c(1356)) %>%
  layer_dropout(rate = 0.4) %>%
  layer_dense(units = 4, activation = 'relu') %>%
  layer_dense(units = 255, activation = 'softmax') 


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


predicted <- model %>% predict_classes(x_full)

pred <- as.vector(predicted)


#z <- raster(nrows = r@nrows, ncols = r@ncols, ext = r@extent, crs = r@crs,
#            resolution = res(r), vals = pred)

#plot(z)

x_full <- as.matrix(raw_dat[,as.numeric(3:8)])
mode(x_full) <- "integer"
x_full <- to_categorical(x_full,226)
x_full <- array_reshape(x_full, c(nrow(x_full), 1356))


predicted <- model %>% predict_classes(x_full)

pred <- as.vector(predicted)

r@data@values <- pred

plot(r)

