% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BioTIP_update_3.3_02282020.R
\name{getIc.new}
\alias{getIc.new}
\title{Index of criticality Scoring System with estimated correlation, an updated Ic-score}
\usage{
getIc.new(
  X,
  method = c("BioTIP", "Ic"),
  PCC_sample.target = c("average", "zero", "half"),
  output = c("IndexScore", "PCCg", "PCCs")
)
}
\arguments{
\item{X}{A G x S matrix of counts. Rows correspond to genes,
columns correspond to samples.}

\item{method}{A flag specifying whether to calculate the BioTIP score
or the \eqn{I_c} score}

\item{PCC_sample.target}{A character choose among ('average',  'zero', 'half'),
indicating whether to shrink PCC towards towards their empirical common average,
zero or 0.5 (for sample-sample correlations).}

\item{output}{A string. Please select from 'IndexScore',  'PCCg',  or 'PCCs'. Uses 'IndexScore' by default.
'PCCg' is the PCC between genes (numerator) and 'PCCs' is PCC between samples (denominator).}
}
\value{
A value containing the shrunk BioTIP or non-shrunk \eqn{I_c} score
}
\description{
This function calculates the BioTIP score on a given
data matrix X (or two matrixes X and Y). It can also calculate the \eqn{I_c} score, if desired.

This appraoch uses the method outlined by Schafer and Strimmer in
"A Shrinkage Approach to Large-Scale Covariance Matrix Estimation
and Implications for Functional Genomics" (2005)

This approach is modified to ignore missing values, analogous to how
\code{cor(X,  use = "pairwise.complete.obs")} works.

The gene-gene correlations are shrunk towards 0,  whereas the
sample-sample correlations are shrunk towards their empirical average.
}
\examples{
## Generating a data X as coming from a multivariate normal distribution 
## with 10 highly correlated variables, roughly simulating correlated genes.
M = matrix(.9, nrow = 10, ncol = 10)
diag(M) = 1
mu = rnorm(10)
X = MASS::mvrnorm(1000, mu, M)
dim(X)  #1000 10  

## Calculating pairwise correlation between 1000 genes; then the mean value
## in two ways, respectively
cor_tX = cor(t(X))
mean(abs(cor_tX[upper.tri(cor_tX, diag = FALSE)])) # 0.9150228

getIc.new(X, method = "Ic", output ='PCCg') # 0.9150228
getIc.new(X, method = "BioTIP", output ='PCCg') # 0.8287838

## Uisng the Index of critical scoreing system, in two ways, respectively 
(newscore = getIc.new(X, method = "BioTIP"))
(oldscore = getIc.new(X, method = "Ic"))

}
\author{
Andrew Goldstein \email{andrewgoldstein@uchicago.edu}
}
