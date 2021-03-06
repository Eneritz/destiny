% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gene-relevance-plotting.r
\docType{methods}
\name{Gene Relevance plotting}
\alias{Gene Relevance plotting}
\alias{plot.GeneRelevance}
\alias{plot,GeneRelevance,character-method}
\alias{plot,GeneRelevance,numeric-method}
\alias{plot,GeneRelevance,missing-method}
\alias{plot_gradient_map}
\alias{plot_gradient_map,matrix,matrix-method}
\alias{plot_gradient_map,DiffusionMap,missing-method}
\alias{plot_gradient_map,GeneRelevance,missing-method}
\alias{plot_gene_relevance}
\alias{plot_gene_relevance,matrix,matrix-method}
\alias{plot_gene_relevance,DiffusionMap,missing-method}
\alias{plot_gene_relevance,GeneRelevance,missing-method}
\title{Plot gene relevance or gradient map}
\usage{
\S4method{plot}{GeneRelevance,character}(x, y, ...)

\S4method{plot}{GeneRelevance,numeric}(x, y, ...)

\S4method{plot}{GeneRelevance,missing}(x, y, ...)

plot_gradient_map(coords, exprs, ..., gene, pal = cube_helix)

\S4method{plot_gradient_map}{matrix,matrix}(coords, exprs, ..., gene,
  pal = cube_helix)

\S4method{plot_gradient_map}{DiffusionMap,missing}(coords, exprs, ..., gene,
  pal = cube_helix)

\S4method{plot_gradient_map}{GeneRelevance,missing}(coords, exprs, ..., gene,
  pal = cube_helix)

plot_gene_relevance(coords, exprs, ..., iter_smooth = 2L, genes = 5L,
  pal = palette())

\S4method{plot_gene_relevance}{matrix,matrix}(coords, exprs, ...,
  iter_smooth = 2L, genes = 5L, pal = palette())

\S4method{plot_gene_relevance}{DiffusionMap,missing}(coords, exprs, ...,
  iter_smooth = 2L, genes = 5L, pal = palette())

\S4method{plot_gene_relevance}{GeneRelevance,missing}(coords, exprs, ...,
  iter_smooth = 2L, genes = 5L, pal = palette())
}
\arguments{
\item{x}{\code{\link{GeneRelevance}} object.}

\item{y, gene}{Gene name or index to create gradient map for. (a number or string)}

\item{...}{Passed to \code{plot_gradient_map}/\code{plot_gene_relevance}}

\item{coords}{A \code{\link{DiffusionMap}}/\code{\link{GeneRelevance}} object or a cells \eqn{\times} dims \code{\link{matrix}}.}

\item{exprs}{An cells \eqn{\times} genes \code{\link{matrix}}. Only provide if \code{coords} is a matrix.}

\item{pal}{Palette. Either A colormap function or a list of colors.}

\item{iter_smooth}{Number of label smoothing iterations to perform on relevance map.
The higher the more homogenous and the less local structure.}

\item{genes}{Genes to based relevance map on or number of genes to use. (vector of strings or one number)
You can also pass an index into the gene names. (vector of numbers or logicals with length > 1)}
}
\value{
ggplot2 plot, when plotting a relevance map with a list member $ids containing the IDs used.
}
\description{
\code{plot(gene_relevance, 'Gene')} plots the gradient map of this gene,
\code{plot(gene_relevance)} a relevance map of a selection of genes.
Alternatively, you can use \code{plot_gradient_map} or \code{plot_gene_relevance} on a \code{\link{GeneRelevance}} or \code{\link{DiffusionMap}} object, or with two matrices.
}
\examples{
data(guo_norm)
dm <- DiffusionMap(guo_norm)
gr <- gene_relevance(dm)
plot(gr)          # or plot_gene_relevance(dm)
plot(gr, 'Fgf4')  # or plot_gradient_map(dm, 'Fgf4')

guo_norm_mat <- t(Biobase::exprs(guo_norm))
pca <- prcomp(guo_norm_mat)$x
plot_gene_relevance(pca, guo_norm_mat)
plot_gradient_map(pca, guo_norm_mat, gene = 'Fgf4')

}
