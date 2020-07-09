#Loading the rvest package
library('rvest')

#Specifying the url for desired website to be scrapped
main = "http://www.freepatentsonline.com/"
url <- "y2008/0086363.html"
next_url = NULL
n <- 1

#Reading the HTML code from the website
while(n <= 100)
{
  webpage <- read_html(paste(main, url, sep=''))
  
  #Using the CSS selector to scrap the words
  Title_data_html <- html_nodes(webpage, 'form+ .disp_doc2 .disp_elm_text')
  Title_data <- html_text(Title_data_html)
  Title_data <- gsub("\n","",Title_data)
  
  # Publication date scrapping 
  Pub_data_html <- html_nodes(webpage, '.disp_doc2:nth-child(17) .disp_elm_text')
  Pub_data <- html_text(Pub_data_html)
  Pub_data <- gsub("\n","",Pub_data)
  Pub_data <- gsub(" ","",Pub_data)
  
  # Filing Publication date scrapping 
  Filing_data_html <- html_nodes(webpage, '.disp_doc2:nth-child(18) .disp_elm_text')
  Filing_data <- html_text(Filing_data_html)
  Filing_data <- gsub("\n","",Filing_data)
  Filing_data <- gsub(" ","",Filing_data)
  
  # Abstract data scrapping
  Abs_data_html <- html_nodes(webpage, '.disp_doc2:nth-child(9) .disp_elm_text')
  Abs_data <- html_text(Abs_data_html)
  Abs_data <- gsub("\n","",Abs_data)
  
  # Application number scrapping 
  App_data_html <- html_nodes(webpage, '.disp_doc2:nth-child(16) .disp_elm_text')
  App_data <- html_text(App_data_html)
  App_data <- gsub("\n","",App_data)
  App_data <- gsub(" ","",App_data)
  
  
  technology_df <- list(Title_data,
                        Pub_data,
                        Abs_data,
                        App_data,
                        Filing_data
  )
  
  write.table(technology_df, "Ultimate.csv",append = TRUE, sep = ",", eol = "\n", 
              na = "NA",dec = ".",row.names = TRUE, col.names = FALSE, qmethod = "double")

  #Next page scrapping
  Next_page <- html_nodes(webpage, 'br~ a')
  next_url = html_attr(Next_page, "href")[1]
  url <- next_url
  n = n+1
}


