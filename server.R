#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  df = reactive(
    {iris
      })
  
  output$x_y = renderUI({
    selectInput('q','qq','qqq')
    # list(selectInput('x','X Axis',names(df())),
    #      selectInput('y','Y Axis',names(df())))
  })
  
  output$moreControls <- renderUI({
    tagList(
      sliderInput("n", "N", 1, 1000, 500),
      textInput("label", "Label")
    )
  })
})
