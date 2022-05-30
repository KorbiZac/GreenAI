# plumber.R

model <- readRDS("modelBest.rds")
model


#* Return Prognose des Absatzes
#* @param KW Kalenderwoche für die Prognose (z.B. 22)
#* 
#* @param Wetter Aus der API entnommenen Informationen der Wettervorhersage (Faktor: "A" z.B.)
#* 
#* @param Festtag In dieser KW ein Festtag? (z.B. FALSE)
#* 
#* @param Schulferien Schulferien in dieser KW? (z.B. FALSE)
#* 
#* @param Special_Offer Angebot auf dieses Produkt in dieser KW? (z.B. True)
#* 
#* @post /prognose
function(KW, Wetter, Festtag, Schulferien, Special_Offer) {
  data_predict <- data.frame(KW = as.numeric(KW), 
                             Wetter,
                             Festtag = as.logical(Festtag),
                             Schulferien = as.logical(Schulferien),
                             Special_Offer = as.logical(Special_Offer))
  predict(model, data_predict, type = "response")
}







