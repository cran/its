\keyword{ts}
\name{its-cumdif}
\alias{its-cumdif}
\alias{cumsum,its-method}
\alias{diff,its-method}

\title{Cumulation, Differencing for Irregular Time-Series Objects}
\description{
  Cumulation, differencing for objects of class \code{"its"}.
}
\section{Usage}{

cumsum(x)
diff(x,lag=1)

}
\section{Arguments}{
\describe{
  \item{x}{an object of class \code{"its"}}
  \item{lag}{an integer number of lags}
  }
}

\details{

\code{cumsum} and \code{diff} perform the cumulative sum and difference of each
column in turn.  In \code{diff}, the first \code{lag} rows are discarded.

}

\value{

An object of class \code{"its"}

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
cumsum(b)
diff(b,lag=2)
}
}
