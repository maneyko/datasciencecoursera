==============
Course 1 Notes
==============
The Data Scientist's Toolbox

Installing R Packages
---------------------

.. code:: R

  a <- available.packages()
  packages <- c('slidify', 'ggplot2', 'devtools')
  install.packages('slidify')
  install.packages(packages)
  source('http://bioconductor.org/biocLite.R')
  biocLite()
  library(ggplot2)
  search()


* Rtools -- Windows build tools
* Correlation is not causation
* Inferential analysis -- most common goal of statistics

  - Subset of population to make a generalization

* Predictive analytics -- :math:`X` predicts :math:`y` does not mean :math:`X`
  causes :math:`y`
* Causal models are the "gold standard" for data analysis
* Mechanistic analysis -- exact changes in variables lead to changes in other
  variables
* Most important thing in data science is the *question*
* Formulate your question in advance
* Confounding -- babies have small shoe size and also are not literate
