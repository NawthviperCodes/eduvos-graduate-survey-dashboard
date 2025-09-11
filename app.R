# ========================================================
# Eduvos Graduate Survey Dashboard - Shiny App
# Module Code: ITRDA3-11
# Author: Thuto Moleko
# ========================================================

# Load libraries
library(shiny)
library(tidyverse)

# ========================================================
# Data Preparation
# ========================================================

# Read dataset
survey_data <- read_csv("graduate_survey.csv")

# Select relevant columns
survey_selected <- survey_data %>%
  select(
    Campus, StudyField, Branch, Role, EduLevel,
    ProgLang, Databases, Platform, WebFramework,
    Industry, AISearch, `AIToolCurrently Using`, Employment
  ) %>%
  rename(AITool = `AIToolCurrently Using`)

# Clean data
survey_clean <- survey_selected %>%
  drop_na(Campus, StudyField, ProgLang) %>%
  mutate(
    Campus = case_when(
      Campus %in% c("Durban Campus", "Umhlanga Campus") ~ "Durban Campus",
      Campus %in% c("Port Elizabeth Campus", "Nelson Mandela Bay Campus") ~ "Gqeberha Campus",
      Campus %in% c("Nelspruit Campus", "Mbombela Campus") ~ "Mbombela/Nelspruit Campus",
      TRUE ~ Campus
    ),
    EduLevel = case_when(
      EduLevel == "Some college/university study without earning a degree" ~ "Incomplete Degree",
      EduLevel == "Bachelor’s degree (B.A., B.S., B.Eng., etc.)" ~ "Bachelor’s degree",
      EduLevel == "Master’s degree (M.A., M.S., M.Eng., MBA, etc.)" ~ "Master’s degree",
      EduLevel == "Primary/elementary school" ~ "Primary/Elementary",
      EduLevel == "Professional degree (JD, MD, Ph.D, Ed.D, etc.)" ~ "Professional degree",
      EduLevel == "Associate degree (A.A., A.S., etc.)" ~ "Associate degree",
      EduLevel == "Secondary school (e.g. American high school, German Realschule or Gymnasium, etc.)" ~ "Secondary school",
      TRUE ~ EduLevel
    )
  )

# Employment cleanup (long format)
survey_clean_long <- survey_clean %>%
  separate_rows(Employment, sep = ";") %>%
  mutate(
    Employment = str_trim(Employment),
    Employment = case_when(
      Employment == "Employed, full-time" ~ "Full-time",
      Employment == "Independent contractor, freelancer, or self-employed" ~ "Freelance",
      Employment == "Employed, part-time" ~ "Part-time",
      Employment == "Not employed, but looking for work" ~ "Unemployed, seeking",
      Employment == "Not employed, and not looking for work" ~ "Unemployed, not seeking",
      TRUE ~ Employment
    )
  )

# Keep only top 5 campuses
top_campuses <- survey_clean %>%
  count(Campus, sort = TRUE) %>%
  top_n(5, n) %>%
  pull(Campus)

survey_final <- survey_clean %>%
  filter(Campus %in% top_campuses)

# ========================================================
# Shiny UI
# ========================================================
ui <- fluidPage(
  titlePanel("Eduvos Graduate Survey Dashboard"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("chart", "Choose a visualization:",
                  choices = c(
                    "Top Programming Languages" = "plang",
                    "Top Databases" = "db",
                    "Top Cloud Platforms" = "platform",
                    "Top Web Frameworks" = "webf",
                    "Top AI Search Tools" = "aisearch",
                    "Top AI Developer Tools" = "aitool",
                    "Top Industries by StudyField" = "industry",
                    "Top Roles by StudyField" = "roles",
                    "Employment by StudyField" = "employment"
                  ))
    ),
    
    mainPanel(
      plotOutput("plot", height = "600px")
    )
  )
)

