% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/coercion.r
\docType{methods}
\name{as_date}
\alias{as_date}
\alias{as_date,POSIXt-method}
\alias{as_date,numeric-method}
\title{Convert an object to a Date}
\usage{
as_date(x, ...)

\S4method{as_date}{POSIXt}(x, tz = NULL)

\S4method{as_date}{numeric}(x, origin = lubridate::origin)
}
\arguments{
\item{x}{a vector of \code{\link{POSIXt}}, numeric or character objects}

\item{...}{further arguments to be passed to specific methods (see above).}

\item{tz}{a time zone name (default: time zone of the POSIXt object
\code{x}). See \code{\link{olson_time_zones}}.}

\item{origin}{a Date object, or something which can be coerced by
\code{as.Date(origin, ...)} to such an object (default: the Unix epoch of
"1970-01-01"). Note that in this instance, \code{x} is assumed to reflect
the number of days since \code{origin} at \code{"UTC"}.}
}
\value{
a vector of \code{\link{Date}} objects corresponding to \code{x}.
}
\description{
A drop in replacement for base \code{as.Date} with two two
differences. First, it ignores timezone attribute resulting in a more
intuitive conversion (see examples). Second, it does not require origin
argument which defaults to 1970-01-01.
}
\examples{
dt_utc <- ymd_hms("2010-08-03 00:50:50")
dt_europe <- ymd_hms("2010-08-03 00:50:50", tz="Europe/London")
c(as_date(dt_utc), as.Date(dt_utc))
## [1] "2010-08-03" "2010-08-03"
c(as_date(dt_europe), as.Date(dt_europe))
## [1] "2010-08-03" "2010-08-02"
## need not suply origin
as_date(10)
## [1] "1970-01-11"
}

