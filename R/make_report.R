library(tidyverse)
library(rmarkdown)

rmarkdown::render("report/make_report.Rmd", 
                  output_format="html_document",
                  output_file = "make_report.html",
                  encoding = 'UTF-8', 
                  output_dir = "report")

rmarkdown::render("report/make_report.Rmd",
                  output_format = pdf_document(toc=TRUE, latex_engine = 'xelatex',
                                 pandoc_args = c("--variable", "mainfont=NanumGothic")),
                  output_file = "make_report.pdf",
                  encoding = 'UTF-8',
                  output_dir = "report")

rmarkdown::render("report/make_report.Rmd",
                  output_format="word_document",
                  output_file = "make_report.docx",
                  encoding = 'UTF-8',
                  output_dir = "report")