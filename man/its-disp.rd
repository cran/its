\keyword{ts}
\name{its-disp}
\alias{its-disp}
\alias{plot,its,missing-method}
\alias{print,its-method}

\title{Display Methods for Irregular Time-Series Objects}
\description{
  Display methods for objects of class \code{"its"}.
}

\section{Usage}{
plot(x,y,colvec=1:ncol(x),type="l",ltypvec=1,lwdvec=1,
leg=FALSE,yrange,format,at,interp=c("linear","none"),...)
print(x,...)
}

\section{Arguments}{
\describe{
  \item{x}{an object of class \code{"its"}}
  \item{y}{missing}
  \item{type}{plot type, "l" for line, "p" for point, "b" for both - see \code{\link{par}}.}
  \item{colvec,ltypvec,lwdvec}{vectors of colour codes, line types, and line widths: see \code{\link{par}}.}
  \item{leg}{logical flag to display legend; uses \code{locator} for position.}
  \item{yrange}{ordinate range for display.}
  \item{format}{a formatting string, see \code{\link{format.POSIXct}}, for the axis dates}
  \item{at}{a vector of POSIX dates defining tickmark locations on axis: see \code{\link{axis.POSIXct}}}
  \item{\dots}{further arguments passed to or from other methods:
    for \code{plot} passed to \code{\link{plot}}.;
    for \code{print} passed to \code{\link{print.matrix}}}
    }
}
\details{

\code{plot} is the method for plotting irregular time-series objects.
All series are displayed on a single set of axes, by default using different
colours, linetypes, and widths.  If the vectors defining these attributes are 
short, they are cycled.

\code{print} is the method for printing irregular time-series objects.
The format for the dates is determined at the time the 'its' object is created.

}

\value{

The methods are called for their side-effects.

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
plot(b,colvec=c(1,7),lwdvec=1:2,ltypvec=1:2)
print(b)
its.format("\%d/\%m/\%Y")
b <- as.its(a)
print(b)
}
}
