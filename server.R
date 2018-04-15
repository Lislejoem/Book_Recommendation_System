library(devtools)
devtools::install_github("Appsilon/shiny.semantic")
library(shiny.semantic)
library(shiny)
library(dplyr)
library(tidyr)

shinyServer(function(input, output) {
  output$table <- DT::renderDataTable(DT::datatable({
    data <- (Book.Ratings.with.Favorite.User.Genres.Rating.Rank %>%
               merge(x=., y=select(Books, 
                                   book_id,
                                   authors,
                                   title, 
                                   Genre.1, 
                                   Genre.2, 
                                   Genre.3, 
                                   goodreads_book_id, 
                                   original_publication_year,
                                   Rating.Bucket,
                                   ratings_count,
                                   Publication.Year.Bucket,
                                   image_url), by="book_id", all.y=FALSE) %>%
               gather("Genre Number", Book.Genre, 
                      -book_id, 
                      -authors,
                      -Genre,
                      -title,
                      -Mean_Rating,
                      -count,
                      -goodreads_book_id,
                      -original_publication_year,
                      -ratings_count,
                      -Rating.Bucket,
                      -Publication.Year.Bucket,
                      -image_url) %>%
               filter(Genre == input$ILike, 
                      Book.Genre == input$IWant, 
                      Rating.Bucket %in% input$Rating.Bucket,
                      Publication.Year.Bucket %in% input$Publication.Year.Bucket) %>%
               arrange(desc(Mean_Rating)) %>%
               head(., 100) %>%
               transmute(Cover = paste('<a href="https://www.goodreads.com/book/show/', goodreads_book_id, '", target="_blank"><img src="', image_url, '"></a>', sep=""),
                         Title = paste('<a href="https://www.goodreads.com/book/show/', goodreads_book_id, '", target="_blank">', title, '</a>', sep=""),
                         "Author(s)" = authors, 
                         Rating = round(Mean_Rating, 2),
                         "Publication Year" = original_publication_year,
                         "Number of Ratings" = ratings_count) %>%
               arrange(desc(Rating))
    )
    data
  }, escape=FALSE))
  
})
