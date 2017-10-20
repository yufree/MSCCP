library(shiny)
library(rcdk)
library(xcms)
source('sccp.R')
load('sccpdt.RData')

shinyServer(function(input, output) {
        output$plot0 <- renderPlot({
                formula <- get.formula(input$formula, charge = 1)
                isotopes <- get.isotopes.pattern(formula,minAbund=0.00000001)
                plot(isotopes,
                     type="h",
                     xlab="m/z", 
                     ylab="Intensity",
                     frame.plot = F)
                
        })

})
