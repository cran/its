\keyword{internal}
\name{its-internal}
\alias{addDimnames}
\alias{gapIts}
\alias{overlapsIts}
\alias{overlapmatchesIts}
\alias{namesmatchIts}
\alias{expandIts}
\alias{plotIts}
\alias{printIts}
\alias{startIts}
\alias{endIts}
\alias{summaryIts}
\alias{cumsumIts}
\alias{diffIts}
\alias{validIts}
\alias{unionIts}
\alias{intersectIts}

\title{Internal Functions for Irregular Time-Series Objects}
\description{
  Internal functions for objects of class \code{"its"}.
}
\usage{

addDimnames(mat)
gapIts(x,y,maxgap)
overlapsIts(x,y)
overlapmatchesIts(x,y)
namesmatchIts(x,y)
expandIts(x)
plotIts(x,y,colvec=1:ncol(x),type="l",ltypvec=1,lwdvec=1,
       leg=FALSE,yrange,format,at,interp=c("linear","none"),...)
printIts(x,...)
startIts(x,format=its.format(),...)
endIts(x,format=its.format(),...)
summaryIts(object,...)
cumsumIts(x)
diffIts(x,lag=1)
validIts(object)
unionIts(x,y)
intersectIts(x,y)

}
\arguments{
  \item{mat}{a matrix}
  \item{x,y,object,e1,e2}{objects of class \code{"its"}}
  \item{maxgap}{a numeric scalar}
  \item{type}{plot type, see \code{\link{par}}.}
  \item{colvec,ltypvec,lwdvec}{vectors of colour codes, line types, and line widths: see \code{\link{par}}.}
  \item{leg}{logical flag to display legend; uses \code{locator} for position.}
  \item{yrange}{ordinate range for display.}
  \item{at}{a vector of POSIX dates defining tickmark locations on axis: see \code{\link{axis.POSIXct}}}
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
namesmatchIts tests for equality of column names of its inputs
expandIts splits a single series into a number of series, each with a single run of non-NA data.
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
