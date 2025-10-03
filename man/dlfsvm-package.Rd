\name{dlfsvm-package}
\alias{dlfsvm-package}
\alias{dlfsvm}
\docType{package}
\title{
DPP4 Inhibitor Prediction Using Support Vector Machines
}
\description{
The dlfsvm package provides machine learning-based prediction of DPP4 (Dipeptidyl Peptidase 4) 
inhibitory activity for small molecules. It uses a pre-trained Support Vector Machine model 
with molecular descriptors and fingerprints to classify compounds into different activity levels.
}
\details{
\tabular{ll}{
Package: \tab dlfsvm\cr
Type: \tab Package\cr
Version: \tab 1.0.1\cr
Date: \tab 2024-10-03\cr
License: \tab MIT + file LICENSE\cr
}

The package provides functions for:
\itemize{
  \item Predicting DPP4 inhibitory activity using \code{\link{dlf}}
  \item Calculating molecular descriptors (LogP, TPSA, molecular weight, etc.)
  \item Computing structural features (hydrogen bonds, rings, rotatable bonds)
  \item Processing SMILES chemical notation
}

The main prediction function \code{\link{dlf}} classifies compounds into four activity levels:
No Activity, Low Activity, Moderate Activity, and High Activity.
}
\author{
Sharat Chandra, Shekhar Chandra

Maintainer: Sharat Chandra <sharat.chndr@gmail.com>
}
\references{
Central Drug Research Institute (CDRI) research data and methodologies.
}
\keyword{package}
\keyword{cheminformatics}
\keyword{machine-learning}
\keyword{drug-discovery}
\seealso{
\code{\link{dlf}}, \code{\link{getxlogp}}, \code{\link{gettpsa}}
}
\examples{
# Basic usage example
library(dlfsvm)

# Predict activity for a compound (benzylbenzene)
compound <- data.frame(V1 = 'c1ccccc1Cc1ccccc1')
prediction <- dlf(compound)
print(prediction)

# Calculate molecular descriptors
smiles <- 'c1ccccc1Cc1ccccc1'
weight <- getweight(smiles)
logp <- getxlogp(smiles)
tpsa <- gettpsa(smiles)

cat("Molecular weight:", weight, "\n")
cat("LogP:", logp, "\n")
cat("TPSA:", tpsa, "\n")
}
