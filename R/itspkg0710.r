require("methods")
setClass("its",representation("matrix",dates="POSIXt"))
#-Methods-
#arith-methods------------------------------------------------------
setMethod("Arith",signature(e1="its",e2="its"),
    function(e1,e2)
    {
    if(!identical(e1@dates,e2@dates)) stop("dates must match")
    e1@.Data <- callGeneric(e1@.Data,e2@.Data)
    return(e1)
    }
    )
#plot-method--------------------------------------------------------
if(!isGeneric("plot")) setGeneric("plot")
setMethod("plot",signature(x="its",y="missing"),
    plotIts <- function(x,y,colvec=1:ncol(x),type="l",ltypvec=1,lwdvec=1,
                        leg=FALSE,yrange,format,at,interp=c("linear","none"),...) 
    {
    if(missing(yrange)){ylim <- range(x,na.rm=TRUE)} else {ylim <- yrange}
    interp <- match.arg(interp)
    firstp <- TRUE
    xdates <- x@dates
    n <- dim(x)[1]
    m <- dim(x)[2]
    #make line control parameters correct length
    colveclong <- rep(colvec,length.out=m)
    ltypveclong <- rep(ltypvec,length.out=m)
    lwdveclong <- rep(lwdvec,length.out=m)
    for(i in 1:m)
        {
        if(interp=="linear") 
            {
            vpoints <- c(1,which(!is.na(x[,i])),n)
            xxx <- x[,i]
            } else
            {
            vpoints <- 1:n
            xxx <- expandIts(x[,i])
            }
        for (j in 1:ncol(xxx))
            {
            if(!firstp){par(new=TRUE)}else {firstp <- FALSE}
            plot.POSIXct(x=xdates[vpoints],
                        y=xxx[vpoints,j],
                        type=type,
                        col=colveclong[i],
                        ylim=ylim,
                        lty=ltypveclong[i],
                        lwd=lwdveclong[i],
                        xaxt="n",
                        ...)
            }
        }
    grid()
    axis.POSIXct(x=xdates[vpoints],side=1,at=at,format=format)
    if(leg){legend(locator(1),legend=dimnames(x)[[2]],fill=colveclong,bty="n",col=colveclong)}
    }
    )
#print-method-------------------------------------------------------
if(!isGeneric("print")) {setGeneric("print")}
setMethod("print",signature(x="its"),
    printIts <- function(x,...){print(x@.Data,...)}
    )
#start-method-------------------------------------------------------
if(!isGeneric("start")) {setGeneric("start")}
setMethod("start",signature(x="its"),
    startIts <- function(x,format=its.format(),...)
    {
    #returns text format not posix (suitable for rangeIts)
    return(format.POSIXct(x@dates[1],format=format,...))
    }
    )
#end -method--------------------------------------------------------
if(!isGeneric("end")) {setGeneric("end")}
setMethod("end",signature(x="its"),
    endIts <- function(x,format=its.format(),...)
    {
    #returns text format not posix (suitable for rangeIts)
    return(format.POSIXct(x@dates[length(x@dates)],format=format,...))
    }
    )
#summary-method-----------------------------------------------------
if(!isGeneric("summary")) {setGeneric("summary")}
setMethod("summary",signature(object="its"),
    summaryIts <- function(object,...)
    {
    r1 <- apply(object,2,mean,na.rm=TRUE)
    r2 <- sqrt(apply(object,2,var,na.rm=TRUE))
    r3 <- apply(object,2,min,na.rm=TRUE)
    r4 <- apply(object,2,max,na.rm=TRUE)
    r5 <- apply(!is.na(object),2,sum,na.rm=TRUE)
    mysum <- rbind(r1,r2,r3,r4,r5)
    dimnames(mysum)[[1]] <- c("mean","s.d.","min","max","nsamp")
    mysum
    }
    )
#cumsum-method------------------------------------------------------
setMethod("cumsum",signature(x="its"),
    cumsumIts <- function(x)
    {
    y <- x
    for(j in 1:ncol(x)) {y[,j] <- cumsum(as.numeric(x[,j]))}
    return(y)
    }
    )
