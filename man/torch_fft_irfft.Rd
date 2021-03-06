% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gen-namespace-docs.R, R/wrapers.R
\name{torch_fft_irfft}
\alias{torch_fft_irfft}
\title{Irfft}
\usage{
torch_fft_irfft(self, n = NULL, dim = -1L, norm = NULL)
}
\arguments{
\item{self}{(Tensor) the input tensor representing a half-Hermitian signal}

\item{n}{(int) Output signal length. This determines the length of the output
signal. If given, the input will either be zero-padded or trimmed to this
length before computing the real IFFT. Defaults to even output: \code{n=2*(input.size(dim) - 1)}.}

\item{dim}{(int, optional) – The dimension along which to take the one
dimensional real IFFT.}

\item{norm}{(str, optional) – Normalization mode. For the backward transform,
these correspond to:
\itemize{
\item "forward" - no normalization
\item "backward" - normalize by 1/n
\item "ortho" - normalize by 1/sqrt(n) (making the real IFFT orthonormal)
Calling the forward transform (\code{\link[=torch_fft_rfft]{torch_fft_rfft()}}) with the same normalization
mode will apply an overall normalization of 1/n between the two transforms.
This is required to make irfft() the exact inverse.
Default is "backward" (normalize by 1/n).
}}
}
\description{
Computes the inverse of \code{\link[=torch_fft_rfft]{torch_fft_rfft()}}.
Input is interpreted as a one-sided Hermitian signal in the Fourier domain,
as produced by \code{\link[=torch_fft_rfft]{torch_fft_rfft()}}. By the Hermitian property, the output will
be real-valued.
}
\note{
Some input frequencies must be real-valued to satisfy the Hermitian property.
In these cases the imaginary component will be ignored. For example, any
imaginary component in the zero-frequency term cannot be represented in a real
output and so will always be ignored.

The correct interpretation of the Hermitian input depends on the length of the
original data, as given by n. This is because each input shape could correspond
to either an odd or even length signal. By default, the signal is assumed to be
even length and odd signals will not round-trip properly. So, it is recommended
to always pass the signal length n.
}
\examples{
if (torch_is_installed()) {
t <- torch_arange(start = 0, end = 4)
x <- torch_fft_rfft(t)
torch_fft_irfft(x)
torch_fft_irfft(x, n = t$numel())

}
}
