# Analysis of User Behavior in a C2C E-commerce Platform

## Project Overview
This project focuses on analyzing a dataset from a Customer-to-Customer (C2C) e-commerce platform. The main goal is to derive insights into user behaviors and preferences, alongside demographic distributions such as country and language. These insights are vital for platform optimizations, targeted marketing, and enhancing user engagement.

## Dataset Description
The dataset, named `users_data.csv`, consists of 98,913 entries across 24 columns, capturing diverse aspects of user interaction and demographics on the e-commerce platform.

## Tasks and Methodologies

### 1. Data Setup
- **Create a New Schema**: Implemented in MySQL under the schema name `ecommerce`.
- **Data Import**: The CSV file `users_data` was imported into the schema using MySQL's Table Data Import Wizard.

### 2. Initial Data Exploration
- **Table Structure**: Executed SQL queries to examine the schema and initial data (`DESCRIBE users_data;`).
- **Preview Data**: Retrieved the first 100 rows to gauge data arrangement and quality (`SELECT * FROM users_data LIMIT 100;`).

### 3. Demographic Analysis
- **Distinct Values**: Evaluated the number of distinct countries and languages to measure international diversity and platform reach.
- **Gender-Based Analysis**: Analyzed the number of followers between male and female users to determine which gender has higher engagement.

### 4. User Behavior Analysis
- **Profile Features Usage**: Determined the number of users who utilize profile pictures and access the platform via various apps (iOS, Android).
- **Buying and Selling Trends**:
  - Assessed the total number of buyers and sellers per country to explore market strengths and opportunities.
  - Identified top countries by product pass rate to evaluate quality control and user satisfaction.

### 5. Social Preferences and Activity
- **Social Actions by Gender**: Investigated preferences for wishlisting and social liking among female users and buying vs. selling tendencies among male users using UNION operations.

### 6. Recent User Activity
- **Recent Platform Usage**: Listed records for the top 110 most recently active users to provide a snapshot of current user engagement.

### 7. Inactivity and Country-Specific Gender Distribution
- **Inactivity Analysis**: Identified female users who have not logged in for the last 100 days to assess user retention challenges.
- **Gender Distribution**: Compared the number of male and female users across different countries, aiding in demographic segmentation.

### 8. Transaction Analysis
- **Transaction Metrics**: Calculated the average number of products bought and sold by male users in each country to infer consumer behavior and potential sales strategies.

## Results
- **Engagement Levels**: Male users typically have more followers, suggesting higher engagement or influence on the platform.
- **Market Penetration**: Some countries show high numbers of buyers but low numbers of sellers, indicating areas to encourage new sellers.
- **User Preferences**: Observed significant differences in how genders use social features and participate as buyers or sellers, informing personalized marketing strategies.

## Implications
The insights gained from this analysis can assist the e-commerce platform in tailoring its features, marketing, and support services to better meet the needs of its diverse user base. Furthermore, understanding inactive segments and demographic preferences allows for more targeted engagement strategies.
