#its-download*******************************************************
its.format("%Y-%m-%d")
foo <- priceIts(instrument="^ftse",start="1991-01-02")
identical(start(foo),"1991-01-02")
identical(names(foo),c("Open","High","Low","Close"))
foo <- priceIts(instrument="OOM.L",start="1996-01-02")
foo <- priceIts(instrument="MKS.L",start="1996-01-02")
