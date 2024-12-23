library(shiny)
library(shinysurveys)
library(tidyverse)

questions <-
  tibble::tribble(
    ~question, ~option, ~input_type, ~input_id, ~dependence, ~dependence_value, ~required,
    "Which student are you evaluating?", "Student 1", "select", "student", NA, NA, TRUE,
    "Rate the clarity (1-5):", "3", "numeric", "clarity", NA, NA, TRUE,
    "Rate the engagement (1-5):", "3", "numeric", "engagement", NA, NA, TRUE,
    "Any additional comments?", "", "text", "comments", NA, NA, FALSE
  )

ui <-
  shiny::fluidPage(
    shiny::titlePanel("PeerLens - Phase 1"),
    shinysurveys::surveyOutput(df = questions),
    shiny::hr(), # Add a horizontal rule for separation
    shiny::h3("Submitted Responses"), # Add a title for the table
    shiny::tableOutput("responses_table") # Output table for responses
  )

server <- function(input, output, session) {
  `%>%` <- magrittr::`%>%`

  shinysurveys::renderSurvey()

  # Use reactiveVal to store responses persistently
  responses_all <-
    shiny::reactiveVal(data.frame())

  shiny::observeEvent(
    input$submit,
    {
      responses <-
        shinysurveys::getSurveyData()

      current_data <-
        responses_all()


      updated_data <-
        dplyr::bind_rows(
          current_data,
          responses
        )

      # Update the reactiveVal
      responses_all(updated_data)
    }
  )

  # Render the responses table
  output$responses_table <-
    shiny::renderTable({
      responses_all()
    })
}

shiny::shinyApp(ui, server)
