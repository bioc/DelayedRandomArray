# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

recycle_vector <- function(vec, dim, index) {
    .Call('_DelayedRandomArray_recycle_vector', PACKAGE = 'DelayedRandomArray', vec, dim, index)
}

sample_standard_uniform <- function(dim, chunkdim, seeds, index, stream_start = 0L) {
    .Call('_DelayedRandomArray_sample_standard_uniform', PACKAGE = 'DelayedRandomArray', dim, chunkdim, seeds, index, stream_start)
}

