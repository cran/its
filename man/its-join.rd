\keyword{ts}
\name{its-join}
\alias{its-join}
\alias{union}
\alias{union,its,NULL-method}
\alias{union,NULL,its-method}
\alias{union,its,its-method}
\alias{intersect}
\alias{intersect,its,NULL-method}
\alias{intersect,NULL,its-method}
\alias{intersect,its,its-method}
\alias{alignedIts}
\alias{appendIts}

\title{Join Functions for Irregular Time-Series Objects}
\description{
  Join functions for objects of class \code{"its"}.
}
\usage{
union(x,y)
intersect(x,y)
alignedIts(obj1,obj2,print=TRUE)
appendIts(obj1,obj2,but=TRUE,matchnames=TRUE)
}

\arguments{
  \item{x, y}{an object of class \code{"its"} or NULL}
  \item{obj1, obj2}{an object of class \code{"its"}}
  \item{print}{logical flag to display summary information}
  \item{but}{logical flag controls whether overlap is disallowed}
  \item{matchnames}{logical flag controls whether names must match}
}

\details{

\code{union} has a number of time values (rows) which is determined by the union
of the time-stamps of the two inputs.  The number of columns is the sum of the
number of columns of the two inputs.

\code{intersect} has a number of time values (rows) which is determined by the
intersect of the time-stamps of the two inputs.  The number of columns is the sum
of the number of columns of the two inputs.

\code{alignedIts} selects the rows from two inputs which have identical time-stamps

\code{appendIts} appends one object to the other, removing overlapping data from the
later object, optionally checking that the column names match

}

\value{
For \code{union}, \code{intersect}, \code{appendIts} an object of class \code{"its"}.

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
union(b,diff(b))
intersect(b,diff(b))
alignedIts(b,diff(b))
a1 <- matrix(c(seq(from=24*60*60*30,by=24*60*60,length=20),1:20,41:60),nrow=20,ncol=3)
b1 <- as.its(a1)
appendIts(b,b1)
}
}
