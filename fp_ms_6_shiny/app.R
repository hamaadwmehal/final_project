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
                          
                          imageOutput("kobe_logo", width = "100%", height = "100%"),
                          br(),
                          
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
                                                     
                                                     p("I decided to 
look at NBA fines, their relation to players' salaries, and see the rate at 
which a player is fined based on a. their salary and b. the percentage that the
fine takes from their salary. I aggregates data over fines and salaries
over the past ten years. I got the fines data table from Spotrac- which tracks NBA fines, their amounts, and the reasons
for them- and have been able to look at fines data for the past two years. I 
got the data for NBA salaries from basketball-reference.com and ESPN and am 
able to look at past player salaries starting in 1999-2000 too. I ran regressions on different comparisons of variables
                                                       to best understand what factors affect fines and player behavior."),
                                                     
                                                     h4(strong("About Me")),
                                                     
                                                     p("My name is Hamaad Mehal, and I’m a rising Sophomore in Mather House 
                                                       planning to pursue some variation of the Life Sciences with a concentration
                                                       in Social Studies focused on South Asian Studies. You can reach me at 
                                                       hamaadmehal@college.harvard.edu, or check out my Github at 
                                                       https://github.com/hamaadwmehal")
                          ))),
                 
                 tabPanel("Raw Fine Data",
                          
                          tabsetPanel(
                              
                              # This is the interactive component wherein people can select a school and view enrollment history
                              
                              tabPanel("2019-2020",
                                       h2("Histographic Distribution of Fines", align = "center"),
                                       br(),
                                       imageOutput("count_fine_1", width = "100%", height = "100%")
                                       ),
                              tabPanel("2018-2019",
                                       h2("Histographic Distribution of Fines", align = "center"),
                                       br(),
                                       imageOutput("count_fine_2018", width = "100%", height = "100%")
                              
                              ))),
                 tabPanel("Raw Salary Data",
                          tabsetPanel(
                              tabPanel("2019-2020",
                                       h2("Histographic Distribution of Salaries", align = "center"),
                                       br(),
                                       imageOutput("salary_data_2020", width = "100%", height = "100%"),
                                       br(),
                                       column(3, 
                                              textInput("text", h3("Text input"), 
                                                        value = "Enter text..."))),
                              tabPanel("2018-2019",
                                       h2("Histographic Distribution of Salaries", align = "center"),
                                       br(),
                                       imageOutput("salary_data_2018", width = "100%", height = "100%"),
                                       br(),
                                       column(3, 
                                              textInput("text", h3("Text input"), 
                                                        value = "Enter text...")) )
                          )))
                          
                 
                                                    

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$kobe_logo <- renderImage({
        
        list(src = 'kobe_logo.png',
             height = 300,
             width = 300,
             style = "display: block; margin-left: auto; margin-right: auto;")},
        deleteFile = FALSE
    )
    
    output$count_fine_1 <- renderImage({
        # generate bins based on input$bins from ui.R
        list(src = "count_fine_1.png",
             contentType = 'image/png',
             width = 300,
             style = "display: block; margin-left: auto; margin-right: auto;",
             height = 300)}, deleteFile = FALSE)
    
    output$count_fine_2018 <- renderImage({
        # generate bins based on input$bins from ui.R
        list(src = "count_fine_2018.png",
             contentType = 'image/png',
             width = 300,
             style = "display: block; margin-left: auto; margin-right: auto;",
             height = 300)}, deleteFile = FALSE)
   
     output$salary_data_2020 <- renderImage({
        # generate bins based on input$bins from ui.R
        list(src = "salary_data_2020.png",
             contentType = 'image/png',
             width = 300,
             style = "display: block; margin-left: auto; margin-right: auto;",
             height = 300)}, deleteFile = FALSE)
     
     output$salary_data_2020 <- renderImage({
         # generate bins based on input$bins from ui.R
         list(src = "salary_data_2018.png",
              contentType = 'image/png',
              width = 300,
              style = "display: block; margin-left: auto; margin-right: auto;",
              height = 300)}, deleteFile = FALSE)
}



# Run the application 
shinyApp(ui = ui, server = server)

