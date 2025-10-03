#' Calculate the z-score of the molecule
#' 
#' @export
#' @importFrom rcdk parse.smiles get.fingerprint fp.to.matrix
#' @param input data passed on as \code{newdata} to \code{\link{predict}}
#' @examples mydata <- data.frame(V1 = 'c1ccccc1Cc1ccccc1')
#' dlf(mydata)
zscore <- function(mol){
  smi <- rcdk::parse.smiles(as.character(mol$V1))
  cmp.fp <- vector("list", nrow(mol))
  cmp.fp[1] <- rcdk::get.fingerprint(smi[[1]], type = "maccs")
  fpmac <- fp.to.matrix(cmp.fp)
  cmp.finger <- as.data.frame(fpmac)
  fitted = attributes(predict(dpp4Model, cmp.finger, decision.values=TRUE))$decision.values
  z_score <- (fitted[1] - (-2.86817))/0.785761
  if (z_score[1] >= 1.88815599 & z_score[1] <= 2.346693996){
    a = "Low Activity"
  }
  else if (z_score[1] >= 2.346693997 & z_score[1] <= 3.0764447625){
    a = "Moderate Activity"
  }
  else if (z_score[1] >= 3.0764447626){
    a = "High Activity"
  }
  else if (z_score[1] <= 1.88815598){
    a = "No Activity"
  }
  b <- paste(format(z_score[1], scientific=TRUE))
  return(b)
}
