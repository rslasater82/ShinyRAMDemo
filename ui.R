library(shiny)
library(shinyjs)

# Define UI for application that draws a histogram
fluidPage(
  
  # Application title
  titlePanel("DODIN RAM Shiny Example"),
  
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
                format = "yyyy-mm-dd",
                value = "2021-01-01"),
      actionButton("Save",
                   "Save Entry"),
      actionButton("Load",
                   "Load Entry"),
      actionButton("Update",
                   "Update Entry"),
      downloadButton("downloadData", "Download")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      dataTableOutput("movieTable")
    )
  )
)
