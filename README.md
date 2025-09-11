🎯 Project Overview

This project analyzes Eduvos Graduate Survey data to identify the most popular:

Programming Languages

Databases

Cloud Platforms

Web Frameworks

AI Search Tools

AI Developer Tools

Industries and Job Roles

Employment Trends by Study Field

While graduates are primarily from IT, Software Development, and Financial Services, this analysis also demonstrates how their skills can be applied in the Mining sector:

Programming & Data Science tools (Python, R, SQL) support mineral exploration, predictive maintenance, and processing plant optimization.

Cloud platforms (AWS, Azure, GCP) are used for hosting mining simulations and IoT sensor data analytics.

AI tools (ChatGPT, GitHub Copilot, ML libraries) enable automation in safety monitoring, geological modeling, and operational decision-making.

Results are presented in an interactive R Shiny dashboard, helping Eduvos align its IT curriculum with industry trends, including mining applications.

🛠️ Technologies Used

R (tidyverse, ggplot2, shiny)

R Shiny (interactive dashboard)

Quarto / R Markdown (reporting)

GitHub (version control, repository hosting)

shinyapps.io (dashboard deployment)

📂 Project Structure
eduvos-graduate-survey-dashboard
├─ app.R                  # Shiny App
├─ graduate_survey.csv    # Dataset (place here before running)
├─ README.md              # Project documentation
├─ report.docx / report.pdf # Comprehensive report (Assignment Q4)
├─ .gitignore             # Ignore unnecessary files

🚀 Running the Project
1️⃣ Run Locally

Open RStudio

Install required packages:

install.packages(c("shiny", "tidyverse", "ggplot2"))


Place graduate_survey.csv in the project folder

Run the app:

shiny::runApp("app.R")

2️⃣ Deployed Dashboard

GitHub Repository: 👉 [GitHub Repo Link Here]

Deployed Dashboard: 👉 https://thuto.shinyapps.io/eduvos-rshiny-dashboard/

📊 Dashboard Features

Interactive dropdowns to select visualizations

Top 10 rankings (Languages, Databases, Frameworks, Platforms, AI Tools)

Industry and Role breakdowns by study field

Employment status by study field

Mining relevance insights

🔎 Relevance of This Analysis to Mining

This type of survey analysis can be directly applied in mining for:

1. Workforce & Skills Analysis

Track skills of mining engineers and IT staff (Python, AI, cloud computing)

Identify training needs and workforce readiness for digital transformation

2. Technology Adoption Tracking

Monitor adoption of automation, predictive maintenance systems, and IoT sensors

Analyze AI-powered safety tools and real-time monitoring systems

3. Industry Benchmarking

Compare technology usage across mines or departments

Monitor GIS, digital twins, cloud systems, safety compliance, and environmental monitoring

4. Employment & Workforce Trends

Evaluate proportions of permanent vs. contract workers

Identify skill gaps in data science, automation, and geological modeling

Forecast future demand for AI/cloud specialists in mining

5. Interactive Dashboards for Decision-Making

Provide real-time visualizations for mine managers, HR teams, and executives

Track training progress, technology adoption, and workforce readiness

✅ In short, the same data cleaning, visualization, and dashboarding approach from this Eduvos project can support mining HR analytics, operational monitoring, and technology adoption planning.

📑 Report

The full analysis report (report.docx / report.pdf) includes:

Insights from visualizations

Key findings

Recommendations for Eduvos curriculum

Examples of IT/AI/Cloud skill application in the Mining industry

🙌 Acknowledgements

Eduvos LMS – Assignment dataset & instructions

Faculty of Information Technology

Mining industry use cases for IT, Data Science, and AI
