% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/query.R
\name{sf_query}
\alias{sf_query}
\title{Perform SOQL Query}
\usage{
sf_query(soql, object_name, queryall = FALSE, page_size = 1000,
  api_type = c("REST", "SOAP", "Bulk 1.0"), next_records_url = NULL, ...,
  verbose = FALSE)
}
\arguments{
\item{soql}{character; a string defining a SOQL query (e.g. "SELECT Id, Name FROM Account")}

\item{object_name}{character; the name of one Salesforce objects that the 
function is operating against (e.g. "Account", "Contact", "CustomObject__c")}

\item{queryall}{logical; indicating if the query recordset should include 
deleted and archived records (available only when querying Task and Event records)}

\item{page_size}{numeric; a number between 200 and 2000 indicating the number of 
records per page that are returned. Speed benchmarks should be done to better 
understand the speed implications of choosing high or low values of this argument.}

\item{api_type}{character; one of "REST", "SOAP", or "Bulk" indicating 
which API to use when making the request}

\item{next_records_url}{character (leave as NULL); a string used internally 
by the function to paginate through to more records until complete}

\item{...}{Other arguments passed on to \code{\link{sf_query_bulk}}.}

\item{verbose}{logical; do you want informative messages?}
}
\value{
\code{tbl_df} of records
}
\description{
Executes a query against the specified object and returns data that matches 
the specified criteria.
}
\note{
Bulk API query doesn't support the following SOQL:
\itemize{
   \item COUNT
   \item ROLLUP
   \item SUM
   \item GROUP BY CUBE
   \item OFFSET
   \item Nested SOQL queries
   \item Relationship fields
   }
Additionally, Bulk API can't access or query compound address or compound geolocation fields.
}
\examples{
\dontrun{
sf_query("SELECT Id, Account.Name, Email FROM Contact LIMIT 10")
sf_query("SELECT Id, Email FROM Contact LIMIT 10", verbose = TRUE)
}
}
\references{
\url{https://developer.salesforce.com/docs/atlas.en-us.api_asynch.meta/api_asynch/}
}
