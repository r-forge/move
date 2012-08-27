\name{burst}

\alias{burst}
\alias{burst,Move,character-method}
\alias{burst,Move,factor-method}
\alias{burst,Move,numeric-method}

\docType{methods}

\title{Bursting a track}

\description{Bursting a track by specified variable}

\usage{
  \S4method{burst}{Move,character}(x, f, ...)
}

\arguments{
  \item{x}{a Move object}
  \item{f}{a character, factor, or numeric that indicates how to burst the coordinates of a Move object. It must be one shorter than the number of locations, because there are always one less segments of a track than coordinates}
  \item{...}{not used}
}

\details{
The burst function bursts (divides) a track in segments that are specified by the burstIDs (e.g. behavioral annotations). 
}

\author{Marco Smolla}

\examples{
test <- move(system.file("extdata","leroy.csv", package="move"))
behav <- c(rep(1:91,each=10), rep(92, 8))
testb <- burst(x=test, f=behav)
head(testb)
}