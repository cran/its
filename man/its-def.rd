\keyword{ts}
\name{its-def}

\alias{its}
\alias{its-class}
\alias{is.its}
\alias{as.its}
\alias{its.format}

\title{Irregularly Spaced Time-Series}

\description{
  The function \code{its} is used to create irregular time-series
  objects.
  \code{as.its} coerces an object to an irregularly spaced
  time-series. \code{is.its} tests whether an object is an irregularly
  spaced time series.
  }

\usage{
its(x,dates=as.POSIXct(x=strptime(dimnames(x)[[1]],format=its.format())),
names=dimnames(x)[[2]],format=its.format(),...)
as.its(x,...)
is.its(object)
its.format(format=NULL)
}

\arguments{
  \item{dates}{a vector of class \code{"POSIXct"}
    representing the time-stamps of the irregular time-series
    object. The elements of the numeric vector are construed as the
    number of seconds since the beginning of 1970, see
    \code{\link{POSIXct}}.}
  \item{x}{a numeric matrix representing the values of the
    irregular time-series object.  In the case of coercion, the first
    column is taken to be the time-stamps, in seconds since the beginning
    of 1970, see \code{\link{POSIXct}}.}
  \item{object}{an irregular time-series object}
  \item{names}{a vector of mode character}
  \item{format}{a formatting string, see \code{\link{format.POSIXct}},
    defaults to \code{"\%Y-\%m-\%d"} if \code{format} is not specified.}
  \item{\dots}{further arguments passed to or from other methods:
    for \code{its} passed to \code{\link{format.POSIXct}}.;
    for \code{as.its} passed to \code{\link{its}}}
}

\details{
 The function its is used to create irregular time-series ("its") objects.
 An object of class "its" is a matrix with rows indexed by a time-stamp
 of class "POSIXct". Unlike objects of class "ts", it can be used to
 represent irregularly spaced time-series.  The object consists of a
 matrix, with a single slot, the named POSIX vector named "dates".
 An object of class its inherits matrix arithmetic methods.  The matrix
 has dimnames: dimnames[[1]] is populated with a text representation of
 "dates", using a format which is defined by the function its.format. These
 text dates are not used in computations - all computations use the 
 POSIX representation.  The dates are required to be in ascending order.
 
 When matrix multiplication is applied to an "its", the result is of class
 matrix.  It is possible to restore the "its" class (see examples) - its() 
 is in this sense idempotent i.e. its(mat)==its(its(mat)).

 its.format returns a formatting string, and assigns a format variable
 \code{its..format} globally, which persists in the session until reset.

}

\value{
For \code{its} and \code{as.its}, an object of class \code{"its"}, inheriting
from matrix, with a single slot named \code{'dates'}, which is a vector of
class \code{POSIXct}

For \code{is.its}, a logical representing the result of a test for class membership

For \code{its.format}, a text representation of dates formatting for dimnames,
see \code{\link{format.POSIXct}}

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
its.format("\%Y-\%m-\%d")    #defines text format of dates read from dimnames
mat <- structure(1:6,dim=c(2,3),dimnames=list(c("2003-01-01","2003-01-04"),letters[1:3]))
its(mat)
its.format("\%Y\%m\%d")    #defines text format of dates written to dimnames
times <- as.POSIXct(strptime(c("1999-12-31 01:00:00","2000-01-01 02:00:00"),format="\%Y-\%m-\%d \%X"))
its(mat,times)
its.format("\%Y-\%m-\%d \%X")
its(mat,times)
is.its(its(mat,times))
its.format("\%Y\%m\%d \%X")   #defines text format of dates written to dimnames
as.its(mat)
}
}
