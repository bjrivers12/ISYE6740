library(cdlTools)
#download all cdls
r <- getCDL('iowa',location = "C:/users/andrew/documents", c(2014,2015,2016,2017,2018,2019,2020))


library(raster)
str_name<-'C:/users/andrew/documents/CDL_2020_19.tif' 
imported_raster=raster(str_name)

print(imported_raster)
s <- raster::getValues(imported_raster)
plot(imported_raster)

#clip to a smaller area.
e <- as(extent(200000, 225000, 2000000, 2025000), 'SpatialPolygons')
r <- crop(imported_raster, e)
plot(r)
ss_2020 <- raster::getValues(r)


str_name<-'C:/users/andrew/documents/CDL_2019_19.tif' 
imported_raster=raster(str_name)

print(imported_raster)
s <- raster::getValues(imported_raster)
plot(imported_raster)

#clip to a smaller area.
e <- as(extent(200000, 225000, 2000000, 2025000), 'SpatialPolygons')
r <- crop(imported_raster, e)
plot(r)
ss_2019 <- raster::getValues(r)

str_name<-'C:/users/andrew/documents/CDL_2018_19.tif' 
imported_raster=raster(str_name)

print(imported_raster)
s <- raster::getValues(imported_raster)
plot(imported_raster)

#clip to a smaller area.
e <- as(extent(200000, 225000, 2000000, 2025000), 'SpatialPolygons')
r <- crop(imported_raster, e)
plot(r)
ss_2018 <- raster::getValues(r)

str_name<-'C:/users/andrew/documents/CDL_2017_19.tif' 
imported_raster=raster(str_name)

print(imported_raster)
s <- raster::getValues(imported_raster)
plot(imported_raster)

#clip to a smaller area.
e <- as(extent(200000, 225000, 2000000, 2025000), 'SpatialPolygons')
r <- crop(imported_raster, e)
plot(r)
ss_2017 <- raster::getValues(r)

str_name<-'C:/users/andrew/documents/CDL_2016_19.tif' 
imported_raster=raster(str_name)

print(imported_raster)
s <- raster::getValues(imported_raster)
plot(imported_raster)

#clip to a smaller area.
e <- as(extent(200000, 225000, 2000000, 2025000), 'SpatialPolygons')
r <- crop(imported_raster, e)
plot(r)
ss_2016 <- raster::getValues(r)

str_name<-'C:/users/andrew/documents/CDL_2015_19.tif' 
imported_raster=raster(str_name)

print(imported_raster)
s <- raster::getValues(imported_raster)
plot(imported_raster)

#clip to a smaller area.
e <- as(extent(200000, 225000, 2000000, 2025000), 'SpatialPolygons')
r <- crop(imported_raster, e)
plot(r)
ss_2015 <- raster::getValues(r)

str_name<-'C:/users/andrew/documents/CDL_2014_19.tif' 
imported_raster=raster(str_name)

print(imported_raster)
s <- raster::getValues(imported_raster)
plot(imported_raster)

#clip to a smaller area.
e <- as(extent(200000, 225000, 2000000, 2025000), 'SpatialPolygons')
r <- crop(imported_raster, e)
plot(r)
ss_2014 <- raster::getValues(r)
# 
# 
# library(raster)
# str_name<-'C:/users/andrew/documents/CDL_2019_19.tif' 
# imported_raster=raster(str_name)
# 
# ss <- raster::getValues(imported_raster)
# 
# andrew <- cbind(s,ss)
# 
# install.packages("remotes")
# remotes::install_github("jlisic/cdlTools")
# 
# install.packages('cdlTools')
# install.packages('rgdal')
# install.packages('raster')
# library(cdlTools)
# library(raster)
# 
# bbox <- c(130783,2203171,153923,2217961)
# resx <- 30 
# resy <- 30 
# year <- 2020
# crs <- 'epsg:102004'
# bounded <- cdlTools::getCDL_bbox(year,bbox,res=c(resx,resy),crs=crs)
# ss_2020 <- raster::getValues(bounded)
# 
# plot(bounded)
# 
# 
# 
# bbox <- c(130783,2203171,153923,2217961)
# resx <- 30 
# resy <- 30 
# year <- 2019
# crs <- 'epsg:102004'
# bounded <- cdlTools::getCDL_bbox(year,bbox,res=c(resx,resy),crs=crs)
# ss_2019<- raster::getValues(bounded)
# 
# plot(ss_2020)
# 
# 
# 
# bbox <- c(130783,2203171,153923,2217961)
# resx <- 30 
# resy <- 30 
# year <- 2018
# crs <- 'epsg:102004'
# bounded <- cdlTools::getCDL_bbox(year,bbox,res=c(resx,resy),crs=crs)
# ss_2018<- raster::getValues(bounded)
# 
# 
# bbox <- c(130783,2203171,153923,2217961)
# resx <- 30 
# resy <- 30 
# year <- 2017
# crs <- 'epsg:102004'
# bounded <- cdlTools::getCDL_bbox(year,bbox,res=c(resx,resy),crs=crs)
# ss_2017<- raster::getValues(bounded)
# 
# 
# 
# bbox <- c(130783,2203171,153923,2217961)
# resx <- 30 
# resy <- 30 
# year <- 2016
# crs <- 'epsg:102004'
# bounded <- cdlTools::getCDL_bbox(year,bbox,res=c(resx,resy),crs=crs)
# ss_2016<- raster::getValues(bounded)
# 
# 
# 
# bbox <- c(130783,2203171,153923,2217961)
# resx <- 30 
# resy <- 30 
# year <- 2015
# crs <- 'epsg:102004'
# bounded <- cdlTools::getCDL_bbox(year,bbox,res=c(resx,resy),crs=crs)
# ss_2015<- raster::getValues(bounded)
# 
# 
# 
# bbox <- c(130783,2203171,153923,2217961)
# resx <- 30 
# resy <- 30 
# year <- 2014
# crs <- 'epsg:102004'
# bounded <- cdlTools::getCDL_bbox(year,bbox,res=c(resx,resy),crs=crs)
# ss_2014<- raster::getValues(bounded)


fin <- cbind(ss_2020, ss_2019, ss_2018, ss_2017, ss_2016, ss_2015, ss_2014)

write.csv(fin, file='C:/Users/Andrew/Documents/Georgia Tech/ISYE6740/Project/raw_data.csv')

#plot(bounded)