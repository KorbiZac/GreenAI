library(olsrr)
data <- read.csv2("Bestellungen_Training.csv")
head(data)

data$Wetter <- as.factor(data$Wetter)
data$Festtag <- data$Festtag == "TRUE"
data$Schulferien <- data$Schulferien == "TRUE"
data$Special_Offer <- data$Special_Offer == "TRUE"
str(data)
attach(data)
detach(data)

model <- lm(Absatzmenge ~ . , data = data)
summary(model)

result <- ols_step_best_subset(model); result

modelBest <- lm(Absatzmenge ~ . , data = data)
summary(modelBest)
saveRDS(modelBest, "modelBest.rds") #Modell abpseichern





###------------TESTING the Model


new_Bestellung <- data.frame("KW"=26, "Wetter" = "A", "Festtag" = TRUE, 
                             "Schulferien" = TRUE, "Special_Offer" = TRUE); new_Bestellung
new_Bestellung1 <- data.frame("KW"=51, "Wetter" = "D", "Festtag" = FALSE, 
                              "Schulferien" = TRUE, "Special_Offer" = FALSE); new_Bestellung1
new_Bestellung2 <- data.frame("KW"=43, "Wetter" = "B", "Festtag" = TRUE, 
                              "Schulferien" = FALSE, "Special_Offer" = TRUE); new_Bestellung2

var <- predict(model_opt,new_Bestellung); var
var <- predict(model_opt,new_Bestellung1); var
var <- predict(model_opt,new_Bestellung2); var

