##############################################################################################
#' @title Definition function: Apply polynomial conversion  

#' @author 
#' Cove Sturtevant \email{eddy4R.info@gmail.com}

#' @description Function definition. Apply a polynomial equation to data given the polynomial coefficients.

#' @param data Required. A vector or matrix of type numeric, containing the data to be converted
#' @param coefPoly Optional. A vector of type numeric, containing the polynomial 
#' coefficients (in increasing order) to apply to \code{data}. 
#' This is a numerical vector of [a0 a1 a2 a3 ...] signifying the 
#' coeficients of the equation a0 + a1*x + a2*x^2 + a3*x^3 ... , where x is the input data.
#' Default is c(0,1).
#' \cr
#' @param MethGc is set to \code{TRUE} (default), to run garbage collection function.
#'  
#' @return A vector or matrix, matching the format of \code{data} containing the data with 
#' polynomial conversion applied. 
#' 
#' @references 
#' License: GNU AFFERO GENERAL PUBLIC LICENSE Version 3, 19 November 2007

#' @keywords polynomial equation, conversion

#' @examples Currently none

#' @seealso Currently none

#' @export
#' 
# changelog and author contributions / copyrights
#   Cove Sturtevant (2016-04-25)
#     original creation 
#   Cove Sturtevant (2016-04-29)
#     update all function calls to use double-colon operator
#   Cove Sturtevant (2016-08-11)
#     optimize memory usage
#   Natchaya P-Durden (2016-11-26)
#     rename to def.conv.poly()
#   Natchaya P-Durden (2017-09-20)
#     added MethGc in parameter
#   Natchaya P-Durden (2018-04-03)
#     update @param format
##############################################################################################
def.conv.poly <- function(data,coefPoly=c(0,1), MethGc=TRUE) {
  
  if(is.null(coefPoly)){
    stop("Input coefPoly cannot be NULL",call. = FALSE)
  }
  
  func <- polynom::polynomial(coef=coefPoly) # Create polynomial function from coefficients
  data <- stats::predict(object=func,newdata = data) # Convert data using polynomial function
  if (MethGc == TRUE) {base::gc(verbose=FALSE)}
  
  return(data)
  
}
