library(devtools)
devtools::install_github("Appsilon/shiny.semantic")
library(shiny.semantic)
library(shiny)
library(dplyr)
library(tidyr)

shinyUI(
    semanticPage(
      title = "Book Recommender System",
      suppressDependencies("bootstrap"),
      div(class = "ui vertically padded grid container",
          div(class = "ui huge black right corner label", HTML("<a href='https://github.com/Lislejoem/Book_Recommendation_System', target='_blank'><i class='github icon'></i></a>")),
          div(class = "sixteen wide column",
              div(class = "ui center aligned blue huge header", "Lisle's Book Recommender System"),
              div(class = "ui left aligned blue segment", 
                  HTML("<h4>Instructions:</h4>
                       <ol>
                       <li> On the 'Genres' shelf, select the genre that you like most and select the genre of books that you want to see.</li>
                       <li> On the 'Filters' shelf, filter the book recommendations by the number of ratings and publication years.</li>
                       </ol>
                       <h4> Warning:</h4> As some genres are not popular, some combinations of genres will not result in any recommendations.<br>
                       <br>
                       <center><a href='https://github.com/Lislejoem/Book_Recommendation_System', target='_blank'>How it Works</a></center></p>"
                       )))
                       ),
      div(class="ui grid container",
          div(class = "five wide column",
              div(class = "ui center aligned inverted red segment", "Genres"),
              div(selectInput("ILike",
                              "Genre you enjoy:",
                              Top.User.Ratings.by.Rating.Rank.Vec.Short,
                              selected="fantasy")),
              div(selectInput("IWant",
                              "Genre you want to see:",
                              Top.User.Ratings.by.Rating.Rank.Vec.Short,
                              selected="fantasy")),
              div(class = "ui center aligned inverted green segment", "Filters"),
              div(selectInput("Rating.Bucket",
                              "Number of Ratings:",
                              multiple = TRUE,
                              choices = Rating.Buckets,
                              selected = "100k+")),
              div(selectInput("Publication.Year.Bucket",
                              "Years of Publication:",
                              multiple = TRUE,
                              choices = Publication.Year.Buckets,
                              selected = "2010 - 2017"))),
          div(class = "eleven wide column",
              DT::dataTableOutput("table"))
      ),
      div(class = "ui grid",
          div(class = "three column row",
              div(class = "column"),
              div(class = "column",
                  div(class = "ui center aligned red segment", HTML("<b>Made with <i class='heart icon'></i> by Joseph Lisle</b>")),
                  div(class = "ui nested segments",
                      div(class = "ui nested segment", HTML("<i class='linkedin in icon'></i><a href='https://www.linkedin.com/in/joelisle/', target='_blank'>LinkedIn</a>")),
                      div(class = "ui nested segment", HTML("<i class='github icon'></i><a href='https://github.com/Lislejoem', target='_blank'>Github</a>")),
                      div(class = "ui nested segment", HTML("<i class='chart pie icon'></i><a href='https://www.kaggle.com/lislejoem', target='_blank'>Kaggle</a>")))),
              div(class = "column")))
                       ))
