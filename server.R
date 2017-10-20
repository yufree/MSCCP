
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(rcdk)
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
