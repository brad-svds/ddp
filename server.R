library(shiny)

# Load data processing file
source("prep_functions.R")

# Shiny server
shinyServer(
  function(input, output) {
   
    output$setid <- renderText({input$setid})
    
    # Initialize reactive values
    values <- reactiveValues()
    
##Chart #1
    dataTableByCohort <- reactive({
      groupByCohort(data, input$timeline[1], 
                     input$timeline[2], input$boroughs)
    })
    
    output$CohortByYear <- renderChart({
      plotCohortByYear(dataTableByCohort())
    })
    
#Chart #2  
    ELLTableByYear <- reactive({
      ELLgroupByYear(data, input$timeline[1], 
                     input$timeline[2], input$ELL, input$boroughs)
    })
    
    output$ELLByYear <- renderChart({
      plotELLByYear(ELLTableByYear())
    })

 #Chart #3  
    EDTableByYear <- reactive({
      EDgroupByYear(data, input$timeline[1], 
                     input$timeline[2], input$ED, input$boroughs)
    })
    
    output$EDByYear <- renderChart({
      plotEDByYear(EDTableByYear())
    })

#Chart #4  
    RaceTableByYear <- reactive({
      RacegroupByYear(data, input$timeline[1], 
                    input$timeline[2], input$race, input$boroughs)
    })
    
    output$RaceByYear <- renderChart({
      plotRaceByYear(RaceTableByYear())
    })
    
#Chart #5  
    GenderTableByYear <- reactive({
      GendergroupByYear(data, input$timeline[1], 
                      input$timeline[2], input$gender, input$boroughs)
    })
    
    output$GenderByYear <- renderChart({
      plotGenderByYear(GenderTableByYear())
    })
    
})
