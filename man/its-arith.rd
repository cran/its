\keyword{ts}
\keyword{arith}
\name{its-arith}
\alias{its-arith}
\alias{Arith,its,its-method}
\alias{+}

\title{Arithmetic Methods for Irregular Time-Series Objects}
\description{
  Arithmetic methods for objects of class \code{"its"}.
}

\usage{
     x + y
     x - y
     x * y
     x / y
     x ^ y
     x %% y
     x %/% y
}

\arguments{
  \item{x,y}{an object of class \code{"its"}}
}
\details{

The arithmetic operators return numeric vectors containing the result of the 
element-by-element operations.  The arguments must be conformable (same dimensions) 
and their time-stamps must match for each row.

Note that the matrix multiplication operator, %*%, is inherited from matrix,
and the result of a matrix multiplication is a matrix, not an \code{"its"}.
The resulting matrix can be converted back to its using the function its() 
- see examples.
}

\value{

The returned object is an object of class \code{"its"}, conformable with the
inputs, and with identical time-stamps.

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
}

\examples{
\dontrun{
a <- matrix(c(seq(by=24*60*60,length=20),1:20,41:60),nrow=20,ncol=3)
b <- as.its(a)
b+b-2*b
b/b
b%*%diag(ncol(b))
its(b%*%diag(ncol(b))) 
}
}
