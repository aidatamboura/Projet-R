
###########################################################################
#---------------------Function pseudoTimestamper--------------------------#
#-------------------------------------------------------------------------#
# Crée des pseudo timestamp                                               #
#-------------------------------------------------------------------------#
# Parameters :                                                            #
#               file: fichier de lux                                      #
#-------------------------------------------------------------------------#
# Retourne un data frame                                                  #
# author : jb                                                             #
###########################################################################

pseudoTimestamper <- function (file) {
  #Chargement du fichier
  rawLux <- loadDataFile(file, "lux")
  #On stocke la derniere valeur 
  lastTS <- data.frame(timestamp=rawLux$timestamp[nrow(rawLux)])
  #On
  cleanData <- cbind.data.frame(timestamp= rawLux$timestamp, valeur=rawLux$valeur1)
  #
  timestamp1 <- data.frame(timestamp=rawLux$timestamp[1:(nrow(rawLux)-1)])
  timestamp2 <- data.frame(timestamp=rawLux$timestamp[2:(nrow(rawLux))])
  
  pseudoTimestamp <- data.frame(timestamp=((timestamp1+timestamp2)/2))
  
  pseudoTimestamp <- data.frame(timestamp=rbind(pseudoTimestamp, lastTS))
  pseudoTimestamp <- cbind.data.frame(pseudoTimestamp, valeur=rawLux$valeur2)
  
  cleanData <- rbind.data.frame(cleanData, pseudoTimestamp)
  cleanData <- cleanData[order(cleanData$timestamp),]
  return(cleanData)
}