#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
# Define server logic required to draw a histogram
function(input, output, session) {
#data <- read_csv("movies.csv")

#updated_data <- eventReactive(input$Save,{
#  newrecord <- c(input$Movie,input$Rating,input$Genres, input$Date_R)
#  data <- rbind(data, newrecord)
#  })

#Pull in existing data
rv <- reactiveValues(data = read_csv("movies.csv"))

observeEvent(input$Save,{
    newrecord <- c(input$Movie,input$Rating,input$Genres, input$Date_R)
    rv$data <- rbind(rv$data, newrecord)
    })

output$movieTable <- renderDataTable(rv$data)
}
