#' RCDK plot
#' @export
#' @importFrom rcdk parse.smiles view.image.2d
#' @param input data passed on as \code{newdata} to \code{\link{predict}}
#' @examples mydata <- data.frame(V1 = 'c1ccccc1Cc1ccccc1')
#' png(mydata)
rcdkplot <- function(mol, width=500, height=500, marg=0, main=''){
  smi <- rcdk::parse.smiles(as.character(mol$V1))[[1]]
  par(mar = c(marg,marg,marg,marg))
  temp1 <- rcdk::view.image.2d(smi, width, height)
  x1 <- runif(1, 5.0, 170.5)
# /var/www/html/png/
#  mypath <- file.path("/", "tmp","png",paste("myplot_",format(Sys.time(), "%Y-%m-%d-%I-%p"),x1,".png",sep = ""))
#  mypath <- file.path("C:\\Users\\Dell\\Documents\\R\\win-library\\3.2\\dlfsvm\\png", paste("myplot_",format(Sys.time(), "%Y-%m-%d-%I-%p"),x1,".png",sep = ""))
  mypath <- file.path("/var/www/html/png", paste("myplot_",format(Sys.time(), "%Y-%m-%d-%I-%p"),x1,".png",sep = ""))
  a <- substr(mypath, 15, stop=1000000L)
  png(file = mypath)
#  copy.image.to.clipboard(smi, width = 500, height = 500)
  plot(NA,NA,xlim=c(1,10),ylim=c(1,10),xaxt='n',yaxt='n',xlab='',ylab='',main=main)
  rasterImage(temp1,1,1,10,10)
  dev.off()
#  image <- as.raster(temp1,1,1,10,10)
#  img <- readPNG(system.file("img", "temp1", package = "png"))
 return (a)

}