#diff-method--------------------------------------------------------
if(!isGeneric("diff")) {setGeneric("diff")}
setMethod("diff",signature(x="its"),
    diffIts <- function(x,lag=1)
    {
    i <- NULL
    if((lag+1)<=length(x@dates)) i <- (lag+1):length(x@dates)
    y <- its(diff(x@.Data,lag=lag,drop=FALSE),dates=x@dates[i])
    return(y)
    }
    )
#union-method-------------------------------------------------------
if(!isGeneric("union")) {setGeneric("union")}
unionIts <- function(x,y)
    {
    if(!is.null(x)&!is.null(y))
    {
    dates1                  <- x@dates
    dates2                  <- y@dates
    alldates                <- sort(union(dates1,dates2))
    allnames                <- c(dimnames(x)[[2]],dimnames(y)[[2]])
    class(alldates)         <- class(x@dates)
    m1                      <- ncol(x)
    m2                      <- ncol(y)
    n                       <- length(alldates)
    m                       <- m1+m2
    united                  <- matrix(NA,nrow=n,ncol=m)
    united[match(dates1,alldates),1:m1] <- x
    united[match(dates2,alldates),(m1+1):m] <- y
    result <- its(united,dates=alldates,names=allnames)
    }
    if(is.null(x)) {result <- y}
    if(is.null(y)) {result <- x}
    return(result)
    }
setMethod("union",signature(x="its",y="its"),unionIts)
setMethod("union",signature(x="its",y="NULL"),unionIts)
setMethod("union",signature(x="NULL",y="its"),unionIts)

#intersect-method---------------------------------------------------
if(!isGeneric("intersect")) {setGeneric("intersect")}
intersectIts <- function(x,y)
    {
    if(!is.null(x)&!is.null(y))
    {
    dates1                  <- x@dates
    dates2                  <- y@dates
    alldates                <- sort(intersect(dates1,dates2))
    class(alldates)         <- class(x@dates)
    allnames                <- c(dimnames(x)[[2]],dimnames(y)[[2]])
    m1                      <- dim(x)[2]
    m2                      <- dim(y)[2]
    n                       <- length(alldates)
    m                       <- m1+m2
    united                  <- matrix(NA,n,m)
    drows1                  <- sort(match(dates1,alldates))
    drows2                  <- sort(match(dates2,alldates))
    srows1                  <- sort(match(alldates,dates1))
    srows2                  <- sort(match(alldates,dates2))
    united[drows1,1:m1]     <- x[srows1,,drop=FALSE]
    united[drows2,(m1+1):m] <- y[srows2,,drop=FALSE]
    result <- its(united,dates=alldates,names=allnames)
    }
    if(is.null(x)) {result <- y}
    if(is.null(y)) {result <- x}
    return(result)
    }
setMethod("intersect",signature(x="its",y="its"),intersectIts)
setMethod("intersect",signature(x="its",y="NULL"),intersectIts)
setMethod("intersect",signature(x="NULL",y="its"),intersectIts)

#-Functions-
#readcsvIts-function------------------------------------------------
readcsvIts <- function(filename,informat=its.format(),outformat=its.format(),tz="",usetz=FALSE,header=TRUE,...)
    {
    mydata <- read.csv(filename,header=header,...)
    n <- dim(mydata)[1]
    m <- dim(mydata)[2]
    datamat <- as.numeric(as.matrix((mydata)[,2:m,drop=FALSE]))
    dim(datamat) <- c(n,(m-1))
    dimnames(datamat) <- list(dimnames(mydata)[[1]],dimnames(mydata)[[2]][2:m])
    dimnames(datamat)[[1]]  <- format.POSIXlt(strptime(as.character(as.vector(mydata[,1])),
                                              informat),format=outformat,tz=tz,usetz=usetz)
    return(datamat)
    }
