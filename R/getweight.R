#' molecular weight of compound
#' 
#'  
#' 
#' 
#' @export
#' @importFrom rcdk parse.smiles  eval.desc
#' @param input data passed on as \code{newdata} to \code{\link{predict}}
#' @examples mydata <- data.frame(V1 = 'c1ccccc1Cc1ccccc1')
#' gettpsa(mydata)
getweight <- function(mol){
  smi <- rcdk::parse.smiles(as.character(mol$V1))[[1]]
  weight <- (rcdk::eval.desc(smi, "org.openscience.cdk.qsar.descriptors.molecular.WeightDescriptor"))
  return(weight[[1]])
}  
