library(shiny)

shinyUI(navbarPage(
        "MSCCP",
        tabPanel("Usage",
                 fluidPage(
                         titlePanel(
                                 "Online shiny apps for quantitative analysis of Short Chain Chlorinated Paraffins (SCCPs)"
                         ),
                         h3('Step 0'),
                         h4('Prepare standards with known %Cl.'),
                         h3('Step 1'),
                         h4('Covert you GC-HRMS data into mzxml format by',a('MsConverter', href ='http://proteowizard.sourceforge.net/tools.shtml')),
                         h3('Step 2'),
                         h4('Upload standards data in "Standards analysis" tab, set the parameters for internal standards and retention time range, clike "Go" to process the data. Record the intercept and slope of the model.'),
                         h3('Step 3'),
                         h4('Upload Samples data in "Sample analysis" tab, set the parameters for intercept and slope from the standards, internal standards and retention time range, clike "Go" to process the data.'),
                         h3('Step 4'),
                         h4('The concertration and compositon of your samples would be shown.'),
                         h3('Tips'),
                         h4('"Ions for analysis" show the ions used for this analysis in case you use other HRMS to analysis SCCPs.'),
                         h5('The source code could be found ',a('here', href='https://github.com/yufree/MSCCP'), ' and you could download them and open "msccp.Rproj" with ', a('RStudio',href='https://www.rstudio.com/'),'. Then open either "ui.R" or "server.R" and punch "Run App" to use this app locally.')
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
