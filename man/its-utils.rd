\keyword{internal}
\name{its-utilities}
\alias{addDimnames}
\alias{gapIts}
\alias{overlapsIts}
\alias{overlapmatchesIts}
\alias{namesmatchIts}
\alias{plotIts}
\alias{printIts}
\alias{startIts}
\alias{endIts}
\alias{summaryIts}
\alias{cumsumIts}
\alias{diffIts}
\alias{validIts}

\title{Utility Functions for Irregular Time-Series Objects}
\description{
  Utility functions for objects of class \code{"its"}.
}
\usage{

addDimnames(mat)
gapIts(x,y,maxgap)
overlapsIts(x,y)
overlapmatchesIts(x,y)
namesmatchIts(x,y)
plotIts(x,y,colvec=1:ncol(x),groupsize=m,type="l",ltyps="sequence",
                        leg=FALSE,yrange=NA,format=NA,...)
printIts(x,...)
startIts(x,format=its.format(),...)
endIts(x,format=its.format(),...)
summaryIts(object,...)
cumsumIts(x)
diffIts(x,lag=1)
validIts(object)

}
\arguments{
  \item{mat}{a matrix}
  \item{x,y,object}{objects of class \code{"its"}}
  \item{maxgap}{a numeric scalar}
  \item{type}{plot type, see \code{\link{par}}.}
  \item{colvec,ltyps}{vectors of colour codes, line types, see \code{\link{par}}.}
  \item{groupsize}{colours are recycled after this number have been used.}
  \item{leg}{logical flag to display legend; uses \code{locator} for position.}
  \item{yrange}{ordinate range for display.}
  \item{format}{a formatting string, see \code{\link{format.POSIXct}}, for the axis dates}
  \item{\dots}{further arguments passed to or from other methods:
    for \code{start} and \code{end}, passed to \code{\link{format.POSIXct}.} }
    for \code{plot} passed to \code{\link{plot}}.;
    for \code{print} passed to \code{\link{print.matrix}}
  \item{lag}{an integer number of lags}
}

\details{

These functions are utilities, not intended for general use.
addDimnames adds dimnames (strings representing row and column number) if absent
gapIts tests for the present of a gap in the time-stamps of its inputs
overlapsIts tests for the presence of overlap in the time-stamps of its inputs
overlapmatchesIts tests for equality of overlapping data in its inputs
namesmatchIts tests for equality of culumn names of its inputs
Other functions are the \code{setMethod} \code{definition} for the associated generic.
}

\value{

addDimnames returns a matrix
gapIts returns the gap (in seconds) between inputs
overlapsIts returns a boolean
overlapmatchesIts returns a boolean
namesmatchIts returns a boolean
for other functions, refer to the associated generic
}
\author{Giles Heywood}

\seealso{
  \code{\link{its}},
}
