###########################################################################
### title : Aquisition.R                                                ###
### author : jb                                                         ###
###                                                                     ###
### date : 2016-03                                                      ###
### R Data Driven Programming                                           ###
###########################################################################

loadDataFile <- function(file, type) {
  my_DataFrame <- fread(file, header = FALSE, sep=";")
  my_DataFrame <- if(type=="gps") {
    setNames(my_DataFrame,c("timestamp","heure","latitude","longitude",
                                "nbSatellites","precision", "altitude",
                                "vitessHori", "vitessVert"))
  }
  else {
    
     setNames(my_DataFrame,c("timestamp","valeur1", "valeur2"))
  }
  return (my_DataFrame)
}
