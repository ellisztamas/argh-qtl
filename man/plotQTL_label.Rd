% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotQTL_label.R
\name{plotQTL_label}
\alias{plotQTL_label}
\title{Plot a label for QTL on the left of a track.}
\usage{
plotQTL_label(
  plotQTL,
  chr,
  label,
  underlined = FALSE,
  plot_bar = FALSE,
  pos = NULL,
  min = NULL,
  max = NULL,
  bar_offset = 2,
  text_offset = 6,
  ...
)
}
\arguments{
\item{plotQTL}{A plotQTL object from plotQTL().}

\item{chr}{Chromosome.}

\item{label}{Text to plot}

\item{underlined}{Logical statement indicating whether the label should be
underlined.}

\item{plot_bar}{Logical statement indicating whether a vertical bar should be
plotted with the label.}

\item{pos}{Y-axis position for the label. If this is NULL, the midpoint of max
and min is used.}

\item{min}{Starting map position of the bar, if this is to be plotted.}

\item{max}{End map position of the bar, if this is to be plotted.}

\item{bar_offset}{Distance from the chromosome track to plot the bar.}

\item{text_offset}{Distance from the chromosome track to plot the label.}

\item{...}{Further arguments to be passed to text}
}
\description{
Plot labels for QTL or QTL regions on the left of a track in a plotQTL plot.
If map positions are supplied, a bar can be drawn to indicate the extent of a
QTL region.
}
