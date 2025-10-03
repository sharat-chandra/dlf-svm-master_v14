#' molecule formula of the compound
#' 
#'  
#' 
#' 
#' @export
#' @importFrom rcdk parse.smiles get.formula
#' @param input data passed on as \code{newdata} to \code{\link{predict}}
#' @examples mydata <- data.frame(V1 = 'c1ccccc1Cc1ccccc1')
#' formula(mydata)
smiformula <- function(mol){
  smi <- rcdk::parse.smiles(as.character(mol$V1))[[1]]
  rcdk::convert.implicit.to.explicit(smi)
  formula <- rcdk::get.mol2formula(smi,charge=0)
  return(formula@string)
}
