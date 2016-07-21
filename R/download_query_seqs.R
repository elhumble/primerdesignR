#' download_query_seqs: Download query sequences from GenBank
#' @param accessions Specify the GenBank accession number or numbers you would like to download.
#' @param output Specify the path and name of the output file (fasta format)
#' @import ape
#' @export

download_query_seqs <- function(accessions,
                                output){
        seqs <- read.GenBank(accessions, species.names=T)
        names_sp <- data.frame(species = attr(seqs,"species"),
                               accs = names(seqs))
        names(seqs) <- attr(seqs, "species")
        write.dna(seqs, file = output, format="fasta", colsep = "")
}
