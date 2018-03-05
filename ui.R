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
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Old Faithful Geyser Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      radioButtons('in_file',label = 'Select Source',c(iris='iris',mpg='mpg',upload='upload'),selected = NA),
      conditionalPanel('input.in_file == "upload"',fileInput('in.df','upload csv',multiple = T)),
      uiOutput('x_y_selector'),
      checkboxInput('in_layer1','Add a layer'),
      uiOutput('layer')
      # lapply(2:5,function(x)conditionalPanel(paste0('input.in_layer',x),
      #                                        tagList(
      #                                          uiOutput("moreControls"),
      #                                          checkboxInput(paste0('in_layer',x+1),'Add another layer')
      #                                          )
      #                                        )
             # )
    ),
    
    mainPanel(
       plotOutput("distPlot")
    )
  )
))





