#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Quick Shiny Demo"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            textInput("Movie", 
                      "Movie: ", 
                      value = ""
                      ),
            textInput("Rating",
                      "Rating: ",
                      value = ""),
            textInput("Genres",
                      "Genres: ",
                      value = ""),
            dateInput("Date_R",
                      "Date Released: ",
                      format = "mm-dd-yyyy",
                      value = ""),
            actionButton("Save",
                         "Save Entry")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            dataTableOutput("movieTable")
        )
    )
)
