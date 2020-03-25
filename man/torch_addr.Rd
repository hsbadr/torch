% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gen-namespace-docs.R,
%   R/gen-namespace-examples.R
\name{torch_addr}
\alias{torch_addr}
\title{Addr}
\arguments{
\item{beta}{(Number, optional) multiplier for \code{input} (\eqn{\beta})}

\item{input}{(Tensor) matrix to be added}

\item{alpha}{(Number, optional) multiplier for \eqn{\text{vec1} \otimes \text{vec2}} (\eqn{\alpha})}

\item{vec1}{(Tensor) the first vector of the outer product}

\item{vec2}{(Tensor) the second vector of the outer product}

\item{out}{(Tensor, optional) the output tensor.}
}
\description{
Addr
}
\section{addr(beta=1, input, alpha=1, vec1, vec2, out=None) -> Tensor }{


Performs the outer-product of vectors \code{vec1} and \code{vec2}
and adds it to the matrix \code{input}.

Optional values \code{beta} and \code{alpha} are scaling factors on the
outer product between \code{vec1} and \code{vec2} and the added matrix
\code{input} respectively.

\deqn{
    \text{out} = \beta\ \text{input} + \alpha\ (\text{vec1} \otimes \text{vec2})
}
If \code{vec1} is a vector of size \code{n} and \code{vec2} is a vector
of size \code{m}, then \code{input} must be
broadcastable  with a matrix of size
\eqn{(n \times m)} and \code{out} will be a matrix of size
\eqn{(n \times m)}.

For inputs of type \code{FloatTensor} or \code{DoubleTensor}, arguments \code{beta} and
\code{alpha} must be real numbers, otherwise they should be integers
}

\examples{

vec1 = torch_arange(1., 4.)
vec2 = torch_arange(1., 3.)
M = torch_zeros(c(3, 2))
torch_addr(M, vec1, vec2)
}