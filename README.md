# 🎵 Spotify Data Analysis and Query Optimization

## 📌 Project Overview

Welcome to the Spotify SQL Data Analysis Project, where we explore music trends, artist insights, and track statistics using SQL. This project involves writing and optimizing 18 SQL queries to uncover patterns in streaming data, track performance, and listener engagement.

## 📂 Dataset Details

#### The dataset consists of various attributes related to tracks, albums, and artists, helping us analyze song performance and popularity.

***SQL
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
    view_by FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);
***
