#' xlogP of the compound
#' 
#'  
#' 
#' 
#' @export
#' @importFrom rcdk parse.smiles get.xlogp
#' @param input data passed on as \code{newdata} to \code{\link{predict}}
#' @examples mydata <- data.frame(V1 = 'c1ccccc1Cc1ccccc1')
#' gettpsa(mydata)
getxlogp <- function(mol){
  smi <- rcdk::parse.smiles(as.character(mol$V1))[[1]]
  rcdk::convert.implicit.to.explicit(smi)
  xlogp <- rcdk::get.xlogp(smi)
  return(xlogp)
}  
