# 🎵 Spotify Data Analysis and Query Optimization

## 📌 Project Overview

Welcome to the Spotify SQL Data Analysis Project, where we explore music trends, artist insights, and track statistics using SQL. This project involves writing and optimizing 18 SQL queries to uncover patterns in streaming data, track performance, and listener engagement.

## 📂 Dataset Details

#### The dataset consists of various attributes related to tracks, albums, and artists, helping us analyze song performance and popularity.

```sql
-- create table
DROP TABLE IF EXISTS spotify;
CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);
```

## 🔍 Query Categories & Insights

### 🎯 Basic Queries (Easy Level)

*  Retrieve tracks with more than 1 billion streams.
* List all albums with their respective artists.
*  Get the total comments for licensed tracks.
*  Find all tracks categorized under single albums.
*  Count the total number of tracks by each artist.

### ⚡ Analytical Queries (Intermediate Level)

* Calculate the average danceability of tracks per album.
* Identify the top 5 tracks with the highest energy levels.
* List tracks with their views & likes for official music videos.
* Compute the total views per album.  
* Compare Spotify vs. YouTube streams for tracks.
* Find the percentage of official music videos vs. non-official uploads.
* Identify the fastest-growing song based on streams per like ratio.

### 🚀 Advanced SQL Techniques (Advanced Level)

* Retrieve the top 3 most-viewed tracks for each artist using window functions.
* Find tracks where the liveness score exceeds the average.
* Use Common Table Expressions (CTEs) to calculate energy range per album.  
* Extract tracks where the energy-to-liveness ratio exceeds 1.2.
* Compute the cumulative sum of likes, ordered by track popularity.
* Predict the next trending song based on high energy, high danceability, and low views.

## 📊 Key Insights

🔹 Tracks with over 1 billion streams are dominated by globally popular artists.  
🔹 Album-based analysis shows that single albums have a higher average energy level than full-length albums.  
🔹 Songs with high danceability and energy tend to have higher engagement and future trending potential.  
🔹 Official music videos make up approximately X% of all video-based track content.  
🔹 Fastest-growing songs are identified by a strong ratio of streams per like, indicating viral trends.  
🔹 Energy-to-liveness ratio helps in identifying tracks suited for live performances.  
🔹 The top 3 most-viewed tracks per artist showcase diverse fanbase interests across different regions.

















