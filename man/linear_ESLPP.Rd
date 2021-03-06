% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/linear_ESLPP.R
\name{do.eslpp}
\alias{do.eslpp}
\title{Extended Supervised Locality Preserving Projection}
\usage{
do.eslpp(
  X,
  label,
  ndim = 2,
  numk = max(ceiling(nrow(X)/10), 2),
  preprocess = c("center", "scale", "cscale", "decorrelate", "whiten")
)
}
\arguments{
\item{X}{an \eqn{(n\times p)} matrix or data frame whose rows are observations.}

\item{label}{a length-\eqn{n} vector of data class labels.}

\item{ndim}{an integer-valued target dimension.}

\item{numk}{the number of neighboring points for k-nn graph construction.}

\item{preprocess}{an additional option for preprocessing the data.
Default is "center". See also \code{\link{aux.preprocess}} for more details.}
}
\value{
a named list containing
\describe{
\item{Y}{an \eqn{(n\times ndim)} matrix whose rows are embedded observations.}
\item{trfinfo}{a list containing information for out-of-sample prediction.}
\item{projection}{a \eqn{(p\times ndim)} whose columns are basis for projection.}
}
}
\description{
Extended LPP and Supervised LPP are two variants of the celebrated Locality Preserving Projection (LPP) algorithm for dimension
reduction. Their combination, Extended Supervised LPP, is a combination of two algorithmic novelties in one that
it reflects discriminant information with realistic distance measure via Z-score function.
}
\examples{
## generate data of 2 types with clear difference
set.seed(100)
diff = 50
dt1  = aux.gensamples(n=50)-diff;
dt2  = aux.gensamples(n=50)+diff;

## merge the data and create a label correspondingly
Y      = rbind(dt1,dt2)
label  = rep(1:2, each=50)

## compare LPP, SLPP and ESLPP
outLPP   <- do.lpp(Y)
outSLPP  <- do.slpp(Y, label)
outESLPP <- do.eslpp(Y, label)

## visualize
opar <- par(no.readonly=TRUE)
par(mfrow=c(1,3))
plot(outLPP$Y,   col=label, pch=19, main="LPP")
plot(outSLPP$Y,  col=label, pch=19, main="SLPP")
plot(outESLPP$Y, col=label, pch=19, main="ESLPP")
par(opar)

}
\references{
\insertRef{zheng_gabor_2007}{Rdimtools}

\insertRef{shikkenawis_improving_2012}{Rdimtools}
}
\seealso{
\code{\link{do.lpp}}, \code{\link{do.slpp}}, \code{\link{do.extlpp}}
}
\author{
Kisung You
}
\concept{linear_methods}
