all: report/make_report.html

data/tw_dat.rds:
	Rscript R/get_data.R tidyverse 100

processed/twit_trend.png: data/tw_dat.rds
	Rscript R/graph_trend.R

report/make_report.html:
	Rscript R/make_report.R

clean:
	rm -rf data/tw_dat.rds processed/twit_trend.png report/make_report.html

	