#writecsvIts-function-----------------------------------------------
writecsvIts <- function(x,filename,format=its.format(),tz="",usetz=FALSE,col.names=NA,sep=",",...)
    {
    if (!inherits(x, "its")) stop("function is only valid for objects of class 'its'")
    dimnames(x)[[1]] <- format.POSIXct(x@dates,format=format,tz=tz,usetz=usetz)
    y <- data.frame(x@.Data)
    dimnames(y) <- dimnames(x)
    mydata <- write.table(y,file=filename,col.names=col.names,sep=sep,...)
    }

#accrueIts-function-------------------------------------------------
accrueIts <- function(x,daysperyear=365)
    {
    if (!inherits(x, "its")) stop("function is only valid for objects of class 'its'")
    n <- nrow(x)
    accrued.val <- x[-n,]*diff(as.numeric(x@dates))/(daysperyear*24*60*60)
    accrued.dates <- x@dates[-1]
    return(its(accrued.val,dates=accrued.dates))
    }
#its-function-------------------------------------------------------
its <- function(x,
                dates=as.POSIXct(x=strptime(dimnames(x)[[1]],format=its.format())),
                names=dimnames(x)[[2]],format=its.format(),...)
    {
    if(is.null(dim(x))){dim(x) <- c(length(x),1)}
    x <- addDimnames(x)
    if(!(nrow(x)==length(dates))) {stop("dates length must match matrix nrows")}
    if(!(ncol(x)==length(names))) {stop("names length must match matrix ncols")}
    dimnames(x)[[1]] <- format.POSIXct(dates,format=format,...)
    dimnames(x)[[2]] <- names
    return(new("its",x,dates=dates))
    }
#is.its-function----------------------------------------------------
is.its <- function(object)
    {
    return(inherits(object,"its") && validIts(object))
    }
#as.its-function----------------------------------------------------
as.its <- function(x,...)
    {
    dates <- as.vector(x[,1])
    class(dates) <- c("POSIXt","POSIXct")
    return(its(x=x[,-1],dates=dates,...))
    }
#lagIts-function----------------------------------------------------
lagIts <- function(x,k=1)
    {
    if (!inherits(x, "its")) stop("function is only valid for objects of class 'its'")
    lagmat <- x*NA
    dimnames(lagmat)[[2]] <- paste(dimnames(lagmat)[[2]],"lag",k)
    n <- dim(x)[1]
    if(k>0)
        {lagmat[(k+1):n,] <- x[1:(n-k),]}  else
        {lagmat[1:(n+k),] <- x[(1-k):n,]}
    y <- its(lagmat,dates=x@dates)
    return(y)
    }
#lagdistIts-function------------------------------------------------
lagdistIts <- function(x,kmin,kmax)
    {
    if (!inherits(x, "its")) stop("function is only valid for objects of class 'its'")
    result <- lagIts(x,kmin)
    if(kmax>kmin)
        {
        for(j in (kmin+1):kmax)
            {
            result <- intersectIts(result,lagIts(x,j))
            }
        }
    return(result)
    }
#alignedIts-function---------------------------------------------
alignedIts <- function(obj1,obj2,print=FALSE)
    {
    if (!inherits(obj1, "its")&inherits(obj2, "its")) stop("function is only valid for objects of class 'its'")
    #takes the intersection of the dates and extracts same dates for both
    mat <- intersectIts(obj1,obj2)
    obj1a <- mat[,1:ncol(obj1),drop=FALSE]
    obj2a <- mat[,(ncol(obj1)+1):ncol(mat),drop=FALSE]
    if(print)
    {
    print(paste("inputs number of rows",nrow(obj1),nrow(obj2),"; output number of rows",nrow(mat)))
    print(paste("inputs number of cols",ncol(obj1),ncol(obj2),"; output number of cols",ncol(obj1a),ncol(obj2a)))
    }
    return(list(obj1a,obj2a))
    }
