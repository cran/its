\keyword{ts}
\name{its-lags}
\alias{its-lags}
\alias{lagIts}
\alias{lagdistIts}
\title{Lag Functions for Irregular Time-Series Objects}
\description{
  Lag functions for objects of class \code{"its"}.
}
\usage{
lagIts(x,k=1)
lagdistIts(x,kmin,kmax)
}
\arguments{
  \item{x}{an object of class \code{"its"}}
  \item{k, kmin, kmax}{integer lag; positive value mean earlier data is
    assigned to a later timestamp}
}
\details{
  \code{lag.its} returns an object with the same time-stamps, but with the data shifted.
  \code{lagdist.its} applies lag.its over a range of lags, and appends these columns
}
\value{

  An object of class \code{"its"}.

}
\author{Giles Heywood}

\seealso{
  \code{\link{ts}},
  \code{\link{POSIXct}},
  \code{\link{its-file}},
  \code{\link{its-lags}}
  \code{\link{its-join}}
  \code{\link{its-times}}
  \code{\link{its-subset}}
  \code{\link{its-fin}}
  \code{\link{its-disp}}
  \code{\link{its-info}}
  \code{\link{its-cumdif}}
  \code{\link{its-arith}}
}

\examples{
\dontrun{
a <- matrix(c(seq(by=24*60*60,length=20),1:20,41:60),nrow=20,ncol=3)
b <- as.its(a)
lagIts(b)
lagdistIts(b[,1],1,3)
}
}
