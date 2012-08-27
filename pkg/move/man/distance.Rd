\name{distance}

\alias{distance}
\alias{distance,.MoveTrackSingle-method}
\alias{distance,.MoveTrackStack-method}

\docType{methods}

\title{distance information from a track or track stack}

\description{This function returns a summary about distance related measurments of a track or track stack}

\usage{
  \S4method{distance}{.MoveTrackSingle}(x,values=FALSE)
  \S4method{distance}{.MoveTrackStack}(x,values=FALSE)
}

\arguments{
  \item{x}{Move or MoveStack object}
  \item{values}{if TRUE the distance values are returned, default is FALSE}
}

\author{Marco Smolla}

\examples{
load(system.file("extdata", "leroy.RData", package="move"), .GlobalEnv)

distance(data) # summary of distance measures of a Move object
distance(data2) # summary of distance measures of a MoveStack object
distance(data, values=TRUE) #distances from a Move object 
distance(data2, values=TRUE) #distances from a MoveStack object
}