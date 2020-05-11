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
ui <- fluidPage(navbarPage("NBA Fine Data",
                 
 # Made an about page to explain my shiny app, its aims, and myself, as well as
 # the background for the project.
    
                 tabPanel("About",
                          
# Payed homage to Kobe Bryant by incorporating his logo into the Shiny.

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
                                                     
                                                     #text to explain how my project works
                                                     
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
                                                     
                                                     p("My name is Hamaad Mehal (Fayetteville, AR), and I’m a rising Sophomore in Mather House 
                                                       planning to pursue some variation of the Life Sciences with a concentration
                                                       in Social Studies focused on South Asian Studies. You can reach me at 
                                                       hamaadmehal@college.harvard.edu, or check out my Github at 
                                                       https://github.com/hamaadwmehal")
                          ))),
                 
                 tabPanel("Raw Fine Data",
                          
                          tabsetPanel(
                              
                              # This displays the bare fines data from the past couple of years to show
                              # how the trend and prevalence has been for fines.
                              
                              tabPanel("2019-2020",
                                       h2("Histographic Distribution of Fines", align = "center"),
                                       br(),
                                       imageOutput("count_fine_1", width = "100%", height = "100%"),
                                       br(),
                                       p("This graph shows the distribution of fines amongst NBA players in 
                                         the 2019-2020 season. It works to show the number of fines in the
                                         NBA that have been accumulated over this year but has fewer observations
                                         due to the fact that this season was truncated.")
                                       ),
                              tabPanel("2018-2019",
                                       h2("Histographic Distribution of Fines", align = "center"),
                                       br(),
                                       imageOutput("count_fine_2018", width = "100%", height = "100%"),
                                       br(),
                                       p("This graph shows the distribution of fines amongst NBA players in 
                                         the 2018-2019 season. It works to show the number of fines in the
                                         NBA that have been accumulated over last season. It serves to show 
                                         the regular number of fines and their distribution per season.")
                              
                              ))),

# Take the data that has been scraped from other websites in RMDs and output the
# graph in the pages. This displays many different types of graphs and tables in 
# different formats and on different statistical phenomenas. I learned how to do the
# Shiny for this by getting assistance from other classmates which I greatly appreciated.

                 tabPanel("Relationship Between Salary and Fines",
                          tabsetPanel(
                              tabPanel("Relationship Between Salary and Number of Fines",
                                       h2("Regression Plot of the Relationship Between Salary and Fines ", align = "center"),
                                       strong("Year indicates year season finished."),
                                       br(),
                                       sidebarPanel(selectInput(inputId = "scr_year",
                                                                 label = "Year:",
                                                                 choices = c("2020","2019", "2018", "2017",
                                                                             "2016", "2015"))
                                       ),
                                       mainPanel(imageOutput("scrgraph"))
                              ),
                              tabPanel("Relationship Between Salary and Amount of Fines in USD",
                                       h2("Regression Plot of the Relationship Between Salary and Player's Total Amount of Fines ", align = "center"),
                                       strong("Year indicates year season finished."),
                                       br(),
                                       sidebarPanel(selectInput(inputId = "sar_year",
                                                                 label = "Year:",
                                                                 choices = c("2020","2019", "2018", "2017",
                                                                             "2016", "2015"))
                                       ),
                                       mainPanel(imageOutput("sargraph"))
                              ))),
                 tabPanel("Relationship Between Minutes Played and Fines",
                          tabsetPanel(
                              tabPanel("Relationship Between Minutes and Number of Fines",
                                       h2("Regression Plot of the Relationship Between Minutes and Fines ", align = "center"),
                                       strong("Year indicates year season finished.
                                              Due to the lack of availability of this data
                                              for the whole NBA, this is representative of
                                              the players in the top 100 for minutes played."),
                                       br(),
                                       sidebarPanel(selectInput(inputId = "mcr_year",
                                                                label = "Year:",
                                                                choices = c("2020","2019", "2018", "2017",
                                                                            "2016", "2015"))
                                       ),
                                       mainPanel(imageOutput("mcrgraph"))
                              ),
                              tabPanel("Relationship Between Minutes and Amount of Fines in USD",
                                       h2("Regression Plot of the Relationship Between Minutes and Player's Total Amount of Fines ", align = "center"),
                                       strong("Year indicates year season finished.
                                              Due to the lack of availability of this data
                                              for the whole NBA, this is representative of
                                              the players in the top 100 for minutes played."),
                                       br(),
                                       sidebarPanel(selectInput(inputId = "mar_year",
                                                                label = "Year:",
                                                                choices = c("2020","2019", "2018", "2017",
                                                                            "2016", "2015"))
                                       ),
                                       mainPanel(imageOutput("margraph"))
                              ))),
                 tabPanel("Regression Models",
                          tabsetPanel(
                              tabPanel("Salary and Number of Fines",
                                       h2("Regression Model of the Relationship Between Salary and Fines ", align = "center"),
                                       strong("Year indicates year season finished."),
                                       br(),
                                       sidebarPanel(selectInput(inputId = "scrgt_year",
                                                                label = "Year:",
                                                                choices = c("2020","2019", "2018", "2017",
                                                                            "2016", "2015"))
                                       ),
                                       mainPanel(imageOutput("scrtable"))
                              ),
                              tabPanel("Salary and Amount of Fines in USD",
                                       h2("Regression Model of the Relationship Between Salary and Player's Total Amount of Fines ", align = "center"),
                                       strong("Year indicates year season finished."),
                                       br(),
                                       sidebarPanel(selectInput(inputId = "sargt_year",
                                                                label = "Year:",
                                                                choices = c("2020","2019", "2018", "2017",
                                                                            "2016", "2015"))
                                       ),
                                       mainPanel(imageOutput("sartable"))),
                              tabPanel("Minutes and Number of Fines",
                                       h2("Regression Model of the Relationship Between Minutes and Fines ", align = "center"),
                                       strong("Year indicates year season finished.
                                              Due to the lack of availability of this data
                                              for the whole NBA, this is representative of
                                              the players in the top 100 for minutes played."),
                                       br(),
                                       sidebarPanel(selectInput(inputId = "mcrgt_year",
                                                                label = "Year:",
                                                                choices = c("2020","2019", "2018", "2017",
                                                                            "2016", "2015"))
                                       ),
                                       mainPanel(imageOutput("mcrtable"))
                              ),
                              tabPanel("Minutes and Amount of Fines in USD",
                                       h2("Regression Model of the Relationship Between Minutes and Player's Total Amount of Fines ", align = "center"),
                                       strong("Year indicates year season finished.
                                              Due to the lack of availability of this data
                                              for the whole NBA, this is representative of
                                              the players in the top 100 for minutes played."),
                                       br(),
                                       sidebarPanel(selectInput(inputId = "margt_year",
                                                                label = "Year:",
                                                                choices = c("2020","2019", "2018", "2017",
                                                                            "2016", "2015"))
                                       ),
                                       mainPanel(imageOutput("martable"))
                              ))),
                tabPanel("Conclusion",
         
         br(),
         
         h2("Is the NBA's Current Fine System Working Equitably and Efficiently?", align = "center"),
         h4(em("What the Stats say"), align = "center"),
         br(),
         div(),
         
         
         
         br(),
         
         fluidRow(column(2), column(8,
                                    
                                    h4(strong("Yes, with Qualifications")),          
                                    
                                    #text to introduce project
                                    
                                    p("From what can be seen, it is clear that the higher-earning players
                                      tend to have higher incidences of getting fined. However, that does 
                                      not translate to them being fined a higher amount in total which indicates
                                      that changing the amount of the fines might not make a difference as there
                                      is no correlation between amount fined and salaries. Of course, this might
                                      be because the higher paid players are more high profile, so they have 
                                      higher amounts of technicals (which are $2k each) while other players have
                                      higher fine amounts with less occurrences due to different infractions
                                      (e.g. suspensions). However, the trend is the same for minutes as well. We
                                      see players with higher minute totals have higher fine incidences while there
                                      is no correlation between total amount of fines and total minutes played in 
                                      a season. Of course, the minutes data is limited as I could only sample the
                                      top 100 players with the highest minute totals. However, I would like to 
                                      expand on this by figuring out the relationship between minutes and salaries
                                      to see if one is a compounding variable or that they are highly independent. 
                                      Overall though, it does not seem like a change in NBA fine policy is needed 
                                      or would cause a positive effect as ultimately we do not see a league-wide
                                      inequitable distribution of total fine amounts for players, and there is 
                                      a lot of evidence tying fine incidences more to minutes than to salaries 
                                      which makes sense as players are more likely to commit an infraction the
                                      more they play (and the high-minute players tend to be higher-paid ones
                                      too."))))))
                          
                 
                                                    

# Define server logic required to use the graph and table images in order to 
# output them in my Shiny app.

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
             width = 700,
             style = "display: block; margin-left: auto; margin-right: auto;",
             height = 700)}, deleteFile = FALSE)
    
    output$count_fine_2018 <- renderImage({
        # generate bins based on input$bins from ui.R
        list(src = "count_fine_2018.png",
             contentType = 'image/png',
             width = 700,
             style = "display: block; margin-left: auto; margin-right: auto;",
             height = 700)}, deleteFile = FALSE)
   
    output$scrgraph <- renderImage({
        
        filename <- normalizePath(file.path('./rel_graphs',
                    paste('scr', input$scr_year, '.png', sep='')))
        filename
        list(src = filename,
            alt = paste("Image number", input$scr_year),
                    height = 700,
                    width = 700)
   }, deleteFile = FALSE)
    
    output$sargraph <- renderImage({
        
        filename <- normalizePath(file.path('./rel_graphs',
                                            paste('sar', input$sar_year, '.png', sep='')))
        filename
        list(src = filename,
             alt = paste("Image number", input$sar_year),
             height = 700,
             width = 700)
    }, deleteFile = FALSE)



    output$mcrgraph <- renderImage({
    
        filename <- normalizePath(file.path('./rel_graphs',
                                        paste('mcr', input$mcr_year, '.png', sep='')))
        filename
        list(src = filename,
         alt = paste("Image number", input$mcr_year),
         height = 700,
         width = 700)
    }, deleteFile = FALSE)

output$margraph <- renderImage({
    
    filename <- normalizePath(file.path('./rel_graphs',
                                        paste('mar', input$mar_year, '.png', sep='')))
    filename
    list(src = filename,
         alt = paste("Image number", input$mar_year),
         height = 700,
         width = 700)
}, deleteFile = FALSE)

output$scrtable <- renderImage({
    
    filename <- normalizePath(file.path('.',
                                        paste('scrgt', input$scrgt_year, '.png', sep='')))
    filename
    list(src = filename,
         alt = paste("Image number", input$scrgt_year),
         height = 200,
         width = 350)
}, deleteFile = FALSE)

output$sartable <- renderImage({
    
    filename <- normalizePath(file.path('.',
                                        paste('sargt', input$sargt_year, '.png', sep='')))
    filename
    list(src = filename,
         alt = paste("Image number", input$sargt_year),
         height = 200,
         width = 350)
}, deleteFile = FALSE)

output$mcrtable <- renderImage({
    
    filename <- normalizePath(file.path('.',
                                        paste('mcrgt', input$mcrgt_year, '.png', sep='')))
    filename
    list(src = filename,
         alt = paste("Image number", input$mcrgt_year),
         height = 200,
         width = 350,
         style = "display: block; margin-left: auto; margin-right: auto;")
}, deleteFile = FALSE)

output$martable <- renderImage({
    
    filename <- normalizePath(file.path('.',
                                        paste('margt', input$margt_year, '.png', sep='')))
    filename
    list(src = filename,
         alt = paste("Image number", input$margt_year),
         height = 200,
         width = 350,
         style = "display: block; margin-left: auto; margin-right: auto;")
}, deleteFile = FALSE)
}



# Run the application 
shinyApp(ui = ui, server = server)

