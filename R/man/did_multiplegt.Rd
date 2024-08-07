% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/did_multiplegt.R
\name{did_multiplegt}
\alias{did_multiplegt}
\title{Main function}
\usage{
did_multiplegt(mode, ...)
}
\arguments{
\item{mode}{("dyn", "had", "old") Estimator selector. The \code{dyn} mode calls \link[DIDmultiplegtDYN]{did_multiplegt_dyn}, the \code{had} mode calls \link[DIDHAD]{did_had} and the \code{old} mode calls \link[DIDmultiplegt]{did_multiplegt_old}.}

\item{...}{Options passed to specified estimator. For more details on allowed options, check out the command-specific documentation: \link[DIDmultiplegtDYN]{did_multiplegt_dyn}, \link[DIDHAD]{did_had}, \link[DIDmultiplegt]{did_multiplegt_old}.}
}
\description{
Library of Estimators in Difference-in-Difference (DID) designs with multiple groups and periods.
}
\section{Overview}{

\code{did_multiplegt} wraps in a single command all the estimators from de Chaisemartin and D'Haultfoeuille.  Depending on the mode argument, this command can be used to call the following estimators.

\link[DIDmultiplegtDYN]{did_multiplegt_dyn}. In \code{dyn} mode, the command computes the DID event-study estimators introduced in de Chaisemartin and D'Haultfoeuille (2024a). This mode can be used both with a binary and staggered (absorbing) treatment and a non-binary treatment (discrete or continuous) that can increase or decrease multiple times. The estimator is also robust to heterogeneous effects of the current and lagged treatments. Lastly, it can be used with data where the panel st is unblanced or more disaggregated than the group level.

\link[DIDHAD]{did_had}. In \code{had} mode, the command computes the DID estimator introduced in de Chaisemartin and D'Haultfoeuille (2024b). This mode estimates the effect of a treatment on an outcome in a heterogeneous adoption design (HAD) with no stayers but some quasi stayers.

\link[DIDmultiplegt]{did_multiplegt_old}. In \code{old} mode, the command computes the DID estimators introduced in de Chaisemartin and D'Haultfoeuille (2020). This mode corresponds to the old version of the did_multiplegt command. Specifically, it can be used to estimate \eqn{DID_M}, i.e. the average across \eqn{t} and \eqn{d} of the treatment effects of groups that have treatment \eqn{d} at \eqn{t-1} and change their treatment at \eqn{t}, using groups that have treatment \eqn{d} at \eqn{t-1} and \eqn{t} as controls. This mode could also be used to compute event-study estimates, but we strongly suggest to use the \code{dyn} mode, since it is way faster and includes comprehensive estimation and post-estimation support.
}

\section{References}{


de Chaisemartin, C and D'Haultfoeuille, X (2020). American Economic Review, vol. 110, no. 9.  \href{https://www.aeaweb.org/articles?id=10.1257/aer.20181169}{Two-Way Fixed Effects Estimators with Heterogeneous Treatment Effects}.

de Chaisemartin, C and D'Haultfoeuille, X (2024a). Review of Economics and Statistics, 1-45.  \href{https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3731856}{Difference-in-Differences Estimators of Intertemporal Treatment Effects}.

de Chaisemartin, C and D'Haultfoeuille, X (2024b).  \href{https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4284811}{Two-way Fixed Effects and Differences-in-Differences Estimators in Heterogeneous Adoption Designs}.

Vella, F. and Verbeek, M. 1998. Journal of Applied Econometrics 13(2), 163–183.  \href{https://onlinelibrary.wiley.com/doi/abs/10.1002/(SICI)1099-1255(199803/04)13:2\%3C163::AID-JAE460\%3E3.0.CO;2-Y}{Whose wages do unions raise? a dynamic model of unionism and wage rate determination for young men}.
}

\examples{
# Test all modes using Vella and Verbeek (1998) data:
data("wagepan_mgt")
wagepan_mgt$X <- runif(n=nrow(wagepan_mgt)) * (wagepan_mgt$year >= 1983)
Y = "lwage"
G = "nr"
T = "year"
D = "union"
X = "X"
did_multiplegt(mode = "old", wagepan_mgt, Y, G, T, D)
did_multiplegt(mode = "dyn", wagepan_mgt, Y, G, T, D, graph_off = TRUE)
did_multiplegt(mode = "had", wagepan_mgt, Y, G, T, X, graph_off = TRUE)
}
