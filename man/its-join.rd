\keyword{ts}
\name{its-join}
\alias{its-join}
\alias{unionIts}
\alias{intersectIts}
\alias{alignedIts}
\alias{appendIts}

\title{Join Functions for Irregular Time-Series Objects}
\description{
  Join functions for objects of class \code{"its"}.
}
\usage{
unionIts(x,y)
intersectIts(x,y)
alignedIts(obj1,obj2,print=TRUE)
appendIts(obj1,obj2,but=TRUE,matchnames=TRUE)
}

\arguments{
  \item{x, y, obj1, obj2}{an object of class \code{"its"}}
  \item{print}{logical flag to display summary information}
  \item{but}{logical flag controls whether overlap is disallowed}
  \item{matchnames}{logical flag controls whether names must match}
}

\details{

\code{unionIts} has a number of time values (rows) which is determined by the union
of the time-stamps of the two inputs.  The number of columns is the sum of the
number of columns of the two inputs.

\code{intersectIts} has a number of time values (rows) which is determined by the
intersect of the time-stamps of the two inputs.  The number of columns is the sum
of the number of columns of the two inputs.

\code{alignedIts} selects the rows from two inputs which have identical time-stamps

\code{appendIts} appends one object to the other, removing overlapping data from the
later object, optionally checking that the column names match

}

\value{
For \code{unionIts}, \code{intersectIts}, \code{appendIts} an object of class \code{"its"}.

For \code{alignedIts}, a list of two objects of class \code{"its"}
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
unionIts(b,diff(b))
intersectIts(b,diff(b))
alignedIts(b,diff(b))
a1 <- matrix(c(seq(from=24*60*60*30,by=24*60*60,length=20),1:20,41:60),nrow=20,ncol=3)
b1 <- as.its(a1)
appendIts(b,b1)
}
}
