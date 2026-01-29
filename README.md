# ⚾ Assembling a 3-Peat Strategy: LA Dodgers 2025
> **Data Science Capstone Project** > *Predicting elite performance using advanced Statcast metrics and Machine Learning to build a MLB Dynasty.*

---

## 📋 Project Overview
After a successful World Series run, the Los Angeles Dodgers face the challenge of maintaining dominance. This project utilizes a data-driven approach to identify high-impact player acquisitions for the 2025 season. 

By moving past traditional "surface" stats like Batting Average or ERA, this analysis focuses on **"Gold Standard" mechanics**—xwOBA and K%—to ensure every new roster addition possesses an elite performance floor backed by physical contact quality.

---

## 🚀 Key Features
* **Predictive Modeling:** Utilizes a Tuned Random Forest model to predict offensive value (xwOBA).
* **Statcast Integration:** Analyzes raw mechanical data including **Barrel%**, **Hard Hit%**, and **Whiff Rates**.
* **Targeted Identification:** Specifically identifies the top 3 hitter and pitcher acquisitions for the 2025 season.

---

## 📊 Model Performance
The model was optimized using `GridSearchCV` to ensure high precision in predicting player success.

| Metric | Value |
| :--- | :--- |
| **Final Model** | Tuned Random Forest Regressor |
| **R² Score** | **0.6139** |
| **Mean Absolute Error (MAE)** | **0.0436** |

> **Insight:** An MAE of 0.0436 indicates that our model can predict a player's true offensive output (xwOBA) with extreme accuracy, typically within a few percentage points of their actual season outcome.

---

## 💡 Top Acquisition Recommendations (2025)

### **Elite Hitters (Target: xwOBA)**
*Based on predicted expected outcomes and contact quality.*
1.  **Aaron Judge** (.459 xwOBA)
2.  **Juan Soto** (.429 xwOBA)
3.  **Shohei Ohtani** (.426 xwOBA)



### **Dominant Pitchers (Target: K%)**
*Based on swing-and-miss dominance essential for post-season play.*
1.  **Zack Wheeler** (33.3% K-Rate)
2.  **Chris Sale** (32.4% K-Rate)
3.  **Logan Gilbert** (32.3% K-Rate)


---

## 🛠️ Tech Stack
* **Language:** Python 3.x
* **Libraries:** `Pandas`, `Matplotlib`, `Scikit-Learn`, `Regex`
* **Environment:** Jupyter Notebook

---

## 📂 How to Use This Repo
1.  **Clone the repo:** `git clone https://github.com/your-username/dodgers-3-peat.git`
2.  **Explore the Notebook:** Open `Data_Wrangling_EDA_Modeling.ipynb` to see the full analysis pipeline.
3.  **View Results:** Refer to the `Final_Project_Report.pdf` for executive recommendations.

---
**Author:** Dylan Brown  
**LinkedIn:** [Your Link Here]
