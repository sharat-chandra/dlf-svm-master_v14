#' hydrogen bond donor of the compound
#' 
#'  
#' 
#' 
#' @export
#' @importFrom rcdk parse.smiles eval.desc
#' @param input data passed on as \code{newdata} to \code{\link{predict}}
#' @examples mydata <- data.frame(V1 = 'c1ccccc1Cc1ccccc1')
#' gethbondDonor(mydata)
gethbondDonor <- function(mol){
  smi <- rcdk::parse.smiles(as.character(mol$V1))[[1]]
  hbondDonor <- (rcdk::eval.desc(smi, "org.openscience.cdk.qsar.descriptors.molecular.HBondDonorCountDescriptor"))
  return(hbondDonor[[1]])
}  
