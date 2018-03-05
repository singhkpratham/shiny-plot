#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
data(iris)

layer_ui = function(x,in_x,in_y){
  list(selectInput('x','x axis',names(iris),selected = in_x),
       selectInput('x','y axis',names(iris),selected = in_y),
       checkboxInput(paste0('in_layer',x+1),'Add layer'))
}

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  df = reactive(
    {iris
      })
  
  output$x_y_selector = renderUI({
    tagList(
      selectInput('def_x',"X Axis",names(df())),
      selectInput('def_y',"Y Axis",names(df()))
    )
  })
  
  output$layer = renderUI({
    
      lapply(1:10,function(x){
        conditionalPanel(paste0('input.in_layer',x),
                         layer_ui(x,input$def_x,input$def_y)
                         
        )
        }
        )
      
  })
})



