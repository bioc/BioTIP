% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BioTIP_update_3.3_02282020.R
\name{plot_SS_Simulation}
\alias{plot_SS_Simulation}
\title{Density plot the leading two distance between any two states from random scores of all states in a system.}
\usage{
plot_SS_Simulation(
  Ic,
  simulation,
  las = 0,
  xlim = NULL,
  ylim = NULL,
  order = NULL,
  main = "1st max - 2nd max",
  ylab = "1st max - 2nd max"
)
}
\arguments{
\item{Ic}{A vector with names of states. If order is not assigned,
then plot by the order of this vector.}

\item{simulation}{A numeric matrix of Ic scores in which rows are states and columns are numbers of simulated times.
It can be obtained from \code{\link{simulation_Ic}}}

\item{las}{Numeric in {0, 1, 2, 3}; the style of axis labels.
Default is 0,  meaning labels are parallel.
(link to http://127.0.0.1:21580/library/graphics/html/par.html).}

\item{xlim}{An integer vector of length 2. Default is NULL.}

\item{ylim}{An integer vector of length 2. Default is NULL.}

\item{order}{Characters of names of Ic to be plotted in a desired \code{order}. Default is NULL.}

\item{main}{A character vector. The title of the plot. Default is NULL.}

\item{ylab}{titles y axes, as in plot.}
}
\value{
Return a plot of the observed Ic (red) and simulated Ic (grey) scores per state.
}
\description{
Generate a density plot of Ic score (orBioTIP score) from a simulation,
which is the distance between the first-larget and the second-largest random scores.
This is an alternative method to estimate the significance of an observed BioTIP (or Ic) score in a system.
This measurement makes more sense to evaluate random scores of sample-label shuffling,
in which the nature sample-sample correlation within a phenotypic state (or cell subpopulation) was removed.
}
\examples{
sim = matrix(sample(1:10, 9), 3, 3)
row.names(sim) = paste0('state', 1:3)
Ic = c('state1' = 3.4, 'state2' = 15.6, 'state3' = 2)
plot_SS_Simulation(Ic, sim)

}
\author{
Xinan H Yang \email{xyang2@uchicago.edu}
}
