#' AlogP value of the compound
#' 
#'  
#' 
#' 
#' @export
#' @importFrom rcdk parse.smiles eval.desc
#' @param input data passed on as \code{newdata} to \code{\link{predict}}
#' @examples mydata <- data.frame(V1 = 'c1ccccc1Cc1ccccc1')
#' getalogp(mydata)
getalogp <- function(mol){
  smi <- rcdk::parse.smiles(as.character(mol$V1))[[1]]
  alogp <- (rcdk::eval.desc(smi, "org.openscience.cdk.qsar.descriptors.molecular.ALOGPDescriptor"))
  return(alogp[[1]])
}
