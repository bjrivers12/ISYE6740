

library(keras)
#install_keras()

raw_dat <- read.csv("C:/Users/Andrew/Documents/Georgia Tech/ISYE6740/Project/raw_data5.csv")
raw_dat <- raw_dat[1:300000,]
#raw_data <- as.matrix(raw_dat)

dt = sort(sample(nrow(raw_dat), nrow(raw_dat)*.8))
train<-raw_dat[dt,]
test<-raw_dat[-dt,]

train <- raw_dat
test <- raw_at


x_train <- as.matrix(train[,as.numeric(3:8)])
y_train <- as.matrix(train[,2])
x_test <- as.matrix(test[,3:8])
y_test <- as.matrix(test[,2])
mode(x_train) <- "integer"



# x_train <- array_reshape(x_train, c(nrow(x_train), 784))
# x_test <- array_reshape(x_test, c(nrow(x_test), 784))
# x_train <- x_train / 255; x_test <- x_test / 255


#x_trainer2 <- to_categorical(x_train1, 255)
x_train <- to_categorical(x_train, 255)
x_test <- to_categorical(x_test, 255)
y_train <- to_categorical(y_train, 255)
y_test <- to_categorical(y_test,255)
#x_full <- to_categorical(x_full,255)



x_train <- array_reshape(x_train, c(nrow(x_train), 1530))
x_test <- array_reshape(x_test, c(nrow(x_test), 1530))
#x_full <- array_reshape(x_full, c(nrow(x_full), 1530))

model <- keras_model_sequential()
model %>%
  layer_dense(units = 255, activation = 'relu',
              input_shape = c(1530)) %>%
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
  epochs = 10, batch_size = 15
  ,
  validation_split = 0.2
)

save_model_hdf5(model, "C:/Users/Andrew/Documents/Georgia Tech/ISYE6740/Project/iowa_model.h5")

model <- load_model_hdf5("C:/Users/Andrew/Documents/Georgia Tech/ISYE6740/Project/iowa_model.h5")

model %>% evaluate(x_test, y_test)
model %>% predict_classes(x_test)


predicted <- model %>% predict_classes(x_full)

pred <- as.vector(predicted)


save(model, file = 'C:/Users/Andrew/Documents/Georgia Tech/ISYE6740/Project/trained_model.Rdata')
load('C:/Users/Andrew/Documents/Georgia Tech/ISYE6740/Project/trained_model.Rdata')
#z <- raster(nrows = r@nrows, ncols = r@ncols, ext = r@extent, crs = r@crs,
#            resolution = res(r), vals = pred)

#plot(z)

model <- load_model_hdf5("C:/Users/Andrew/Documents/Georgia Tech/ISYE6740/Project/iowa_model.h5")
raw_dat <- read.csv("C:/Users/Andrew/Documents/Georgia Tech/ISYE6740/Project/obrien.csv")
raw_dat <- raw_dat[0:300000,]
x_full <- as.matrix(raw_dat[,as.numeric(3:8)])
mode(x_full) <- "integer"
x_full <- to_categorical(x_full,255)
x_full <- array_reshape(x_full, c(nrow(x_full), 1530))
y_full <- as.matrix(raw_dat[,2])
y_full <- to_categorical(y_full,255)
#y_full <- array_reshape(y_full, c(nrow(y_full), 1530))

model %>% evaluate(x_full, y_full)

predicted <- model %>% predict_classes(x_full)

pred1 <- as.vector(predicted)


save(pred1, file="C:/Users/Andrew/Documents/Georgia Tech/ISYE6740/Project/pred1.rdata" )

load("C:/Users/Andrew/Documents/Georgia Tech/ISYE6740/Project/pred1.rdata")
load("C:/Users/Andrew/Documents/Georgia Tech/ISYE6740/Project/pred2.rdata")



preds <- as.numeric(c(pred1,pred2))

x_train = 1;
y_train = 1;
x_test = 1;

predicted <- model %>% predict_classes(x_full)

preds <- as.vector(preds)

r@data@values <- preds
plot(r)

