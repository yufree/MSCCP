options(shiny.maxRequestSize=100*1024^2) 
library(shiny)
library(rcdk)
library(xcms)
source('sccp.R')
load('sccpdt.RData')

shinyServer(function(input, output) {
        randomVals <- eventReactive(input$goButton, {
                if (!is.null(input$file1)){
                        std1 <- xcmsRaw(input$file1$datapath,profstep = 0.1)
                        std1 <- getareastd(std1,ismz = input$ISmz,ppm = input$ppm, con = input$con, rt = input$SCCPrt, rts = input$ISrt)   
                }else{
                        std1 <- NULL
                }
                if (!is.null(input$file2)){
                        std2 <- xcmsRaw(input$file2$datapath,profstep = 0.1)
                        std2 <- getareastd(std2,ismz = input$ISmz,ppm = input$ppm, con = input$con, rt = input$SCCPrt, rts = input$ISrt)
                }else{
                        std2 <- NULL    
                }
                if (!is.null(input$file3)){
                        std3 <- xcmsRaw(input$file3$datapath,profstep = 0.1)    
                        std3 <- getareastd(std3,ismz = input$ISmz,ppm = input$ppm, con = input$con, rt = input$SCCPrt, rts = input$ISrt)
                }else{
                        std3 <- NULL
                }
                if (!is.null(input$file4)){
                        std <- xcmsRaw(input$file4$datapath,profstep = 0.1)    
                        getareastd(std,ismz = input$ISmz,ppm = input$ppm, con = input$con, rt = input$SCCPrt, rts = input$ISrt)
                }else{
                        std4 <- NULL
                }
                if (!is.null(input$file5)){
                        std5 <- xcmsRaw(input$file5$datapath,profstep = 0.1)    
                        std5 <- getareastd(std5,ismz = input$ISmz,ppm = input$ppm, con = input$con, rt = input$SCCPrt, rts = input$ISrt)
                }else{
                        std5 <- NULL
                }
                if (!is.null(input$file6)){
                std6 <- xcmsRaw(input$file6$datapath,profstep = 0.1)    
                std6 <- getareastd(std6,ismz = input$ISmz,ppm = input$ppm, con = input$con, rt = input$SCCPrt, rts = input$ISrt)
        }else{
                        std6 <- NULL
                }
                if (!is.null(input$file7)){
                        std7 <- xcmsRaw(input$file7$datapath,profstep = 0.1)    
                        std7 <- getareastd(std7,ismz = input$ISmz,ppm = input$ppm, con = input$con, rt = input$SCCPrt, rts = input$ISrt)
                }else{
                        std7 <- NULL
                }
                if (!is.null(input$file8)){
                std8 <- xcmsRaw(input$file8$datapath,profstep = 0.1)    
                std8 <- getareastd(std8,ismz = input$ISmz,ppm = input$ppm, con = input$con, rt = input$SCCPrt, rts = input$ISrt)
        }else{
                        std8 <- NULL
                }
                if (!is.null(input$file9)){
                std9 <- xcmsRaw(input$file9$datapath,profstep = 0.1)    
                std9 <- getareastd(std8,ismz = input$ISmz,ppm = input$ppm, con = input$con, rt = input$SCCPrt, rts = input$ISrt)
                }else{
                        std9 <- NULL
                }
        pCl <- c(std1$sumpCl,std2$sumpCl,std3$sumpCl,std4$sumpCl,std5$sumpCl,std6$sumpCl,std7$sumpCl,std8$sumpCl,std9$sumpCl)
        area <- c(std1$sumrarea,std2$sumrarea,std3$sumrarea,std4$sumrarea,std5$sumrarea,std6$sumrarea,std7$sumrarea,std8$sumrarea,std9$sumrarea)
        cbind.data.frame(pCl,area)
        })
        randomVals2 <- eventReactive(input$goButton, {
                if (!is.null(input$file1)){
                        std1 <- xcmsRaw(input$file1$datapath,profstep = 0.1)
                        std1 <- getareastd(std1,ismz = input$ISmz,ppm = input$ppm, con = input$con, rt = input$SCCPrt, rts = input$ISrt)   
                }else{
                        std1 <- NULL
                }
                std1$sumpCl
        })
        output$plotstd <- renderPlot({
                std1 <- xcmsRaw(input$file1$datapath,profstep = 0.1)
                std1 <- getareastd(std1,ismz = input$ISmz,ppm = input$ppm, con = input$con, rt = input$SCCPrt, rts = input$ISrt)   
                df <- randomVals()
                plot(df$area~df$pCl)
        })
        
        output$test <- renderText({
                std1 <- xcmsRaw(input$file1$datapath,profstep = 0.1)
                std1 <- getareastd(std1,ismz = input$ISmz,ppm = input$ppm, con = input$con, rt = input$SCCPrt, rts = input$ISrt)
                std1$sumpCl
        })
        output$data <- renderDataTable({
                sccpdt
        })

})
