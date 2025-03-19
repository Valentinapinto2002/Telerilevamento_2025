# Reporting multitemporal analysis in R
first of all, we should import am image by:

``` r
im.list() #male a list
gr=im.import("greenland") #to import the image
```

Then we might calculate the difference of values of two imgaes

``` r
grdif=gr[[4]]-gr[[1]]
```

This will create the following output image:

``` r
grdif=gr[[4]]-gr[[1]]
```
