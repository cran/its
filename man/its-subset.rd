\keyword{ts}
\name{its-subset}
\alias{its-subset}
\alias{rangeIts}
\alias{x[i,j]}
\alias{[,its-method}
\title{Range and Extract for Irregular Time-Series Objects}
\description{
  Range and extratct for objects of class \code{"its"}.
}
\usage{
rangeIts(x,start=startIts(x),end=endIts(x),format=its.format(),...)
x[i,j]
}
\arguments{
  \item{x}{an object of class \code{"its"}}
  \item{start, end}{text representing start and end dates of the range to extract}
  \item{format}{format of \code{"start"} and \code{"end"} dates, see
        \code{\link{format.POSIXct}}.}
  \item{i,j}{indices specifying the parts to be extracted from the irregular
        time-series object}
  \item{\dots}{further arguments passed to \code{\link{as.POSIXct}}}
}
\details{
  \code{rangeIts} selects a range of rows that fall between two times, specified
  in text format.

  \code{x[i,j]} extractor method for an irregular time-series proceeds as for a matrix, with
  the exception that drop=FALSE is enforced, so the result always inherits from matrix.
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
rangeIts(b,start = "1970-01-04" ,end= "1970-01-06" ,format= "\%Y-\%m-\%d" )
b[1:3,]
b[,1]
}
}
