#' blastseqs2genome: BLAST a query sequence against target genome.
#' @param indir String. Specify the path of the directory in which your query sequences are stored.
#' @param genomepath String. Specifiy the path of the directory in which your blast database is stored.
#' @param outdir String. Specify the path of the directory in which the output file should be written.
#' @param blastpath String. Specify the path of the directory in which the blastn executable is.
#' @export

blastseqs2genome <- function(indir,
                             genomepath,
                             outdir,
                             blastpath){

        infilenames <- list.files(path = indir, pattern = "*.fasta")
        outnames <- paste(unlist(sapply(infilenames, strsplit, split = "*.fasta")),
                          "2genome", sep = "")

        # function to create the commands
        cmdCreate <- function(infile, outfile){
                paste(blastpath," -db ", genomepath, " -outfmt '6 qseqid sseqid pident qlen length mismatch gapopen qstart qend sstart send evalue bitscore' -evalue 1e-10 -query ", indir,infile, " -out ", outdir,outfile, sep = "")
        }

        # create the commands
        cmds <- mapply(FUN = cmdCreate, infile = infilenames, outfile = outnames)

        # run the blasts. this will obviously take a while when using the full genome
        sapply(cmds, system)

}
