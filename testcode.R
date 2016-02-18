setwd("~/Desktop/project/")
data <- fread("borough_grad_rates.csv")
colnames(data) <- make.names(colnames(data))

data2 <- data %>% filter(All == "Native Language")
ELLchoices <- unique(data2$Demographic)

plotELLByYear(ELLgroupByYear(data, 2001, 2005, "Queens"))

ELLgroupByYear <- function(data, minYear, maxYear, borough) {
  result <- data %>% filter(Cohort >= minYear, Cohort <= maxYear,
                            Borough %in% borough, All == "Native Language") 
  return(result)
}

plotELLByYear <- function(data, 
                          xAxisLabel = "Year",
                          yAxisLabel = "Graduation Rate") {
  ELLByYear <- nPlot(
    Total.Grads.....of.cohort ~ Cohort, group = "Borough",
    data = data,
    type = "multiBarChart",
    width = 650
  )
  ELLByYear$chart(margin = list(left = 100))
  ELLByYear$chart(color = c("red", "green", "blue", "cyan", "magenta"))
  ELLByYear$yAxis(axisLabel = yAxisLabel, width = 80)
  ELLByYear$xAxis(axisLabel = xAxisLabel, width = 70)
  # for some reason this works in view, not Shiny
  ELLByYear$addFilters("Demographic")
  ELLByYear$chart(showControls = FALSE)
  ELLByYear 
}
