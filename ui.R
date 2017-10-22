library(shiny)

shinyUI(navbarPage(
        "MSCCP",
        tabPanel("Usage",
                 fluidPage(
                         titlePanel(
                                 "Online shiny apps for quantitative analysis of Short Chain Chlorinated Paraffins (SCCPs)"
                         )
                 )),
        tabPanel(
                "Standards analysis",
                fluidPage(
                        titlePanel("Analysis for SCCPs standards"),
                        sidebarPanel(
                                h4('Uploading Standards File'),
                                fileInput('Standards',
                                          label = 'mzxml files',
                                          multiple = T,
                                          accept = c('.mzxml')),
                        sliderInput(
                                'ISmz',
                                'm/z',
                                min = 200,
                                max = 600,
                                value = 323,
                                step = 0.01,
                                round = 3
                        ),
                        sliderInput(
                                'ISrt',
                                'Retention Time range for IS',
                                min = 0,
                                max = 6000,
                                value = c(600,1200),
                                step = 50,
                                round = 0
                        ),
                        sliderInput(
                                'SCCPrt',
                                'Retention Time range for SCCPs',
                                min = 0,
                                max = 6000,
                                value = c(600,1200),
                                step = 50,
                                round = 0
                        ),
                        sliderInput(
                                'ppm',
                                'ppm',
                                min = 1,
                                max = 100,
                                value = 5,
                                step = 1,
                                round = 0
                        ),
                        sliderInput(
                                'con',
                                'Concertration in ppm',
                                min = 10,
                                max = 10000,
                                value = 2000,
                                step = 10,
                                round = 0
                        ),
                        actionButton("go", "Go")
                        ),
                        
                        mainPanel(
                               plotOutput("plotstd") ,
                               plotOutput("plotcomp"),
                               
                               h4('Parameters for linear regression'),
                               tableOutput("reg2"),
                               
                               h4("Parameters for log transformation on response factor"),
                               tableOutput("reg")
                               
                        )
                )
                ),
        tabPanel(
                "Sample analysis",
                fluidPage(
                        titlePanel("Analysis for SCCPs sample"),
                        sidebarPanel(
                                h4('Uploading Sample Files'),
                                fileInput('Samples',
                                          label = 'mzxml files',
                                          multiple = T,
                                          accept = c('.mzxml')),
                                checkboxInput('log','Log Trans', value = T),
                                sliderInput(
                                        'inc',
                                        'Intercept',
                                        min = -50,
                                        max = 0,
                                        value = -26.36,
                                        step = 0.01,
                                        round = 2
                                ),
                                sliderInput(
                                        'slope',
                                        'Slope',
                                        min = 0,
                                        max = 50,
                                        value = 34.66,
                                        step = 0.01,
                                        round = 2
                                ),
                                sliderInput(
                                'ISmz',
                                'm/z',
                                min = 200,
                                max = 600,
                                value = 323,
                                step = 0.01,
                                round = 3
                        ),
                        sliderInput(
                                'ISrt',
                                'Retention Time range for IS',
                                min = 0,
                                max = 6000,
                                value = c(600,1200),
                                step = 50,
                                round = 0
                        ),
                        sliderInput(
                                'SCCPrt',
                                'Retention Time range for SCCPs',
                                min = 0,
                                max = 6000,
                                value = c(600,1200),
                                step = 50,
                                round = 0
                        ),
                        sliderInput(
                                'ppm',
                                'ppm',
                                min = 1,
                                max = 100,
                                value = 5,
                                step = 1,
                                round = 0
                        ),
                        actionButton("go2", "Go")),
                        
                mainPanel(plotOutput("plotcomps"),
                          h4("SCCPs Concertrations in sample(s)(ppm):"),
                          textOutput("results"))
                
        )),
        tabPanel("Ions for analysis",
                 dataTableOutput("data")),
        tabPanel("References")
))
