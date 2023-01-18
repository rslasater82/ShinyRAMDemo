library(shiny)
library(shinyjs)
library(tidyverse)
# Define server logic required to draw a histogram
function(input, output, session) {

#Pull in existing data
rv <- reactiveValues(data = read_csv("movies.csv", col_types = cols(DateReleased = col_datetime(format = "%m/%d/%Y"))))

observeEvent(input$Save,{
    newrecord <- tibble(Movie = input$Movie,
                        Rating = input$Rating,
                        Genre = input$Genres, 
                        DateReleased = input$Date_R)
    rv$data <- rows_insert(rv$data,newrecord)
    })

observeEvent(input$Load,{

  Row <- subset(rv$data, Movie == input$Movie)
  updateTextInput(session, "Rating", value = Row$Rating)
  updateTextInput(session, "Genres", value = Row$Genre)
  updateDateInput(session, "Date_R", value = Row$DateReleased)
})

observeEvent(input$Update,{
  updatedrecord <- tibble(Movie = input$Movie,
                      Rating = input$Rating,
                      Genre = input$Genres, 
                      DateReleased = input$Date_R)
  rv$data <- rows_update(rv$data,updatedrecord)
})

output$movieTable <- renderDataTable(rv$data)

output$downloadData <- downloadHandler(
  filename = function() {
    paste0('Movies_', Sys.Date(), ".csv")
  },
  content = function(file) {
    write.csv(rv$data, file, row.names = FALSE)
  }
)
}

