⚾ Assembling a 3-Peat Strategy: LA Dodgers 2025
Data Science Capstone Project > Predicting elite performance using advanced Statcast metrics and Machine Learning.

📋 Project Overview
This project identifies high-impact player acquisitions for the Los Angeles Dodgers to maintain their championship dominance into the 2025 season. By moving past traditional stats like Batting Average and ERA, this analysis utilizes "Gold Standard" metrics (xwOBA and K%) to identify players whose underlying mechanics guarantee an elite performance floor.

🚀 Key Features
Predictive Modeling: A Tuned Random Forest model predicting hitter success with an MAE of 0.0436.

Statcast Integration: Analysis of raw mechanics including Barrel%, Exit Velocity, and Whiff rates.

Automated Pipeline: Custom Python functions to clean and standardize messy MLB statistical exports.

📊 Model Performance
The final model was optimized to prioritize precision, ensuring that "outlier" talents are correctly identified. | Metric | Value | | :--- | :--- | | Model | Random Forest Regressor | | R² Score | 0.6139 | | MAE | 0.0436 |

💡 Top Recommendations for 2025
Based on the 2025 projection model, the following targets are recommended for the front office:

Hitters (Target: xwOBA)
Aaron Judge (.459)

Juan Soto (.429)

Shohei Ohtani (.426)

Pitchers (Target: K%)
Zack Wheeler (33.3%)

Chris Sale (32.4%)

Logan Gilbert (32.3%)

🛠️ Tech Stack
Language: Python 3.x

Libraries: Pandas, Matplotlib, Scikit-Learn, Regex

Environment: Jupyter Notebook

📂 Repository Structure
data/: Contains the raw stats (4).csv and stats (5).csv files.

notebooks/: The main Data_Wrangling_EDA_Modeling.ipynb containing all logic.

reports/: The final PDF report and technical metrics summary.
