# Solving the Music Discovery Gap: A Deep Latent-Space Recommendation Engine

![Music Recommendation Header](https://img.shields.io/badge/Specialization-Deep%20Learning-blue)
![Python Version](https://img.shields.io/badge/Python-3.8%2B-green)
![Framework](https://img.shields.io/badge/Framework-TensorFlow%20/%20Keras-orange)

## 📌 1. The Problem
Streaming services often struggle with the **"Long Tail"** of music—the millions of songs that have very few listeners. Traditional Collaborative Filtering fails here because there isn't enough user data to find patterns. 

This project solves this by using **Deep Learning** to build a recommendation engine that understands the "DNA" of a song based solely on its audio characteristics (tempo, energy, valence, etc.), ensuring quality music is discoverable regardless of its current popularity.

## 📊 2. The Data
We utilize the **Spotify Tracks Dataset** containing 114,000+ tracks. Each track is analyzed across 12 quantitative audio features:
- **Mood/Energy:** Valence, Energy, Danceability.
- **Properties:** Tempo, Loudness, Key, Mode.
- **Context:** Acousticness, Instrumentalness, Liveness, Speechiness.

## 🛠 3. The Approach
Instead of basic distance calculations, I built a **Deep Autoencoder** neural network to learn a condensed "feature representation" of music:
- **Preprocessing:** Applied `PowerTransformer` and `MinMaxScaler` to normalize sonic attributes.
- **Dimensionality Reduction:** Compressed 12 features into a **6-Dimensional Latent Space** (Bottleneck layer).
- **Similarity Search:** Generated recommendations by calculating the **Cosine Similarity** between vectors in the learned latent space.
- **Visualization:** Utilized **t-SNE** to map high-dimensional audio data into a 2D space to verify genre clustering.

## 📈 4. Model Performance
| Model | Reconstruction Error (MSE) |
| :--- | :--- |
| PCA (Baseline) | 0.0684 |
| Simple Autoencoder | 0.0452 |
| **Deep Autoencoder** | **0.0382** |

**Clustering Quality:** The model achieved a **Silhouette Score of 0.345**, proving that songs within the same latent clusters share significant sonic similarities.

## 🚀 5. Key Findings & Recommendations
1. **Genre Fluidity:** The model successfully identified "Genre-bending" tracks that exist between traditional labels.
2. **Cold Start Solution:** The engine can recommend brand-new uploads with 0 plays with the same accuracy as mainstream hits.
3. **Business Integration:** Stakeholders should implement this "Sonic DNA" filter to augment current popularity-based discovery algorithms.

## 📁 6. Repository Structure
- `dataset[1].csv`: Raw data source.
- `Capstone_3_Modeling.ipynb`: Complete data pipeline and neural network training.
- `model_metrics.txt`: Detailed hyperparameters and evaluation results.
- `Final_Project_Report.pdf`: Comprehensive analysis and stakeholder recommendations.

---
**Author:** Dylan Brown  
**Specialization:** Deep Learning & Recommendation Systems
