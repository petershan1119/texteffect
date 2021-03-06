\name{sibp_amce}
\alias{sibp_amce}
\alias{sibp_amce_plot}
\title{Infer Treatments on the Test Set}
\description{
  \code{sibp_amce} uses an sibp object fitted on a training set to estimate the AMCE with the test set.}
\usage{
	  sibp_amce(sibp.fit, X, Y, seed = 0, level = 0.05, nboot = 1000)
	  sibp_amce_plot(sibp.amce,  xlab = "Feature", ylab = "Outcome")
}
\arguments{
  \item{sibp.fit}{A \code{sibp} object.}
  \item{X}{The covariates for the full data set.  The division between the training and test set is handled inside the function.}
  \item{Y}{The outcomes for the full data set.  The division between the training and test set is handled inside the function.}
  \item{seed}{The seed}
  \item{level}{The level of the confidence intervals to be obtained.}
  \item{nboot}{The number of bootstrap replicates used to calculate the confidence intervals for the AMCE.}
  \item{sibp.amce}{The table returned by code{sibp_amce}.}
  \item{xlab}{The label for the x-axis of the plot.}
  \item{ylab}{The label for the y-axis of the plot.}
}
\details{Nothing}
\value{
  \item{sibp.amce}{A table where the first column is the index of the treatment, the second column ("effect") is the estimated AMCE, the third column ("L") is the lower bound of the confidence interval, and the fourth column ("U") is the upper bound of the confidence interval.}
 }
\references{Fong, Christian and Justin Grimmer.  2016. ``Discovery of Treatments from Text Corpora'' Proceedings of the 54th Annual Meeting of the Association for Computational Linguistics. \url{https://aclweb.org/anthology/P/P16/P16-1151.pdf}}
\author{Christian Fong}


\seealso{\link{sibp}}
\examples{
##Load the sample of Wikipedia biography data
data(BioSample)

# Divide into training and test sets
Y <- BioSample[,1]
X <- BioSample[,-1]
train.ind <- get_training_set(X, Y, training.prop = 0.5)

# Fit an sIBP on the training data
sibp.fit <- sibp(X, Y, K = 2, alpha = 4, sigmasq.n = 0.8, 
				 train.ind = train.ind)
				 
sibp.amce <- sibp_amce(sibp.fit, X, Y, nboot = 100)
sibp_amce_plot(sibp.amce)
}
