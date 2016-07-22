#' run_primer3: Run primer3_core executable
#' @param indir Specify the path of the directory in which the input file is stored.
#' @param input Specify the name of your primer3 input file.
#' @param primer3_corepath Specify the path of where the primer3_core executable is stored.
#' @param outdir Specify the path of the directory in which the output file should be written.
#' @export

run_primer3 <- function(indir, input, primer3_corepath, outdir){
        system(paste0(primer3_corepath," <",indir,input,"> ",outdir,input,"_OUT"))
}