#appendIts-function-------------------------------------------------
appendIts <- function(obj1,obj2,but=TRUE,matchnames=TRUE)
    {
    if(is.null(obj1)&inherits(obj2, "its")) return(obj2)
    if(is.null(obj2)&inherits(obj1, "its")) return(obj1)
    if (!inherits(obj1, "its")&inherits(obj2, "its")) stop("function is only valid for objects of class 'its'")
    overlap <- overlapsIts(obj1,obj2)
    if(overlap & but) stop("overlap not allowed")
    nmatch <- namesmatchIts(obj1,obj2)
    if(matchnames && !nmatch) stop("names of the two inputs must match")
    if(overlap &&!overlapmatchesIts(obj1[,attr(nmatch,which="lut")],obj2)) stop("overlap data does not match")
    if(max(as.numeric(obj1@dates))<max(as.numeric(obj2@dates)))
        {    xlow <- obj1;    xhigh <- obj2    } else
        {    xlow <- obj2;    xhigh <- obj1    }
    if(overlapsIts(obj1,obj2))
        {
        highoverlap <- which(as.numeric(xhigh@dates)<=max(as.numeric(xlow@dates)))
        xhigh <- xhigh[-highoverlap,]
        }
    if(matchnames)
        {united <- rbind(xlow[,attr(nmatch,which="lut")],xhigh)} else
        {united <- rbind(xlow,xhigh)}
    alldates <- c(xlow@dates,xhigh@dates)
    result <- its(united,dates=alldates)
    return(result)
    }
#daysecondIts-function----------------------------------------------
daysecondIts <- function (x,...)
    {
    if (!inherits(x, "its")) stop("function is only valid for objects of class 'its'")
    hour <- as.POSIXlt(x@dates,...)$hour
    min <- as.POSIXlt(x@dates,...)$min
    sec <- as.POSIXlt(x@dates,...)$sec
    return(3600 * hour + 60 * min + sec)
    }
#weekdayIts-function------------------------------------------------
weekdayIts <- function (x,...)
    {
    if (!inherits(x, "its")) stop("function is only valid for objects of class 'its'")
    day <- as.POSIXlt(x@dates,...)$wday
    return((0 < day) & (day < 6))
    }
#rangeIts-function--------------------------------------------------
rangeIts <- function(x,start=startIts(x),end=endIts(x),format=its.format(),...)
    {
    if (!inherits(x, "its")) stop("function is only valid for objects of class 'its'")
    #returns rows corresponding to a date range; start and end are strings in the format specified
    start.posix <- as.POSIXct(x=strptime(start,format=format),...)
    end.posix <- as.POSIXct(x=strptime(end,format=format),...)
    return(x[which((x@dates>=start.posix) & (x@dates<=end.posix)),])
    }
#-Utility Methods-
#validity check----------------------------------------------------
validIts <-  function(object)
    {
    if(!identical(nrow(object@.Data),length(object@dates))) return("Inconsistent length of dates")
    if(any(is.na(object@dates))) return("Missing values in dates")
    d <- diff(object@dates)
    if(any(d<0.)) return("Decreasing dates not allowed")
    return(TRUE)
    }
setValidity("its",validIts)
#[-method-----------------------------------------------------------
setMethod("[", c("its","ANY"),  function(x, i=min(1,nrow(x)):nrow(x), j=min(1,ncol(x)):ncol(x), drop = FALSE)
    {
    if(missing(i)) {i <- min(1,nrow(x)):nrow(x)}
    if(missing(j)) {j <- min(1,ncol(x)):ncol(x)}
    if(missing(drop)) {drop <- FALSE}
    subx <- x@.Data[i, j, drop = drop]
    dates <- x@dates[i]
    ans <- new("its",
            subx,
            dates=dates)
    return(ans)
    })
#-Utility Functions-
#addDimnames-function-----------------------------------------------
addDimnames <- function(mat)
    {
    if(is.null(dimnames(mat))) {dimnames(mat) <- list(NULL,NULL)}
    if(is.null(dimnames(mat)[[1]])&(nrow(mat)>0)) {dimnames(mat)[[1]] <- 1:nrow(mat)}
    if(is.null(dimnames(mat)[[2]])&(ncol(mat)>0)) {dimnames(mat)[[2]] <- 1:ncol(mat)}
    return(mat)
    }
