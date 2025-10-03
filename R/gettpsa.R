#' topological polar surface area
#' 
#'  
#' 
#' 
#' @export
#' @importFrom rcdk parse.smiles get.tpsa
#' @param input data passed on as \code{newdata} to \code{\link{predict}}
#' @examples mydata <- data.frame(V1 = 'c1ccccc1Cc1ccccc1')
#' gettpsa(mydata)
gettpsa <- function(mol){
  smi <- rcdk::parse.smiles(as.character(mol$V1))[[1]]
  rcdk::convert.implicit.to.explicit(smi)
  tpsa <- rcdk::get.tpsa(smi)
  return(tpsa)
}  
