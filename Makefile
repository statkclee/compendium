DATA = data
REPORT = report
TEMP = processed

all: report/make_report.html

$(DATA)/tw_dat.rds:
	Rscript R/get_data.R $(TOPIC) $(NUM_TWIT)

$(TEMP)/twit_trend.png: $(DATA)/tw_dat.rds
	Rscript R/graph_trend.R $(TOPIC)

$(REPORT)/make_report.html: $(DATA)/tw_dat.rds $(TEMP)/twit_trend.png
	Rscript R/make_report.R

clean:
	rm -rf $(DATA)/tw_dat.rds 
	rm -rf $(TEMP)/twit_trend.png 
	rm -rf $(REPORT)/make_report.html $(REPORT)/make_report.pdf $(REPORT)/make_report.docx
	rm -rf $(REPORT)/*.tex $(REPORT)/*.log 
	

	