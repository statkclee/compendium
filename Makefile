DATA = data
REPORT = report
TEMP = processed

all: report/make_report.html

## Get Twitter Data
$(DATA)/tw_dat.rds:
	Rscript R/get_data.R $(TOPIC) $(NUM_TWIT)

## Visualize Twitter Data
$(TEMP)/twit_trend.png: $(DATA)/tw_dat.rds
	Rscript R/graph_trend.R $(TOPIC)

$(TEMP)/user_activity.png: $(DATA)/tw_dat.rds
	Rscript R/analyze_activity.R

$(TEMP)/retweet_network.png: $(DATA)/tw_dat.rds
	Rscript R/visualize_retweets.R

$(TEMP)/bow_nlp.png: $(DATA)/tw_dat.rds
	Rscript R/visualize_nlp.R

## Make Reports	
$(REPORT)/make_report.html: $(DATA)/tw_dat.rds $(TEMP)/twit_trend.png $(TEMP)/user_activity.png $(TEMP)/retweet_network.png $(TEMP)/bow_nlp.png
	Rscript R/make_report.R

clean:
	rm -rf $(DATA)/tw_dat.rds 
	rm -rf $(TEMP)/twit_trend.png $(TEMP)/user_activity.png $(TEMP)/retweet_network.png $(TEMP)/bow_nlp.png
	rm -rf $(REPORT)/make_report.html $(REPORT)/make_report.pdf $(REPORT)/make_report.docx
	rm -rf $(REPORT)/*.tex $(REPORT)/*.log 
	

	