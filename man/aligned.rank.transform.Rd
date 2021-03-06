% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/aligned-rank-transform.R
\name{aligned.rank.transform}
\alias{aligned.rank.transform}
\title{Aligned Rank Transform procedure}
\usage{
aligned.rank.transform(formula, data, perform.aov = TRUE, SS.type = c("III",
  "II", "I"), ...)
}
\arguments{
\item{formula}{A formula indicating the model to be fitted.}

\item{data}{A data frame containing the input data. The name of the columns should match the names used in
the user-specified \code{formula} of the model that will be fitted.}

\item{perform.aov}{Optional: whether separate ANOVAs should be run on the Ranked aligned responses or not.
In case it should not, only the ranked aligned responses will be returned. Defaults to \code{TRUE}.}

\item{SS.type}{A string indicating the type of sums of squares to be used in the ANOVA on the aligned responses.
    Must be one of "I", "II", "III". If \code{perform.aov} was set to \code{FALSE}, the value of \code{SS.type} will be ignored.
    Please note SS types coincide when the design is balanced (equal number of observations per cell) but differ otherwise.
Refer to Shaw and Mitchell-Olds (1993) or Fox (1997) for further reading and recomentations on how to conduct ANOVA analyses with unbalanced designs.}

\item{...}{Other arguments passed to \link{lm} when computing effect estimates via ordinary least squares for the alignment.}
}
\value{
A tagged list with the following elements:
	\itemize{
		\item \code{$aligned}: a data frame with the input data and additional columns to the right, containing the aligned
		and the ranked aligned responses for each model effect.
		\item \code{$significance}: (only when \code{perform.aov = TRUE}) the ANOVA table that collects every unique meaningful row of
		each of the separate ANOVA tables obtained from the ranked aligned responses.
}
}
\description{
Aligned Rank Transform for Nonparametric Factorial Analysis
}
\details{
The function computes a separate aligned response variable for each effect of an user-specified model,
transform it into a ranking, and applies a separate ANOVA to every resulting ranked aligned response to
check the significance of the corresponding effect.
}
\examples{
# Input data contained in the Higgins1990-Table1.csv file distributed with ARTool
	# The data were used in the 1990 paper cited in the References section
	data(higgins1990, package = "ART");
# Two-factor full factorial model that will be fitted to the data
art.results = aligned.rank.transform(Response ~ Row * Column, data = data.higgins1990);
print(art.results$aligned, digits = 4);
print(art.results$significance);
}
\author{
Pablo J. Villacorta Iglesias
}
\references{
Higgins, J. J., Blair, R. C. and Tashtoush, S. (1990). The aligned rank transform procedure. Proceedings of the Conference on Applied Statistics in Agriculture.
	Manhattan, Kansas: Kansas State University, pp. 185-195.

Higgins, J. J. and Tashtoush, S. (1994). An aligned rank transform test for interaction. Nonlinear World 1 (2), pp. 201-211.

Mansouri, H. (1999). Aligned rank transform tests in linear models. Journal of Statistical Planning and Inference 79, pp. 141 - 155.

Wobbrock, J.O., Findlater, L., Gergle, D. and Higgins, J.J. (2011). The Aligned Rank Transform for nonparametric factorial analyses using only ANOVA procedures.
	Proceedings of the ACM Conference on Human Factors in Computing Systems (CHI '11). New York: ACM Press, pp. 143-146.

Higgins, J.J. (2003). Introduction to Modern Nonparametric Statistics. Cengage Learning.

Shaw, R.G. and Mitchell-Olds, T. (1993). Anova for Unbalanced Data: An Overview. Ecology 74, 6, pp. 1638 - 1645.

Fox, J. (1997). Applied Regression Analysis, Linear Models, and Related Methods. SAGE Publications.

ARTool R package, for full models only. \url{http://cran.r-project.org/package=ARTool}
}
\seealso{
\link{lm}
}

