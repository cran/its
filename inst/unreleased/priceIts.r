#priceIts-function-------------------------------------------------
#adapted from get.hist.quote in package tseries
priceIts <- function (instrument = "^gdax", start, end, quote = c("Open", 
    "High", "Low", "Close"), provider = "yahoo", method = "auto", 
    origin = "1899-12-30") 
    {
    sav.format <- its.format()
    its.format("%d-%b-%y")
    if (missing(start)) 
        start <- "1991-01-02"
    if (missing(end)) 
        end <- format(Sys.time() - 86400, "%Y-%m-%d")
    provider <- match.arg(provider)
    start <- as.POSIXct(start, tz = "GMT")
    end <- as.POSIXct(end, tz = "GMT")
    if (provider == "yahoo") {
        url <- paste("http://chart.yahoo.com/table.csv?s=", instrument, 
            format(start, paste("&a=", as.character(as.numeric(format(start, 
                "%m")) - 1), "&b=%d&c=%Y", sep = "")), format(end, 
                paste("&d=", as.character(as.numeric(format(end, 
                  "%m")) - 1), "&e=%d&f=%Y", sep = "")), "&g=d&q=q&y=0&z=", 
            instrument, "&x=.csv", sep = "")
        destfile <- tempfile()
        status <- download.file(url, destfile, method = method)
        if (status != 0) {
            unlink(destfile)
            stop(paste("download error, status", status))
        }
        nlines <- length(count.fields(destfile, sep = "\n"))
        if (nlines == 1) {
            unlink(destfile)
            stop(paste("No data available for", instrument))
        }
    y <- readcsvIts(destfile)
    result <- its(y[nrow(y):1,])[,quote]
    its.format(sav.format)    
    return(result)
    }
    else stop("provider not implemented")
    }
