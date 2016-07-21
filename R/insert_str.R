#' split_str_by_index
#' @param target string to edit
#' @param index location to edit
#' @export

split_str_by_index <- function(target, index){
        index <- sort(index)
        substr(rep(target, length(index) + 1),
               start = c(1, index),
               stop = c(index -1, nchar(target)))
}

#' interleave
#' @param v1 split string
#' @param v2 character to insert
#' @export

interleave <- function(v1,v2){
        ord1 <- 2*(1:length(v1))-1
        ord2 <- 2*(1:length(v2))
        c(v1,v2)[order(c(ord1,ord2))]
}

#' insert_str: Insert characters into string at given index
#' https://goo.gl/tnCyQ9 & http://goo.gl/fPNaJO
#' @param target string to be edited
#' @param insert character to insert
#' @param index location to insert
#' @export

insert_str <- function(target, insert, index){
        insert <- insert[order(index)]
        index <- sort(index)
        paste(interleave(split_str_by_index(target, index), insert), collapse="")
}
