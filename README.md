# TTC Subway Delays  
**Data Science Institute – Cohort 7 – Machine Learning Team 13 Project**

## Goal  
This project investigates the key factors that are most predictive of **high-delay incidents** on Toronto’s **TTC subway system**, focusing specifically on **rush hour weekdays** when commuter traffic is at its peak.  
By leveraging data analytics and machine learning techniques, the team aims to identify the most influential operational, temporal, and situational variables that contribute to extended service disruptions.
# Members  
* Jamal Hassan Bagheri  
* Shahab Malik  
* Rohan Kulkarni  
* Arman Kavalekar

# Project Overview  

##### Source: [Toronto Open Data – TTC Subway Delay Data](https://open.toronto.ca/dataset/ttc-subway-delay-data/)  
##### Features: Date, Time, Day, Station, Line, Delay Minutes, Vehicle, Incident Type and code, Bound, Gap time between trains

Over the past few years, the **Toronto Transit Commission (TTC)** has consistently **underperformed compared to major metropolitan transit systems**, with customers frequently expressing concerns about its reliability and punctuality.  
Delays caused by **technical malfunctions**, **criminal or mental health-related incidents**, and **adverse weather conditions** have increasingly disrupted service—particularly during weekday rush hours, when the commuter impact is most severe.  

This project explores the operational and situational factors contributing to subway delays on Toronto’s **TTC Line 1 (Yonge–University)**.  
The analysis focuses primarily on **rush hour weekdays**, where high passenger volumes and system congestion make delay prediction most critical.  

Our objective is to identify the **most predictive factors for high-delay incidents**, using machine learning techniques to classify and analyze delay patterns. The key stakeholders for this project include **TTC operations teams**, **urban transit planners**, and **commuters**, as the insights can support better scheduling, incident management, and long-term reliability planning.  

While the dataset provides valuable operational information, certain limitations exist:  
- **Missed delay data for 65% of the dataset**: Data provided by the City of Toronto has missing values for delay duration in approximately 65% of incident reports.  
- **Incomplete incident descriptions** may reduce clarity in root-cause analysis.  
- **Temporal bias**: data is limited to certain months or years, which may not capture long-term seasonal patterns.  

Despite these constraints, this project offers **data-driven insights** into how delays occur and how predictive analytics can help **improve operational efficiency and commuter satisfaction** across the TTC network.


# Methodology  

