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
ui <- navbarPage("NBA Fine Data",
                 
                 
    
                 tabPanel("About",
                          
                          
                          h2("Is the NBA's Current Fine System Working Equitably and Efficiently?", align = "center"),
                          h4(em("Analyzing the Effects of Fines on Different Players By Salaries"), align = "center"),
                          br(),
                          div(),
                          
                          
                          
                          br(),
                          
                          fluidRow(column(2), column(8,
                                                     
                                                     h4(strong("About this Project")),          
                                                     
                                                     #text to introduce project
                                                     
                                                     p("My project analyzes whether the NBA's current fine system is achieving its aims of changing
                                                        players' behaviors in a manner that is efficient and equitable to all players. Recognizing
                                                       that not all players make the same amount in a year, I realized that fixed fines would have 
                                                       different effects on different players and hurts them disproportionately (based on salary).
                                                       However, smaller fines on technical fouls, which are very subjective and not always just,
                                                       account for many of the fines, and those should obviously remain a negligible. But there are still
                                                       some questions as an NBA fan that I wanted answered. What's the correlation between salary 
                                                       and fines? Is the correlation more relevant when working with minutes instead? Do players have
                                                       behavior changes and increase in fines when they receive new contracts/salary increases? These
                                                       are all different questions I tried to answer one way or another through statistics and visuals
                                                       on the topic."),
                                                     
                                                     br(),
                                                     
                                                     #text to explain how I selected the accounts to analyze and how I coded for gender
                                                     
                                                     h4(strong("How this project works")),
                                                     
                                                     
                                                     
                                                     p("I chose to analyze Division I NCAA Twitter accounts that included both Men's and Women's 
                                            coverage as some sports have separate Twitters for the men and women divisions. I chose 
                                            these five sports and their Twitter accounts: Ice Hockey (@NCAAIceHockey), Track and Field
                                            (@NCAATrackField), Lacrosse (@NCAALAX), Soccer (@NCAASoccer), and the general NCAA account 
                                            (@NCAA). Most sports are covered by the general NCAA account."),
                                                     
                                                     span(),
                                                     
                                                     p("I decided to 
look at NBA fines, their relation to players' salaries, and see the rate at 
which a player is fined based on a. their salary and b. the percentage that the
fine takes from their salary. I aggregates data over fines and salaries
over the past ten years. I got the fines data table from Spotrac- which tracks NBA fines, their amounts, and the reasons
for them- and have been able to look at fines data for the past two years. I 
got the data for NBA salaries from basketball-reference.com and ESPN and am 
able to look at past player salaries starting in 1999-2000 too. I ran regressions on different comparisons of variables
                                                       to best understand what factors affect fines and player behavior.")
                          ))))


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

