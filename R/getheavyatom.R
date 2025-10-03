#' number of heavy atoms of the compound
#' 
#'  
#' 
#' 
#' @export
#' @importFrom rcdk parse.smiles eval.desc
#' @param input data passed on as \code{newdata} to \code{\link{predict}}
#' @examples mydata <- data.frame(V1 = 'c1ccccc1Cc1ccccc1')
#' getheavyatom(mydata)
getheavyatom <- function(mol){
  smi <- rcdk::parse.smiles(as.character(mol$V1))[[1]]
  heavyatom <- (rcdk::eval.desc(smi, "org.openscience.cdk.qsar.descriptors.molecular.AtomCountDescriptor"))
  return(heavyatom[[1]])
}
