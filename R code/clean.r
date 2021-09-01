ogcars <- read.csv("output-test-15000.csv")
ogcars[ogcars == "POA"]  <- NA
cars_mod <- na.omit(ogcars)
ogcars[ogcars == "POA "]  <- NA
cars_mod <- na.omit(ogcars)
cars_mod[cars_mod == "N/A"]  <- NA
write.csv(cars_mod, file = "15000_mod.csv")

cars <- read.csv("15000_mod.csv")

# create cars overall popularity rank based on their results from their page number and their rank on that page
cars$"rank" <- ((cars$"page" - 1) * 20 + cars$"page_rank")

pairs(cars[,c(3,4)])

# remove the izuzu from 2301
presentcars <- cars$year <= 2020
cars <- cars[presentcars,]

pairs(cars[,c(3,6)])
hypercar <-cars$price >1000000
cars <- cars[!hypercar,]

pairs(cars[,c(3,8)])
# remove the one door cars and the 52 door BMW 116I
# there are one door cars, but none of those listed actually seemed to be
# remove the 3 cars with 6 and 7 doors
# only dropped to 14844 obs
cars <- cars[(cars$door_number < 6 | is.na(cars$door_number)),]
cars <- cars[(cars$door_number > 1 | is.na(cars$door_number)),]
pairs(cars[,c(3,8)])

pairs(cars[,c(3,9)])
#electric cars have no conventional combustion engine, but the other extremities are not realstic for modern vehicles
#replace cars engine values with larger than 9000cc and smaller than with NA
cars$"engine_size..cc." <- replace(cars$"engine_size..cc.", cars$"engine_size..cc." <= 500, NA)
cars$"engine_size..cc." <- replace(cars$"engine_size..cc.", cars$"engine_size..cc." >= 9000, NA)


write.csv(cars[,c(3:19)], file = "carsBI.csv")