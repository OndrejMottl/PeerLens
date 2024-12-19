# PeerLens

**Purpose:**  
A system for students to anonymously evaluate peer presentations and for the admin to manage student lists, retrieve evaluation results, and share feedback with presenters.

---

## Key Components

### 1. Technology Stack

- **Framework:** Built with **R Shiny**.
- **Survey Tool:** Leveraging **shinysurveys** for creating evaluation forms.
- **Data Storage:** Results stored in **Google Sheets**.
- **Hosting:** Deployed on **Shinyapps.io (free-tier)**.

### 2. Access Modes

- **Student Access:**
  - Anonymous interface for submitting evaluations.
  - Dropdown menu showing all student names for the semester.
  - Input fields for evaluation criteria and optional comments.
- **Admin Access:**
  - Secure panel to:
    - Upload a list of student names for the semester.
    - View and filter results (grouped by year, semester, or other criteria).
    - **Live Summary Statistics:** Visual summaries (e.g., bar charts, averages) for selected sections of the evaluation form, available per student.
    - Download aggregated data for analysis.
  - Email the full evaluation results to the respective student after their seminar.

---

## Workflow

### A. Semester Setup

- Admin uploads a list of student names at the beginning of the semester.

### B. Weekly Operations

- Students evaluate their peers anonymously.
- Admin accesses live summary statistics for students after each seminar and emails the full evaluation results to the respective presenter.

### C. Result Management

- Evaluation results are stored in Google Sheets, including:
  - Evaluated student name.
  - Scores for each criterion.
  - Comments.
  - Timestamp.
- Historical data retained for analysis.

---

## Features

1. **Anonymous Evaluations:**  
   - No evaluator names are collected to maintain impartiality.
2. **Live Summary Statistics:**  
   - Visual summaries for selected sections of the evaluation form (e.g., clarity scores) displayed in the admin dashboard.
3. **Custom Emailing:**  
   - Full evaluation results can be exported and emailed to the respective presenter.
4. **Secure Admin Access:**  
   - Role-based access with password protection.
5. **Data Retention:**  
   - Historical data stored for multi-year analysis.
