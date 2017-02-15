# Script that allows caching the inverse of a square matrix.
#
# This would be particularly useful if the inverse needs to be repeatedly
# computed during iteration.


makeCacheMatrix <- function(x=matrix()) {
  # Creates a matrix object that has attributes:
  #
  # set
  #     Set value of the matrix
  # get
  #     Get value of the matrix
  # getinv
  #     Get inverse of the matrix, returns a cached result if it has
  #     already been evaluated
  # setinv
  #     Set the inverse of the matrix

  inverse <- NULL
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  getinv <- function() inverse
  get <- function() x
  setinv <- function(inv) inverse <<- inv
  list(set=set, get=get,
       getinv=getinv, setinv=setinv)
}


cacheSolve <- function(x) {
  # Expects `x` to be a `cacheMatrix` object.
  #
  # Computes the inverse of `x` if the result is not cached,
  # otherwise it returns a cached result.
  inverse <- x$getinv()
  if (!is.null(inverse)) {
    message('getting cached data')
    return(inverse)
  }
  data <- x$get()
  inverse <- solve(data)
  x$setinv(inverse)
  inverse
}
