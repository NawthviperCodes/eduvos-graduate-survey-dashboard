# 📊 Eduvos Graduate Survey Dashboard

👉 **Deployed Dashboard:** [Click Here to View](https://thuto.shinyapps.io/eduvos-rshiny-dashboard/)
👉 **GitHub Repository:** [Repo Link Here](https://github.com/NawthviperCodes/eduvos-graduate-survey-dashboard.git) 

---

## 🎯 Project Overview

This project analyzes **Eduvos Graduate Survey data** to identify the most popular:

* Programming Languages
* Databases
* Cloud Platforms
* Web Frameworks
* AI Search Tools
* AI Developer Tools
* Industries and Job Roles
* Employment Trends by Study Field

While graduates are primarily from **IT, Software Development, and Financial Services**, this analysis also demonstrates how their skills can be applied in the **Mining sector**:

* **Programming & Data Science tools** (Python, R, SQL) → support **mineral exploration, predictive maintenance, and plant optimization**
* **Cloud platforms** (AWS, Azure, GCP) → enable **mining simulations and IoT analytics**
* **AI tools** (ChatGPT, GitHub Copilot, ML libraries) → power **automation in safety monitoring, geological modeling, and decision-making**

Results are delivered in an **interactive R Shiny dashboard**, helping Eduvos align its IT curriculum with **real industry trends**, including mining.

---

## 🛠️ Technologies Used

* **R** (tidyverse, ggplot2, shiny)
* **R Shiny** (interactive dashboard)
* **Quarto / R Markdown** (reporting)
* **GitHub** (version control, repository hosting)
* **shinyapps.io** (cloud deployment)

---

## 📂 Project Structure

```
eduvos-graduate-survey-dashboard
├─ app.R                # Shiny App
├─ graduate_survey.csv  # Dataset
├─ README.md            # Documentation
├─ report.docx / report.pdf  # Full analysis report
├─ .gitignore
```

---

## 🚀 Running the Project

### 1️⃣ Run Locally

1. Open **RStudio**
2. Install required packages:

```r
install.packages(c("shiny", "tidyverse", "ggplot2"))
```

3. Place `graduate_survey.csv` in the project folder
4. Run the app:

```r
shiny::runApp("app.R")
```

### 2️⃣ Access Online

* **Deployed Dashboard:** [Click Here](https://thuto.shinyapps.io/eduvos-rshiny-dashboard/)
* **GitHub Repository:** [Repo Link Here](#)

---

## 📊 Dashboard Features

* Interactive dropdown filters
* Top 10 rankings (Languages, Databases, Frameworks, Platforms, AI Tools)
* Industry & role breakdowns by study field
* Employment status visualizations
* Mining industry relevance insights

---

## 🔎 Relevance to Mining

This dashboarding approach can be applied to mining for:

1. **Workforce & Skills Analysis** – monitor IT/data skills in mining staff
2. **Technology Adoption Tracking** – IoT, predictive maintenance, automation
3. **Industry Benchmarking** – digital twins, GIS, safety monitoring
4. **Employment Trends** – workforce structure, AI/cloud talent demand
5. **Decision Dashboards** – real-time data for HR and executives

✅ In short: the **Eduvos skills survey analysis** also maps directly to **mining workforce readiness and digital transformation**.

---

## 📑 Report

The full report (`report.docx` / `report.pdf`) includes:

* Key findings & insights
* Visualizations & trends
* Recommendations for Eduvos curriculum
* Mining applications of IT/AI/Cloud skills

---

## 🙌 Acknowledgements

* Eduvos LMS – Assignment dataset & guidance
* Faculty of Information Technology
* Mining industry case studies in IT & AI adoption
