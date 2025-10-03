#' molecular bonds of the compound
#' 
#'  
#' 
#' 
#' @export
#' @importFrom rcdk parse.smiles get.bonds
#' @param input data passed on as \code{newdata} to \code{\link{predict}}
#' @examples mydata <- data.frame(V1 = 'c1ccccc1Cc1ccccc1')
#' bonds(mydata)
bonds <- function(mol){
  smi <- rcdk::parse.smiles(as.character(mol$V1))[[1]]
  numbonds <-(rcdk::eval.desc(smi, "org.openscience.cdk.qsar.descriptors.molecular.BondCountDescriptor"))
  return(numbonds[[1]])
}
