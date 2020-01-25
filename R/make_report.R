library(tidyverse)

rmarkdown::render("report/make_report.Rmd", 
                  output_format="html_document",
                  output_file = "make_report.html",
                  encoding = 'UTF-8', 
                  output_dir = "report")

rmarkdown::render("report/make_report.Rmd", 
                  output_format="pdf_document",
                  output_options = list(latex_engine = "xelatex"),
                  output_file = "make_report.pdf",
                  encoding = 'UTF-8', 
                  output_dir = "report")

rmarkdown::render("report/make_report.Rmd", 
                  output_format="word_document",
                  output_file = "make_report.docx",
                  encoding = 'UTF-8', 
                  output_dir = "report")