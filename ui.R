# The user-interface definition of the Shiny web app.
library(shiny)
library(BH)
library(rCharts)
require(markdown)
require(data.table)
library(dplyr)
library(DT)

data <- fread("borough_grad_rates.csv")
colnames(data) <- make.names(colnames(data))

data2 <- data %>% filter(All == "Native Language")
ELLchoices <- unique(data2$Demographic)

data3 <- data %>% filter(All == "General Disability")
EDchoices <- unique(data3$Demographic)

data4 <- data %>% filter(All == "Race")
Racechoices <- unique(data4$Demographic)

data5 <- data %>% filter(All == "Gender")
Genderchoices <- unique(data5$Demographic)

shinyUI(
  navbarPage("NYC HS Graduation Rates", 
             # multi-page user-interface that includes a navigation bar.
             tabPanel("Explore the Data",
                      sidebarPanel(
                        sliderInput("timeline", 
                                    "Cohort Year(s):", 
                                    min = 2001,
                                    max = 2005,
                                    value = c(2001, 2005)),
                        checkboxGroupInput("boroughs", "Borough:",
                                           choices  = unique(data$Borough),
                                           selected = unique(data$Borough)),
                        checkboxGroupInput("ELL", "Native Language:",
                                          choices  = ELLchoices,
                                          selected = ELLchoices),
                        checkboxGroupInput("ED", "General Disability:",
                                          choices  = EDchoices,
                                          selected = EDchoices),
                        checkboxGroupInput("race", "Race:",
                                          choices  = Racechoices,
                                          selected = Racechoices),
                        checkboxGroupInput("gender", "Gender:",
                                          choices  = Genderchoices,
                                          selected = Genderchoices)),
                      mainPanel(
                                   h4('Borough Graduation Rate by Cohort', align = "center"),
                                   h5('Please hover over each point to see the Year and Total Number of Sets.', 
                                      align ="center"),
                                   showOutput("CohortByYear", "nvd3"),
                                   
                                   h4('Graduation Rate by Native Language', align = "center"),
                                   h5('Please hover over each bar to see the Year and Total Number of Themes.', 
                                      align ="center"),
                                   showOutput("ELLByYear", "nvd3"),
                                   
                                   h4('Graduation Rate by General Disability', align = "center"),
                                   h5('Please hover over each point to see the Set Name, ID and Theme.', 
                                      align ="center"),
                                   showOutput("EDByYear", "nvd3"),
                                   
                                   h4('Graduation Rate by Race', align = "center"),
                                   showOutput("RaceByYear", "nvd3"),
                                   
                                   h4('Graduation Rate by Gender', align = "center"),
                                   showOutput("GenderByYear", "nvd3")
                                   
                          ) # end of "Visualize the Data" tab panel
             ), # end of "Explore Dataset" tab panel
             
             tabPanel("Background & Documentation",
                      mainPanel(
                        includeMarkdown("background.md")
                      )
             ) # end of "About" tab panel
             )  
  )
