\keyword{ts}
\name{its-times}
\alias{its-times}
\alias{daysecondIts}
\alias{weekdayIts}
\title{Time Functions for Irregular Time-Series Objects}
\description{
  Time functions for objects of class \code{"its"}.
}
\usage{
daysecondIts(x,...)
weekdayIts(x,...)
}

\arguments{
  \item{x}{an object of class \code{"its"}}
  \item{\dots}{further arguments passed to \code{\link{as.POSIXlt}}}
}

\details{
  \code{daysecondIts} returns the number of seconds since midnight.

  \code{weekdayIts} tests which entries of an  irregular time-series object are
  time-stamped with weekdays.

}

\value{

  For \code{daysecondIts} a vector of decimal numbers representing the number of seconds.

  For \code{weekdayIts}  a vector of \code{"logical"} representing the test results
  for each time.

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
its.format("\%Y-\%m-\%d \%A")
a <- matrix(c(seq(by=24*60*60,length=20),1:20,41:60),nrow=20,ncol=3)
b <- as.its(a)
print(b)
daysecondIts(b)
weekdayIts(b)
}
}