#gapIts-function---------------------------------------------------
gapIts <- function(x,y,maxgap)
    {
    if (!inherits(x, "its")&inherits(y, "its")) stop("function is only valid for objects of class 'its'")
    d1 <- as.numeric(x@dates)
    d2 <- as.numeric(y@dates)
    dd1 <- diff(d1)
    dd2 <- diff(d2)
    del1 <- min(d1)-max(d2)
    del2 <- min(d2)-max(d1)
    gap <- max(max(del1,del2),0)
    allrange <- range(range(dd1),range(dd2))
    gapwrong <- gap>max(allrange[2],maxgap)
    attr(gap,which="gapexcessive") <- gapwrong
    return(gap)
    }
#overlapsIts-function----------------------------------------------
overlapsIts <- function(x,y)
    {
    if (!inherits(x, "its")&inherits(y, "its")) stop("function is only valid for objects of class 'its'")
    if(max(as.numeric(x@dates))<max(as.numeric(y@dates)))
        {    xlow <- x;    xhigh <- y    } else
        {    xlow <- y;    xhigh <- x    }
    nooverlap <- max(as.numeric(xlow@dates))<min(as.numeric(xhigh@dates))
    return(!nooverlap)
    }
#overlapmatchesIts-function----------------------------------------
overlapmatchesIts <- function(x,y)
    {
    if (!inherits(x, "its")&inherits(y, "its")) stop("function is only valid for objects of class 'its'")
    if(!overlapsIts(x,y)) {stop("no overlap")}
    if(max(as.numeric(x@dates))<max(as.numeric(y@dates)))
        {    xlow <- x;    xhigh <- y    } else
        {    xlow <- y;    xhigh <- x    }
    lowoverlap <- which(as.numeric(xlow@dates)>=min(as.numeric(xhigh@dates)))
    highoverlap <- which(as.numeric(xhigh@dates)<=max(as.numeric(xlow@dates)))
    if(!identical(xlow@dates[lowoverlap],xhigh@dates[highoverlap]))
        {mymatch <- FALSE} else
        {mymatch <- identical(all.equal(xlow[lowoverlap,],xhigh[highoverlap,]),TRUE)}
    return(mymatch)
    }
#namesmatchIts-function--------------------------------------------
namesmatchIts <- function(x,y)
    {
    lut <- match(dimnames(y)[[2]],dimnames(x)[[2]])
    namesmatch <- identical(dimnames(x[,lut])[[2]],dimnames(y)[[2]])&
                    all(!duplicated(dimnames(x)[[2]]))&all(!duplicated(dimnames(y)[[2]]))
    attr(namesmatch,which="lut") <- lut
    return(namesmatch)
    }
#its.format-function------------------------------------------------
its.format <- function(format=NULL)
    {
    if(is.null(format))
        {
        if(!exists("its..format"))
            {outformat <- "%Y-%m-%d"} else
            {outformat <- its..format}
        } else
            {outformat <- format}
    if(is.na(match("package:its",search()))) {its..format <<- outformat} else
    {assign("its..format",outformat,pos="package:its")}
    return(outformat)
    }
#expandIts-function------------------------------------------------
expandIts <- function(x)
    {
    #takes a single column 'its', if there are NAs, splits it into columns
    #each column having only a single run of non-NA data
    if(all(is.na(x))) return(x)
    mat <- rbind(x[1,1,drop=FALSE]*NA,x[,1,drop=FALSE],x[nrow(x),1,drop=FALSE]*NA)
    ib <- which(diff(is.na(mat))==-1)
    ie <- which(diff(is.na(mat))==1)
    nruns <- length(ib)
    matexp <- matrix(NA,nrow=nrow(x),ncol=nruns)
    for(i in 1:nruns) 
        {
        irun <- ib[i]:(ie[i]-1)
        matexp[irun,i] <- x[irun,1,drop=FALSE]
        }
    dimnames(matexp) <- list(dimnames(x)[[1]],rep(dimnames(x)[[2]][1],nruns))
    result <- its(matexp,x@dates)
    result
    }
