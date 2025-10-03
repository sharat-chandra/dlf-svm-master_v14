#' total charge of the molecule
#' 
#'  
#' 
#' 
#' @export
#' @importFrom rcdk parse.smiles get.total.charge
#' @param input data passed on as \code{newdata} to \code{\link{predict}}
#' @examples mydata <- data.frame(V1 = 'c1ccccc1Cc1ccccc1')
#' totalcharge(mydata)
totalcharge <- function(mol){
  smi <- rcdk::parse.smiles(as.character(mol$V1))[[1]]
  rcdk::convert.implicit.to.explicit(smi)
  totchrg <- rcdk::get.total.charge(smi)
  return(totchrg)
}  
