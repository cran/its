\keyword{ts}
\name{its-disp}
\alias{its-disp}
\alias{plot,its-method}
\alias{print,its-method}

\title{Display Methods for Irregular Time-Series Objects}
\description{
  Display methods for objects of class \code{"its"}.
}

\section{Usage}{
plot(x,y,colvec=1:ncol(x),groupsize=m,type="l",ltyps="sequence",
leg=FALSE,yrange=NA,format=NA,...)
print(x,...)
}

\section{Arguments}{
\describe{
  \item{x}{an object of class \code{"its"}}
  \item{y}{this argument is not used}
  \item{type}{plot type, see \code{\link{par}}.}
  \item{colvec,ltyps}{vectors of colour codes, line types, see \code{\link{par}}.}
  \item{groupsize}{colours are recycled after this number have been used.}
  \item{leg}{logical flag to display legend; uses \code{locator} for position.}
  \item{yrange}{ordinate range for display.}
  \item{format}{a formatting string, see \code{\link{format.POSIXct}}, for the axis dates}
  \item{\dots}{further arguments passed to or from other methods:
    for \code{plot} passed to \code{\link{plot}}.;
    for \code{print} passed to \code{\link{print.matrix}}}
    }
}
\details{

\code{plot} is the method for plotting irregular time-series objects.
All series are displayed on a single set of axes, by default using different
linetypes and colours.

\code{print} is the method for printing irregular time-series objects.
The format for the dates is determined at the time the 'its' object is created,
using the format control \code{\link{its.format}}.

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
plot(b)
print(b)
its.format("\%d/\%m/\%Y")
b <- as.its(a)
print(b)
}
}
