\keyword{ts}
\name{its-file}
\alias{its-file}
\alias{readcsvIts}
\alias{writecsvIts}
\title{File Operations for Irregular Time-Series Objects}
\description{
  File read and write operations for objects of class \code{"its"}.
}
\usage{
readcsvIts(filename,informat=its.format(),outformat=its.format(),tz="",
usetz=FALSE,header=TRUE,...)
writecsvIts(x,filename,format=its.format(),tz="",usetz=FALSE,col.names=NA,
sep=",",...)
}
\arguments{
  \item{filename}{filename}
  \item{x}{an object of class \code{"its"}}
  \item{format, informat, outformat, tz, usetz}{formatting related arguments, see \code{\link{format.POSIXct}}.}
  \item{header}{see \code{\link{read.csv}}}
  \item{col.names, sep}{see \code{\link{write.table}}}
  \item{\dots}{further arguments passed to or from other methods: for
    \code{readcsv.its} passed to \code{\link{read.csv}}; for
    \code{writecsv.its} passed to \code{\link{write.table}}}
}
\details{
  \code{readcsv.its} reads from a .csv file to an irregular time-series object.

  \code{writecsv.its} write an irregular time-series object to a text file.
}
\value{

  For \code{readcsv.its} an object of class \code{"its"}.

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
fname <- tempfile()
# To write an irregular time-series object to a file one might use
writecsvIts(b,filename=fname)
# To read an irregular time-series object from a file one might use
readcsvIts(filename=fname,informat=its.format())
unlink(fname)
}
}
