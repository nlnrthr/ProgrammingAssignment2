## Put comments here that give an overall description of what your
## functions do

## creates a special vector - 
## a list containing a function to set and get a matrix, and set and get mean

makeCacheMatrix <- function(x = matrix()) {
m = NULL
set = function(y) {
  x <<- y
  m <<- NULL
}
get = function() x
setinv = function(solve) m <<- solve
getinv = function() m
list(set = set, get = get, 
     setinv = setinv, 
     getinv = getinv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    mtx = x$getinv()
    if(!is.null(mtx)) {
      message("getting cached data")
      return(mtx)
    }
    data = x$get()
    mtx = solve(data, ...)
    x$setinv(mtx)
    return(mtx)
}


