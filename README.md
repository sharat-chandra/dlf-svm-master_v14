# dlfsvm: DPP4 Inhibitor Prediction Package

[![R](https://img.shields.io/badge/R-%3E%3D2.10-blue)](https://www.r-project.org/)

## Overview

`dlfsvm` is an R package for predicting potential DPP4 (Dipeptidyl Peptidase 4) inhibitors using machine learning. DPP4 is an important therapeutic target for type 2 diabetes treatment. This package uses a Support Vector Machine (SVM) model trained on molecular descriptors to classify compounds based on their potential inhibitory activity.

## Features

- **Molecular Activity Prediction**: Classify compounds into four activity levels:
  - No Activity
  - Low Activity 
  - Moderate Activity
  - High Activity

- **Chemical Descriptor Calculation**: Compute various molecular properties including:
  - LogP values (lipophilicity)
  - Topological Polar Surface Area (TPSA)
  - Hydrogen bond donors/acceptors
  - Molecular weight and heavy atom count
  - Rotatable bonds and ring counts

- **SMILES Input Support**: Direct input using SMILES chemical notation
- **Pre-trained Model**: Includes trained SVM model ready for predictions

## Installation

### From GitHub

```r
# Install devtools if you haven't already
install.packages("devtools")

# Install dlfsvm from GitHub
devtools::install_github("yourusername/dlf-svm-master_v14")
```

### Dependencies

The package requires the following R packages:
- `rcdk` - R interface to Chemistry Development Kit
- `e1071` - Support Vector Machines
- `png` - Image processing
- `fingerprint` - Molecular fingerprinting

## Quick Start

```r
library(dlfsvm)

# Example: Predict activity for benzylbenzene
compound <- data.frame(V1 = 'c1ccccc1Cc1ccccc1')
prediction <- dlf(compound)
print(prediction)
# Output: Activity classification

# Calculate molecular descriptors
weight <- getweight(compound$V1)
logp <- getxlogp(compound$V1)
tpsa <- gettpsa(compound$V1)
```

## Detailed Usage

### Main Prediction Function

```r
# The dlf() function is the main prediction interface
result <- dlf(data.frame(V1 = "your_smiles_string"))
```

### Molecular Descriptor Functions

```r
# Physicochemical properties
molecular_weight <- getweight(smiles)
partition_coeff <- getxlogp(smiles)  # LogP
alogp <- getalogp(smiles)           # ALogP
tpsa <- gettpsa(smiles)             # Topological Polar Surface Area

# Structural features
hbd <- gethbondDonor(smiles)        # Hydrogen bond donors
hba <- gethbondAcceptor(smiles)     # Hydrogen bond acceptors
rotatable <- getrotbond(smiles)     # Rotatable bonds
rings <- getring(smiles)            # Ring count
heavy_atoms <- getheavyatom(smiles) # Heavy atom count
bond_count <- bonds(smiles)         # Total bonds

# Other utilities
formula <- smiformula(smiles)       # Molecular formula
charge <- totalcharge(smiles)       # Total formal charge
zscore_val <- zscore(value)         # Z-score calculation
```

## Model Information

The package includes a pre-trained SVM model (`dpp4Model`) developed for DPP4 inhibition prediction. The model uses molecular fingerprints (MACCS keys) as features and was trained on a curated dataset of known DPP4 inhibitors and non-inhibitors.

### Activity Classification Thresholds

The Z-score thresholds for activity classification are:
- **No Activity**: Z-score ≤ 1.888
- **Low Activity**: 1.888 < Z-score ≤ 2.347
- **Moderate Activity**: 2.347 < Z-score ≤ 3.076
- **High Activity**: Z-score > 3.076

## Examples

### Single Compound Prediction

```r
library(dlfsvm)

# Aspirin-like compound
compound <- data.frame(V1 = "CC(=O)Oc1ccccc1C(=O)O")
activity <- dlf(compound)
cat("Predicted activity:", activity)
```

### Batch Processing

```r
# Multiple compounds
compounds <- data.frame(
  V1 = c(
    "c1ccccc1Cc1ccccc1",           # Benzylbenzene
    "CC(=O)Oc1ccccc1C(=O)O",      # Aspirin
    "CN1CCC[C@H]1c2cccnc2"        # Nicotine
  )
)

# Process each compound
results <- sapply(1:nrow(compounds), function(i) {
  dlf(data.frame(V1 = compounds$V1[i]))
})

# Display results
data.frame(SMILES = compounds$V1, Activity = results)
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## Citation

If you use this package in your research, please cite:

```
Chandra, Sharat, et al. "SVMDLF: A novel R-based Web application for prediction of dipeptidyl peptidase 4 inhibitors." Chemical Biology & Drug Design 90.6 (2017): 1173-1183.

```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

**Authors**: 
- Sharat Chandra (sharat.chndr@gmail.com)
- Shekhar Chandra ([https://github.com/ranuzz](https://github.com/ranuzz))

## Acknowledgments

- Central Drug Research Institute (CDRI) for providing research support
- R Chemistry Development Kit (rcdk) community
- Contributors to the e1071 package for SVM implementation

## Disclaimer

This software is for research purposes only. Predictions should not be used as a substitute for experimental validation or clinical decision-making.