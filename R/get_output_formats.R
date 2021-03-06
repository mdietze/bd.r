#' Get input format.
#'
#' Check Brown Dog Service for available output formats for the given input format.
#' @param url: The URL to the Brown Dog server to use.
#' @param input: The format of the input file.
#' @param token: Brown Dog access token
#' @return: A string array of reachable output format extensions.
#' @export
get_output_formats = function(url, inputformat, token){
  library(RCurl)
  api_call    <- paste0(url, "/dap/inputs/", inputformat)
  httpheader  <- c("Accept" = "text/plain", "Authorization" = token)
  r   <- httpGET(url = api_call, httpheader = httpheader)
  arr <- strsplit(r,"\n")
  if(length(arr[[1]]) == 0){
    return(list())
  } else{
    return(arr)
  }
}
