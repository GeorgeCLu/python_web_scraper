#to sort car brands by market segment, evaluate brands by average asking price
#to account for depreciation, only chose to prices from cars recent years, but enough to include brands still being sold new
cars <- read.csv("carsBI.csv")
recentcars <- cars[cars$year >= 2013,]
carprice <- aggregate(as.numeric(as.character(recentcars$price)), list(recentcars$brand), mean)
colnames(carprice) <- c("brand", "average price")
carprice[order(carprice$"average price"),]


#as most Range Rover's are listed under Land Rover, I will change those listed under RR to premium as well
budget = c("Chery","Daihatsu","Fiat","Smart")
entry_level = c("Honda", "MG", "Suzuki", "Mahindra", "Great Wall", "Citroen", "Foton", "Nissan", "Ssangyong", "Mazda")
economy = c("Holden", "Toyota", "Haval", "Mini", "Mitsubishi", "Subaru", "LDV", "Kia", "Hyundai", "Skoda", "Chrysler")      
mid_level = c("Peugeot", "Renault", "Ford", "Isuzu", "Infiniti", "Volkswagen")
premium = c( "Lexus", "Jeep", "BMW", "Mercedes-Benz", "Audi", "Volvo", "Hino", "Jaguar", "HSV")
prestige = c("Alfa Romeo", "Dodge", "Tesla", "Maserati", "Land Rover", "Chevrolet", "Ram" , "Range Rover")
luxury = c("Porsche", "GMC", "Bentley", "Aston Martin", "Rolls-Royce", "Mclaren", "Ferrari", "Lamborghini")

cars$segment <- NA
cars$segment[cars$brand %in% budget] <- 0
cars$segment[cars$brand %in% entry_level] <- 1
cars$segment[cars$brand %in% economy] <- 2
cars$segment[cars$brand %in% mid_level] <- 3
cars$segment[cars$brand %in% premium] <- 4
cars$segment[cars$brand %in% prestige] <- 5
cars$segment[cars$brand %in% luxury] <- 6

########################################################################################################################################################

cars$fuel_electricity_ratio <- NA
cars$fuel_electricity_ratio[cars$fuel_type  == "Diesel" ] <- 0
cars$fuel_electricity_ratio[cars$fuel_type  == "Electric" ] <- 1
cars$fuel_electricity_ratio[cars$fuel_type  == "Hybrid" ] <- 0.5
cars$fuel_electricity_ratio[cars$fuel_type  == "Lpg" ] <- 0
cars$fuel_electricity_ratio[cars$fuel_type  == "Petrol" ] <- 0
cars$fuel_electricity_ratio[cars$fuel_type  == "Unleaded" ] <- 0

########################################################################################################################################################

cars$trade <- NA
cars$trade[cars$bodystyle  == "4X4" ] <- 1
cars$trade[cars$bodystyle  == "Convertible" ] <- 1
cars$trade[cars$bodystyle  == "Coupe" ] <- 1
cars$trade[cars$bodystyle  == "Hatchback" ] <- 1
cars$trade[cars$bodystyle  == "People Mover" ] <- 0
cars$trade[cars$bodystyle  == "Sedan" ] <- 1
cars$trade[cars$bodystyle  == "Small Truck" ] <- 0
cars$trade[cars$bodystyle  == "Suv" ] <- 1
cars$trade[cars$bodystyle  == "Ute" ] <- 0
cars$trade[cars$bodystyle  == "Van And Minivan" ] <- 0
cars$trade[cars$bodystyle  == "Wagon" ] <- 0

########################################################################################################################################################

cars$automatic  <- NA
cars$automatic[cars$transmission  == "Automatic" ] <- 0
cars$automatic[cars$transmission  == "Continuous Variable" ] <- 0
cars$automatic[cars$transmission  == "Tiptronic" ] <- 0
cars$automatic[cars$transmission  == "Manual" ] <- 1

########################################################################################################################################################

cars$dealer <- NA
cars$dealer[cars$seller_type  == "Dealer" ] <- 0
cars$dealer[cars$seller_type  == "Private Seller" ] <- 1

########################################################################################################################################################

cars$seller_rank  <- NA
cars$seller_rank[cars$seller_location  == "Auckland" ] <- 4
cars$seller_rank[cars$seller_location  == "Bay Of Plenty" ] <- 2
cars$seller_rank[cars$seller_location  == "Canterbury" ] <- 3
cars$seller_rank[cars$seller_location  == "Hawkes Bay" ] <- 1
cars$seller_rank[cars$seller_location  == "Manawatu Wanganui" ] <- 2
cars$seller_rank[cars$seller_location  == "Marlborough" ] <- 0
cars$seller_rank[cars$seller_location  == "Nelson" ] <- 0
cars$seller_rank[cars$seller_location  == "Northland" ] <- 1
cars$seller_rank[cars$seller_location  == "Otago" ] <- 2
cars$seller_rank[cars$seller_location  == "Southland" ] <- 1
cars$seller_rank[cars$seller_location  == "Taranaki" ] <- 1
cars$seller_rank[cars$seller_location  == "Tauranga" ] <- 1
cars$seller_rank[cars$seller_location  == "Waikato" ] <- 3
cars$seller_rank[cars$seller_location  == "Wairarapa" ] <- 0
cars$seller_rank[cars$seller_location  == "Wellington" ] <- 3
cars$seller_rank[cars$seller_location  == "West Coast" ] <- 0

########################################################################################################################################################
