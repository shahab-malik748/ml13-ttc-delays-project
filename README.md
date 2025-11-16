# TTC Subway Delays  
**Data Science Institute – Cohort 7 – Machine Learning Team 13 Project**

## Goal  
This project investigates the relationship between key factors and significant delay occurance on Toronto’s **TTC subway system**.
By leveraging data analytics and machine learning techniques, the team aims to identify the most influential operational, temporal, and situational variables that contribute to extended service disruptions.
# Members  
* Jamal Hassan Bagheri  
* Shahab Malik  
* Rohan Kulkarni  
* Arman Kavalekar

# Project Overview  

##### Source: [Toronto Open Data – TTC Subway Delay Data](https://open.toronto.ca/dataset/ttc-subway-delay-data/)  
##### Features: Date, Time, Day, Station, Line, Delay Minutes, Vehicle, Incident Type and code, Direction, Gap time between trains

Over the past few years, the **Toronto Transit Commission (TTC)** has consistently **underperformed compared to major metropolitan transit systems**, with customers frequently expressing concerns about its reliability and punctuality.  
Delays caused by **technical malfunctions**, **criminal or mental health-related incidents**, and **adverse weather conditions** have increasingly disrupted service, particularly during weekday rush hours, when the commuter impact is most severe.  

Our objective is to identify the extent to which **significant delay occurances** and **controllable delays** can be predicted from selected features using machine learning algorithms.

# Key stakeholders

The key stakeholders for this project include 
- **TTC Planning & Operations Staff:** Utilize predictive insights to optimize scheduling, resource allocation, and system maintenance.  
- **Transit Data Analysts:** Leverage the developed model for ongoing monitoring and performance evaluation.  
- **Commuters & Policy Makers:** Benefit indirectly through reduced delays, improved service reliability, and data-driven decision-making in public transportation planning.  

# Limitations

While the dataset provides valuable operational information, certain limitations exist:  
- **Missed delay data for 65% of the dataset**: Data provided by the City of Toronto has missing values for delay duration in approximately 65% of incident reports.  
- **Incomplete incident descriptions** may reduce clarity in root-cause analysis.  
- **Temporal bias**: data is limited to certain months or years, which may not capture continuous long-term seasonal patterns.  

Despite these constraints, this project offers **data-driven insights** into when delays occur, what the causes are and how predictive analytics can help **improve operational efficiency and commuter satisfaction** across the TTC network.

# Project Scope  

### In-Scope Activities  
- Data preprocessing, transformation, and feature engineering  
- Classification modeling and hyperparameter tuning  
- Exploratory data analysis and visualization  
- Model validation and performance evaluation  

### Out-of-Scope Activities  
- Real-time delay prediction or deployment in live TTC systems  
- Integration with third-party APIs or real-time passenger feedback data  
- Financial or budgetary analysis related to TTC operations  

# Methodology  
  
