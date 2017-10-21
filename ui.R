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
                        titlePanel("Analysis for SCCPs standands with known %Cl"),
                        
                        fluidRow(
                                column(
                                        12,
                                        fluidRow(
                                                column(6,
                                                        h4('Uploading Standard File'),
                                                       fluidRow(column(6,
                                                              fileInput('file1',
                                                                        label = 'mzxml file',
                                                                        accept = c('.mzxml')),
                                                              fileInput('file2',
                                                                        label = 'mzxml file',
                                                                        accept = c('.mzxml')),
                                                              fileInput('file3',
                                                                        label = 'mzxml file',
                                                                        accept = c('.mzxml')),
                                                              fileInput('file4',
                                                                                                        label = 'mzxml file',
                                                                                                        accept = c('.mzxml')),
                                                              fileInput('file5',
                                                                        label = 'mzxml file',
                                                                        accept = c('.mzxml')),
                                                              fileInput('file6',
                                                                                                        label = 'mzxml file',
                                                                                                        accept = c('.mzxml')),
                                                              fileInput('file7',
                                                                                                                                        label = 'mzxml file',
                                                                                                                                        accept = c('.mzxml')),
                                                              fileInput('file8',
                                                                                                                                                                        label = 'mzxml file',
                                                                                                                                                                        accept = c('.mzxml')),
                                                              fileInput('file9',
                                                                                                                                                                                                        label = 'mzxml file',
                                                                                                                                                                                                        accept = c('.mzxml'))
                                                              
                                                       ),
                                                       column(6, 
                                                              sliderInput(
                                                               'spCl1',
                                                               '%Cl',
                                                               min = 40,
                                                               max = 80,
                                                               value = 51.23,
                                                               step = 0.01,
                                                               round = 3
                                                       ),sliderInput(
                                                               'spCl2',
                                                               '%Cl',
                                                               min = 40,
                                                               max = 80,
                                                               value = 52.23,
                                                               step = 0.01,
                                                               round = 3
                                                       ),sliderInput(
                                                               'spCl3',
                                                               '%Cl',
                                                               min = 40,
                                                               max = 80,
                                                               value = 53.23,
                                                               step = 0.01,
                                                               round = 3
                                                       ),sliderInput(
                                                               'spCl4',
                                                               '%Cl',
                                                               min = 40,
                                                               max = 80,
                                                               value = 54.23,
                                                               step = 0.01,
                                                               round = 3
                                                       ),sliderInput(
                                                               'spCl5',
                                                               '%Cl',
                                                               min = 40,
                                                               max = 80,
                                                               value = 55.23,
                                                               step = 0.01,
                                                               round = 3
                                                       ),sliderInput(
                                                               'spCl6',
                                                               '%Cl',
                                                               min = 40,
                                                               max = 80,
                                                               value = 56.23,
                                                               step = 0.01,
                                                               round = 3
                                                       ),sliderInput(
                                                               'spCl7',
                                                               '%Cl',
                                                               min = 40,
                                                               max = 80,
                                                               value = 57.23,
                                                               step = 0.01,
                                                               round = 3
                                                       ),sliderInput(
                                                               'spCl8',
                                                               '%Cl',
                                                               min = 40,
                                                               max = 80,
                                                               value = 58.23,
                                                               step = 0.01,
                                                               round = 3
                                                       ),sliderInput(
                                                               'spCl9',
                                                               '%Cl',
                                                               min = 40,
                                                               max = 80,
                                                               value = 61.23,
                                                               step = 0.01,
                                                               round = 3
                                                       )
                                                       ))),
                                        column(6,h4('Parameters to extract the data'),
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
                                                       'SCCP concertration in all standards(ppm)',
                                                       min = 100,
                                                       max = 5000,
                                                       value = 2000,
                                                       step = 50,
                                                       round = 0
                                               ),
                                               actionButton("goButton", "Go!"),
                                               plotOutput("plotrsd"),
                                               textOutput("test")
                                               )))
        ))),
        tabPanel(
                "Sample analysis",
                fluidPage(
                        titlePanel("Analysis for SCCPs sample"),
                        sidebarPanel(
                                h4('Uploading Sample File'),
                                fileInput('sample',
                                          label = 'mzxml file',
                                          accept = c('.mzxml'))
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
                        
                        mainPanel(p("test"))
                )
        ),
        tabPanel("Ions for analysis",
                 dataTableOutput("data")),
        tabPanel("References")
))
