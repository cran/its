\keyword{ts}
\name{its-info}
\alias{its-info}
\alias{start,its-method}
\alias{end,its-method}
\alias{summary,its-method}

\title{Summary Information for Irregular Time-Series Objects}
\description{
  Summary information for objects of class \code{"its"}.
}
\section{Usage}{

start(x,format=its.format(),\dots)
end(x,format=its.format(),\dots)
summary(object)

}
\section{Arguments}{
\describe{
  \item{x, object}{an object of class \code{"its"}}
  \item{format}{a formatting string, see \code{\link{format.POSIXct}}}
  \item{\dots}{further arguments passed to or from other methods:
    for \code{start} and \code{end}, passed to \code{\link{format.POSIXct}.} }
    }
}
\details{

Summary returns the mean, standard deviation, minimum, maximum, and number of
non-NA data points for each series.

Start and end return the dates corresponding to the first and last rows,
respectively.

}

\value{

For \code{start}, \code{end}, a formatted text representation of the first and last times
For \code{summary}, a table of summary statistics for each series
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
start(b,format="\%y-\%m-\%d")
end(b)
summary(b)
}
}