### Steps Taken  
- **Data Collection:** Retrieved TTC Subway Delay data from the [Toronto Open Data portal](https://open.toronto.ca/dataset/ttc-subway-delay-data/).  
- **Data Preprocessing & Engineering:**  
  - Converted raw `.xls` files into structured `.csv` formats.  
  - Loaded CSV files into **SQLite** to perform initial data transformations and filtering.  
  - Utilized **SQL queries** to clean and aggregate the data, then exported the transformed outputs back to CSV files for further analysis.  
  - Loaded the transformed data into **Python** for exploratory analysis and modeling.  
- **Feature Engineering:** Created new variables such as *rush-hour indicators*, *day-of-week categories*, and grouped *incident types* (e.g., technical, human, environmental) into 5–6 major categories.  
- **Exploratory Data Analysis (EDA):** Visualized data distributions, examined station-level delay trends, and analyzed correlations between features like incident type, time, and delay duration.  
- **Model Development:**  
  - Built supervised learning models to predict whether an incident would result in a **high-delay event** (delay > 5 minutes).  
  - Used **train-test split** to separate data for training and evaluation.  
  - Applied **GridSearchCV** for hyperparameter tuning and model validation.  
  - Tested classification algorithms such as **Logistic Regression** .
- **Model Evaluation:** Assessed performance using metrics including **accuracy**, **precision**, **recall**, **F1-score**, and **ROC-AUC**.  
- **Visualization & Insights:** Created clear graphical representations to interpret feature importance and highlight key delay predictors.  
- **Conclusion:** Summarized findings and identified the most predictive features contributing to high-delay incidents.

---

### Techniques & Technologies  

#### Programming Language  
- **Python**
- **SQL**

#### Tools & Frameworks  
- **SQLite:** For structured data storage and SQL-based preprocessing
- **Jupyter Notebook:** For reproducible workflow documentation and collaborative analysis 
- **Pandas & NumPy:** For data manipulation and numerical analysis  
- **Matplotlib:** For exploratory visualization and trend analysis  
- **Scikit-learn:** For machine learning model development and evaluation  
 

---

This methodology integrates both **data engineering** and **machine learning** workflows to ensure a clean data pipeline from raw TTC records to predictive modeling results.



# Project Scope  

### Goals & Objectives  
The primary goal of this project is to analyze the **Toronto Transit Commission (TTC)** open data on subway delays and develop a **machine learning classification model** to predict the likelihood of a **high-delay incident** (defined as a delay of 10 minutes or more)  

Specifically, the project aims to:  
- **Identify the most predictive factors** influencing subway delays, including day of the week, time of day, and subway line.  
- **Aggregate and simplify delay codes** into 5–6 broader categories for clearer interpretability and improved model performance.  
- **Develop and evaluate algorithms** that estimate the probability of high-delay incidents for rush-hour weekday operations.  
- **Provide actionable insights** that can assist TTC planning and operations teams in improving service reliability and incident response strategies.  

### Stakeholders  
- **TTC Planning & Operations Staff:** Utilize predictive insights to optimize scheduling, resource allocation, and system maintenance.  
- **Transit Data Analysts:** Leverage the developed model for ongoing monitoring and performance evaluation.  
- **Commuters & Policy Makers:** Benefit indirectly through reduced delays, improved service reliability, and data-driven decision-making in public transportation planning.  

### In-Scope Activities  
- Data preprocessing, transformation, and feature engineering  
- Classification modeling and hyperparameter tuning  
- Exploratory data analysis and visualization  
- Model validation and performance evaluation  

### Out-of-Scope Activities  
- Real-time delay prediction or deployment in live TTC systems  
- Integration with third-party APIs or real-time passenger feedback data  
- Financial or budgetary analysis related to TTC operations  

# Data Cleaning  

### Objective  
The goal of this step was to ensure that the TTC delay dataset was accurate, consistent, and ready for analysis. Given that the dataset contained a significant proportion of missing or zero delay values, the team focused on filtering, validation, and appropriate data handling techniques to improve model reliability.

### Steps Taken  
- **Zero-Delay Filtering:**  
  - Analyzed the frequency of zero-delay values within each incident code to determine their impact on data integrity.  
  - Decided to **filter out rows where “Min Delay = 0”**, as these records typically represented incomplete or misclassified incidents.  
  - Considered proxy methods for imputing or approximating zero-delay cases but determined that removal would yield a cleaner dataset for classification.  
- **Handling Missing Values:**  
  - Noted that **65% of entries lacked recorded delay times**, as documented in the Project Overview section.  
  - Retained these entries for categorical trend analysis but excluded them from model training and evaluation.  
- **Variable Assessment:**  
  - Determined that most features were **categorical** ( Station, Time, Incident Type).  
  - Acknowledged that regression models would be limited due to minimal continuous data; hence, **classification models** were prioritized for predicting high-delay events.  
- **Data Validation:** Checked for duplicates, inconsistent station or line names, and invalid entries before finalizing the cleaned dataset.

### Outcome  
The cleaning process produced a structured dataset with standardized values, reduced noise, and improved interpretability. The resulting dataset allowed for meaningful exploratory analysis and effective model training focused on **categorical predictors of delay severity**.

# Exploratory Data Analysis (EDA)

### Objective  
To gain a basic understanding of the dataset structure and relationships between key variables before model development.

### Summary  
- Reviewed feature distributions and overall data balance after cleaning.  
- Examined correlations between categorical variables such as **incident type**, **line**, **time of day**, and recorded **delay duration**.  
- Confirmed that **categorical features** dominate the dataset, reinforcing the decision to use **classification-based models** rather than regression.  
- These insights guided feature selection and informed the model training strategy.

# Machine Learning Modeling and Analysis  

### Objective  
To develop and evaluate machine learning models capable of predicting **high-delay incidents** (defined as delays greater than 5 minutes) on Toronto’s TTC subway network.

### Steps Taken  
- **Problem Definition:** Framed the task as a **binary classification problem** — predicting whether an incident would lead to a high-delay or not.  
- **Data Preparation:** Applied one-hot encoding to categorical features such as Line, Station, and Incident Type. Standardized selected numerical features (e.g., Delay Minutes) where applicable.  
- **Model Selection:** Tested multiple supervised learning algorithms to compare performance and robustness:  
  - Logistic Regression  
  - KNN Classification
- **Model Training:**  
  - Split the dataset into **training and test sets** using an 80/20 ratio.  
  - Applied **GridSearchCV** for hyperparameter tuning and model optimization.  
  - Evaluated each model using cross-validation to ensure consistency.  
- **Evaluation Metrics:**  
  - Accuracy  
  - Precision  
  - Recall  
  - F1-score  
  - ROC-AUC score  

### Results (Summary)  
- Feature importance analysis indicated that **time of day**, **incident type**, and **subway line** were the most predictive factors of high-delay events
- Models with overfitting tendencies (e.g., deep Decision Trees) were regularized to improve generalization.  

### Conclusion  
The modeling process demonstrated that machine learning can effectively predict high-delay incidents using historical TTC delay data. These predictive insights can inform TTC operations teams and planners in developing **data-driven strategies** to improve reliability and minimize service disruptions.

# Conclusion & Key Findings  

This project analyzes **TTC Line 1 delay data** to identify and predict the most significant factors contributing to **high-duration incidents** using machine learning techniques.  
The analysis focuses on understanding how **incident type**, **station**, **time of day**, and **seasonality** influence the likelihood of extended service delays.  

Key insights so far indicate that categorical and temporal variables play a major role in predicting service reliability. Further tuning and validation will refine model performance and ensure better interpretability.  
Final insights, feature importance results, and model performance metrics will be added upon completion of full evaluation.  

### Setup Instructions  
To explore this project locally:  
1. Clone this repository:  
   ```bash
   git clone https://github.com/shahab-malik748/ml13-ttc-delays-project


# Visuals & Credits  

The project will include visualizations such as:  
- **Heatmaps** showing delay frequency by station and time of day.  
- **Bar plots** displaying delay counts by incident type and line.  
- **Seasonal trend charts** highlighting variation in delay frequency across months.  

These visuals will be added after final model evaluation to enhance interpretability and presentation.  
