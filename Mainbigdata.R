#Loading the rvest package
library('rvest')

#Specifying the url for desired website to be scrapped
main = "http://www.freepatentsonline.com/"
url <- "result.html?sort=relevance&srch=top&query_txt=big+data&submit=&patents=on"
next_url = NULL
n <- 1

#Reading the HTML code from the website
while(n <= 1)
{
  webpage <- read_html(paste(main, url, sep=''))
  
  
  patent_data_html <- html_nodes(webpage, '#results td:nth-child(1)')
  patent_data <- html_text(patent_data_html[-1])
  patent_data <- as.numeric(patent_data)
  
  Document_data_html <- html_nodes(webpage, '.listing_table td:nth-child(2)')
  Document_data <- html_text(Document_data_html)
  Document_data <- gsub("\n","",Document_data)
  Document_data <- gsub(" ","",Document_data)
  
  # Doc title 
  Description_data_html <- html_nodes(webpage, '.listing_table tr :nth-child(3)')
  Description_data <- html_text(Description_data_html[-1])
  Description_data<-gsub("\n","",Description_data)
  
  # Using css to scrap Score 
  score_data_html <- html_nodes(webpage, 'td:nth-child(4)')
  score_data <- html_text(score_data_html)
  score_data <- as.numeric(score_data)
 
  k <- 2
  while(k <= 51)
  {
    Next_page_2 <- html_nodes(webpage, 'td > a:last-of-type')
    next_url_2 = html_attr(Next_page_2, "href")[k]
    uk<- next_url_2
    print(uk)
    
    webpage_2 <- read_html(paste(main, uk, sep=''))
    
    #Using the CSS selector to scrap the words
    Title_data_html <- html_nodes(webpage_2, 'form+ .disp_doc2 .disp_elm_text')
    Title_data <- html_text(Title_data_html)
    Title_data <- gsub("\n","",Title_data)
    
    # Publication date scrapping 
    Pub_data_html <- html_nodes(webpage_2, '.disp_doc2:nth-child(17) .disp_elm_text')
    Pub_data <- html_text(Pub_data_html)
    Pub_data <- gsub("\n","",Pub_data)
    Pub_data <- gsub(" ","",Pub_data)
    
    # Filing Filing date scrapping 
    Filing_data_html <- html_nodes(webpage_2, '.disp_doc2:nth-child(18) .disp_elm_text')
    Filing_data <- html_text(Filing_data_html)
    Filing_data <- gsub("\n","",Filing_data)
    Filing_data <- gsub(" ","",Filing_data)
    
    # Abstract data scrapping
    Abs_data_html <- html_nodes(webpage_2, '.disp_doc2:nth-child(9) .disp_elm_text')
    Abs_data <- html_text(Abs_data_html)
    Abs_data <- gsub("\n","",Abs_data)
    
    lift <- list(Title_data,
                 Pub_data,
                 Filing_data,
                 Abs_data)
    
    

    tryCatch({
      write.table(lift, "bigdata.csv",append = TRUE, sep = ",", eol = "\n", 
                  na = "NA",dec = ".",row.names = FALSE, col.names = FALSE, qmethod = "double")
      print(k)
    }, error = function(e) {
      print('missed document no, ')
      print(k)
    }
    )
    
    
    k = k+1
  }
  
  technology_df <- list(patent_data,
                        Document_data,
                        Description_data,
                         score_data
   )
  
  write.table(technology_df, "Main2.csv",append = TRUE, sep = ",", eol = "\n", 
              na = "NA",dec = ".",row.names = TRUE, col.names = FALSE, qmethod = "double")
  
  #Using the CSS selector to scrap the words
  Next_page <- html_nodes(webpage, 'td > a:last-of-type')
  next_url = html_attr(Next_page, "href")[1]
  url <- next_url
  n = n+1
}
