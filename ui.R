library(shiny)

shinyUI(navbarPage(
        "MSCCP",
        tabPanel("Usage",
                 fluidPage(
                         titlePanel("Molecule Isotop Ratio(MIR)")
                         
                         
                 )),
        tabPanel(
                "Standards analysis",
                fluidPage(
                        titlePanel("Analysis for SCCPs standands with known %Cl"),
                        
                        sidebarPanel(h4('Uploading Standard File'),
                                                  fileInput('file',
                                                            label = 'mzxml file',
                                                            accept = c('.mzxml'))),
                                     
                                     mainPanel(p("test"))
                        )
        ),
        tabPanel(
                "Standards analysis",
                fluidPage(
                        titlePanel("Analysis for SCCPs samples with known %Cl"),
                        
                        sidebarPanel(h4('Uploading Sample File'),
                                     fileInput('file2',
                                               label = 'mzxml file',
                                               accept = c('.mzxml'))),
                        
                        mainPanel(p("test"))
                )
        ),
        tabPanel("References")
))
