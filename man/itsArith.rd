\keyword{ts}
\keyword{arith}
\name{itsArith}
\alias{itsArith}
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
  \code{\link{itsFile}},
  \code{\link{itsLags}}
  \code{\link{itsJoin}}
  \code{\link{itsTimes}}
  \code{\link{itsSubset}}
  \code{\link{itsFin}}
  \code{\link{itsDisp}}
  \code{\link{itsInfo}}
  \code{\link{itsCumdif}}
  \code{\link{itsInterp}}  
}

\examples{
b <- newIts(1:30,ncol=3)
b+b-2*b
b/b
b\%*\%diag(ncol(b))
its(b\%*\%diag(ncol(b))) 
}
