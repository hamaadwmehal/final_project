#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
    
    # Application title
    titlePanel("NBA Fine Data"),
    
    
    mainPanel(
        plotOutput("distPlot")
    )
)


# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$distPlot <- renderImage({
        # generate bins based on input$bins from ui.R
        list(src = "count_fine_2.png",
             contentType = 'image/png',
             width = 800,
             height = 800)}, deleteFile = FALSE)
}



# Run the application 
shinyApp(ui = ui, server = server)

