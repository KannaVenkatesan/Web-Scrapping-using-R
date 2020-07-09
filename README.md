# Web-Scrapping-using-R
Installing all required packages
Run the following lines first in R console to install required packages:

for (pkg in c("rvest","httr","dplyr","stringr","XML","RCurl","ggplot2","reshape","tm","ggmap")){
 if (!pkg %in% rownames(installed.packages())){install.packages(pkg)}
}
Checking out this repository
Then, in RStudio,

##Tutorials
EPS trend difference by industry from Yahoo Finance (yahoo-finance.rmd) by @jasminehao
Basic principles of web scraping by URL patterns and HTML parsers.

Real-time data mining from Yahoo Finance (yahoo-realtime.rmd) by @jasminehao
Web scraping for data that are chaging real-time.

Economic literature analysis from AER abstracts (aer-articles.rmd) by @chiyahn
HTML/CSS analysis using SelectorGadget and developer tools for rvest & principles of basic text analysis with beautiful wordclouds.

Cross-industry firm location differences from SEC website (sec-location.rmd) by @chiyahn and @jasminehao
Web scraping from query-based webpages and geocoding.

##Resources
Relevant R packages and developer tools:

rvest (HTML parsing): https://github.com/hadley/rvest
tm (text mining and analysis): http://tm.r-forge.r-project.org/
SelectorGadget (HTML/CSS analysis): https://selectorgadget.com/

##Useful R packages for data cleaning:

PSID: https://github.com/floswald/psidR
The World Wealth and Income Database: https://github.com/WIDworld/wid-r-tool
The Survey of Professional Forecasters: https://github.com/joergrieger/Survey
