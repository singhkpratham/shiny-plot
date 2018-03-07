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
df = data.frame(a=character(1),b='',c='',stringsAsFactors = F)
shinyServer(function(input, output) {
  id = numeric(0)
  val = reactiveValues(df=df)
  observeEvent(input$action,{
    a = length(id) + 1
    insertUI('#placeholder',
             ui = tags$div(
               id = paste0('placeholder',a),
               textInput('txt','',a),
               selectInput('a','b','c'),
               checkboxInput('b','aad'),
               actionButton( 'layact','Submit')
             ))
  })
  observeEvent(eval(parse(text="input[['layact']]")),{
    val$df <<- rbind(val$df,data.frame(a=input$txt,b=input$a,c=input$b,stringsAsFactors = F))
    cat(dim(val$df),"\n")
  })
  output$ui = renderUI({
    tags$div(id='')
    lapply(1:nrow(val$df),function(x){
      tags$div(id='',
      selectInput('a',x,1:x)
      )})
    
  })
  
  output$del = renderUI({
    tagList(
    selectInput('del_lay','Delete this layer',1:nrow(val$df)),
    actionButton('delete_action','DELETE!')
    )
  })
  
  observeEvent(input$delete_action,
               {cat(class(input$del_lay))
                 val$df = val$df[-as.numeric(input$del_lay),]
                 })
  
})