# ========================================================
# Shiny Server
# ========================================================
server <- function(input, output) {
  
  output$plot <- renderPlot({
    if (input$chart == "plang") {
      plang_counts <- survey_final %>%
        separate_rows(ProgLang, sep = ";") %>%
        mutate(ProgLang = str_trim(ProgLang)) %>%
        filter(ProgLang != "") %>%
        count(ProgLang, sort = TRUE)
      
      plang_counts %>% slice_head(n = 10) %>%
        ggplot(aes(x = reorder(ProgLang, n), y = n)) +
        geom_col(fill = "steelblue") +
        coord_flip() +
        labs(title = "Top 10 Programming Languages", x = "Programming Language", y = "Count") +
        theme_minimal()
      
    } else if (input$chart == "db") {
      db_counts <- survey_final %>%
        separate_rows(Databases, sep = ";") %>%
        mutate(Databases = str_trim(Databases)) %>%
        filter(Databases != "") %>%
        count(Databases, sort = TRUE)
      
      db_counts %>% slice_head(n = 10) %>%
        ggplot(aes(x = reorder(Databases, n), y = n)) +
        geom_col(fill = "lightgreen") +
        coord_flip() +
        labs(title = "Top 10 Databases", x = "Database", y = "Number of Graduates") +
        theme_minimal()
      
    } else if (input$chart == "platform") {
      platform_counts <- survey_final %>%
        separate_rows(Platform, sep = ";") %>%
        mutate(Platform = str_trim(Platform)) %>%
        filter(Platform != "") %>%
        count(Platform, sort = TRUE)
      
      platform_counts %>% slice_head(n = 10) %>%
        ggplot(aes(x = reorder(Platform, n), y = n)) +
        geom_col(fill = "lightblue") +
        coord_flip() +
        labs(title = "Top 10 Cloud Platforms", x = "Platform", y = "Number of Graduates") +
        theme_minimal()
      
    } else if (input$chart == "webf") {
      webf_counts <- survey_final %>%
        separate_rows(WebFramework, sep = ";") %>%
        mutate(WebFramework = str_trim(WebFramework)) %>%
        filter(WebFramework != "") %>%
        count(WebFramework, sort = TRUE)
      
      webf_counts %>% slice_head(n = 10) %>%
        ggplot(aes(x = reorder(WebFramework, n), y = n)) +
        geom_col(fill = "orange") +
        coord_flip() +
        labs(title = "Top 10 Web Frameworks", x = "Web Framework", y = "Number of Graduates") +
        theme_minimal()
      
    } else if (input$chart == "aisearch") {
      aisearch_counts <- survey_final %>%
        separate_rows(AISearch, sep = ";") %>%
        mutate(AISearch = str_trim(AISearch)) %>%
        filter(AISearch != "") %>%
        count(AISearch, sort = TRUE)
      
      aisearch_counts %>% slice_head(n = 10) %>%
        ggplot(aes(x = reorder(AISearch, n), y = n)) +
        geom_col(fill = "salmon") +
        coord_flip() +
        labs(title = "Top 10 AI Search Tools", x = "AI Search Tool", y = "Number of Graduates") +
        theme_minimal()
      
    } else if (input$chart == "aitool") {
      aitool_counts <- survey_final %>%
        separate_rows(AITool, sep = ";") %>%
        mutate(AITool = str_trim(AITool)) %>%
        filter(AITool != "") %>%
        count(AITool, sort = TRUE)
      
      aitool_counts %>% slice_head(n = 10) %>%
        ggplot(aes(x = reorder(AITool, n), y = n)) +
        geom_col(fill = "plum") +
        coord_flip() +
        labs(title = "Top 10 AI Developer Tools", x = "AI Developer Tool", y = "Number of Graduates") +
        theme_minimal()
      
    } else if (input$chart == "industry") {
      industry_counts <- survey_final %>%
        separate_rows(Industry, sep = ";") %>%
        mutate(Industry = str_trim(Industry)) %>%
        filter(Industry != "") %>%
        count(StudyField, Industry, sort = TRUE)
      
      industry_counts %>%
        group_by(StudyField) %>%
        mutate(prop = n / sum(n)) %>%
        ggplot(aes(x = fct_reorder(Industry, n), y = prop, fill = StudyField)) +
        geom_col(position = "dodge") +
        coord_flip() +
        labs(title = "Most Popular Industries by Study Field", x = "Industry", y = "Proportion of Graduates") +
        theme_minimal()
      
    } else if (input$chart == "roles") {
      role_counts <- survey_final %>%
        separate_rows(Role, sep = ";") %>%
        mutate(Role = str_trim(Role)) %>%
        filter(Role != "") %>%
        count(StudyField, Role, sort = TRUE)
      
      top_roles_by_field <- role_counts %>%
        group_by(StudyField) %>%
        slice_max(order_by = n, n = 5) %>%
        ungroup()
      
      top_roles_by_field %>%
        ggplot(aes(x = reorder(Role, n), y = n, fill = StudyField)) +
        geom_col(position = "dodge") +
        coord_flip() +
        labs(title = "Top Job Roles by Study Field", x = "Role", y = "Count") +
        theme_minimal()
      
    } else if (input$chart == "employment") {
      employment_counts <- survey_clean_long %>%
        group_by(StudyField, Employment) %>%
        summarise(count = n(), .groups = "drop") %>%
        group_by(StudyField) %>%
        mutate(prop = count / sum(count))
      
      employment_counts %>%
        ggplot(aes(x = StudyField, y = prop, fill = Employment)) +
        geom_col(position = "fill") +
        labs(
          title = "Employment Rate by Study Field",
          x = "Study Field",
          y = "Proportion",
          fill = "Employment Status"
        ) +
        theme_minimal()
    }
  })
}

# ========================================================
# Run App
# ========================================================
shinyApp(ui = ui, server = server)
