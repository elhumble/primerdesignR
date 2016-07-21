#' run_primer3: Run primer3_core executable
#' @param input Specify the name of your primer3 input file.
#' @param primer3path Specify the path of where the primer3_core executable is stored.
#' @param indir Specify the path of the directory in which the input file is stored.
#' @param outdir Specify the path of the directory in which the output file should be written.
#' @export

run_primer3 <- function(input, primer3path, indir, outdir){
        system(paste0(primer3path," <",input,"> ",outdir,"/",input,"OUT"))
}
