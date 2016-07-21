#' extract_target_location: Extract the target location of the genome as a fasta sequence.
#' @param chr Specify the scaffold, contig or chromosome in which gene is located.
#' @param start Specify the start coordinate of the sequence to be extracted.
#' @param end Specify the end coordinate of the sequence to be extracted.
#' @param outdir Specify the path of the directory in which the output file should be written.
#' @param genomepath Specifiy the path of the directory in which your blast database is stored.
#' @param bedtoolspath Specifiy the path of the directory in which the bedtools executable is stored.
#' @export

extract_target_location <- function(chr,
                                    start,
                                    end,
                                    outdir,
                                    bedtoolspath,
                                    genomepath){

        bedfile <- matrix(nrow = 1,
                          ncol = 3)
        bedfile[,1] <- chr
        bedfile[,2] <- start
        bedfile[,3] <-end

        write.table(bedfile, paste0(outdir, "target_region.bed"),
                    quote = F, col.names = F, row.names = F, sep = "\t")

        # run bed tools
        bedCmd <- paste(bedtoolspath," getfasta -fi ", genomepath, " -bed ", outdir,"target_region.bed -fo ", outdir,"target_region.fasta", sep ="")
        system(bedCmd)

}