- **Data Collection:** 
    Retrieved TTC Subway Delay data from the [Toronto Open Data portal](https://open.toronto.ca/dataset/ttc-subway-delay-data/).  

- **Data Preprocessing**  
  - Converted raw `.xls` files into structured `.csv` formats.  
  - Loaded CSV files into **SQLite** to perform initial data transformations and filtering.  
  - Utilized **SQL queries** to clean and aggregate the data, then exported the transformed outputs back to CSV files for further analysis.  
  
    **Zero-Delay Filtering:**  
    - Analyzed the frequency of zero-delay values within each incident code to determine their impact on data integrity.  
    - Decided to **filter out rows where “Min Delay = 0”**, as these records typically represented incomplete or misclassified incidents.  
    - Considered proxy methods for imputing or approximating zero-delay cases but determined that removal would yield a cleaner dataset for classification. 
    **Variable Assessment:**  
    - Determined that most features were **categorical** ( Station, Time, Incident Type).  
    - Acknowledged that regression models would be limited due to minimal continuous data; hence, **classification models** were prioritized for predicting high-delay events.  
    **Data Validation:** 
    - Checked for duplicates, inconsistent station or line names, and invalid entries before finalizing the cleaned dataset.
    - The cleaning process produced a structured dataset with standardized values, reduced noise, and improved interpretability. The resulting dataset allowed for meaningful exploratory analysis and effective model training focused on **categorical predictors of delay severity**.
    - Loaded the transformed data into **Python** for exploratory analysis and modeling.

- **Feature Engineering:** 
  - Created new features such as *rush-hour flag*, *day-of-week*, *significant delay categories* and *controllable delay*.
  - *Significant delay categories* were created by rolling up delay codes into technical, staff, cummuter, weather and miscellaneous
  - *Controllable delay flag* was defined as follows:
    -  **Controllable** (1): All delay codes which refer to a situation which can be addressed/resolved by TTC unilaterally, like technical            issues relating to the track and cars and unavailability of staff.
    - **Non-Controllable** (0): All delay codes which refer to a situations outside of TTCs control, like suspicious package, elevators down, police investigation, weather, etc.
    - We have a total of 129 delay codes. Using the rationale mentioned above, we have classified 72 out of the 129 delay codes to be controllable.
  - Dropped features like *year*, *station*, *direction* due to irrelevance or incomplete/junk data.
  - Standardized numerical features like *month*, *date* , *hour*.
  - One-hot-encoded categorical variables like *delay category* and *subway line*.

- **Model Development & Evaluation:**  
  - Installed the required libraries and packages in python.
  - Built supervised learning models to predict a **significant delay occurance** and **controllable delay**  from features. (delay >= 10 minutes)
  - Used **train-test split** to separate data for training and evaluation.  
  - Applied **GridSearchCV** for hyperparameter tuning and model validation.  
  - Fitted classification algorithms such as **K-Nearest Neighbors** and **Multi-layer Perceptron using Dense Layer** .
  - Assessed performance using metrics including **accuracy**, **precision**, **recall**, **F1-score** and **ROC-AUC**.  
  - **Visualization & Insight** Created clear graphical representations to interpret confusion matrix for KNN, and feature importance using SHAP analysis for MLP model.  
  - **Conclusion:** Summarized findings and identified the most predictive features contributing to controllable delays incidents.

# Technical Stack  

#### Programming Language  
- **Python**
- **SQL**

#### Tools & Framework  
- **Microsoft Excel:** For the initial observation of the contents of raw data files
- **SQLite:** For structured data storage and SQL-based preprocessing
- **Jupyter Notebook:** For reproducible workflow documentation and collaborative analysis
- **Pandas & NumPy:** For data manipulation and numerical analysis  
- **Matplotlib:** For exploratory visualization and trend analysis  
- **Scikit-learn:** For machine learning model development and evaluation  


# Results

  ### KNN Classification to predict **significant delay**

<img width="667" height="551" alt="image" src="https://github.com/user-attachments/assets/da1d6adf-1392-468d-91ca-f101e8e71c70" />


  ### MLP with dense layer to predict **significant delay

  
  ### KNN Classification to predict **controllable delay**
Refer to : https://github.com/shahab-malik748/ml13-ttc-delays-project/blob/main/Classification/KNN_Classification_Controllable_Delay.ipynb
  ### MLP with dense layer to predict **controllable delay**
Refer to : https://github.com/shahab-malik748/ml13-ttc-delays-project/blob/main/Regression/MLP%20-%20controllable%20delay.ipynb

# Conclusion & Key Findings  

- KNN Classification and MLP with dense layer were inadequate in predicting **significant delays**.
- However the models were classify **controllabe delays** to a good extent. 

Further tuning and validation will refine model performance and ensure better prediction evaluation metrics.  
 

### Reproduction Instructions  
To explore this project locally, clone this repository https://github.com/shahab-malik748/ml13-ttc-delays-project
