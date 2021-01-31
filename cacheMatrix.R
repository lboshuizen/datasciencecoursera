
# Helper to wrap a matrix in a cache structure
#
makeCacheMatrix <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setCache <- function(cache) m <<- cache
  getCached <- function() m
  list(set = set, get = get,
       setCache = setCache,
       getCached = getCached)
}

# Computes the inverse of a wrapped Matrix.
# First invocation will compute the inverse and store the result
# Subsequent calls will skip computation and return the result from 
# the stored/previous computation
# 
# usage example: 
#   M <- matrix(...)
#   M_wrapped <- makeCacheMatrix(M)
#   M_inv <- cacheSolve(M_wrapped)
#
cacheSolve <- function(x, ...) {
  m <- x$getCached()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setCache(m)
  m
}
