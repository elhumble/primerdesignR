#' blastprimers2genome: BLAST set of primer sequences against target genome.
#' @param indir Specify the path of the directory in which your primer sequences are stored.
#' @param genomepath Specifiy the path of the directory in which your blast database is stored.
#' @param outdir Specify the path of the directory in which the output file should be written.
#' @param blastpath String. Specify the path of the directory in which the blastn executable is.
#' @export

blastprimers2genome <- function(indir,
                                genomepath,
                                outdir,
                                blastpath){

        primerfilenames <- list.files(path = indir, pattern = "*.fasta")
        outnames <- paste(unlist(sapply(primerfilenames, strsplit, split = "*.fasta")),
                          "2genome", sep = "")

        # function to create the commands
        cmdCreate <- function(infile, outfile){
                paste(blastpath," -db ", genomepath, " -outfmt '6 qseqid sseqid pident qlen length mismatch gapopen evalue bitscore' -evalue 1 -word_size 7 -query ", indir,infile, " -out ", outdir,outfile, sep = "")
        }

        # create the commands
        cmds <- mapply(FUN = cmdCreate, infile = primerfilenames, outfile = outnames)

        # run the blasts. this will obviously take a while when using the full genome
        sapply(cmds, system)

}
