# From the Billboard Top 100 to the Grammy Awards
## Does inclusion on the Billboard Hot 100 chart increase the likelihood that a song will win a Grammy award?

Each week, the Billboard Top 100 ranks the best songs from multiple genres into a published list. However, the top spot doesn’t guarantee more than a moment of recognition. Using Top 100 Data and Grammy Winners from the past 20 years, our team will analyze datasets to determine if a Grammy winner can be determined based on the Billboard Top 100. Our team selected this topic during the recent Grammy award show on March 14, 2021. The inspiration came from the randomness of the winners, as several songs beat others which our group thought to be popular. Additionally, music brings the world together, and during these times, we can all use a little more music and song. 

The datasets to be used include weekly Billboard Hot 100 songs from 1999 through 2018, and Grammy winners from 1999 through 2018. We will use logistic regression and machine learning to determine if winners can be predicted based on Billboard information. The data was found on Kaggle.com. A total of eight files were provided with music information from sources such as Spotify, Pandora, and International Charts. Our team selected Billboard Top 100 to compare against the Grammy winner file. The Billboard Top 100 data was selected for two reasons. The Billboard Charts have been available since 1958, with the Billboard Top 10 dating back to 1894 (1). Other options available are recent additions to music tracking and charts, thus determined to not provide sufficient inital data nor provide the ability to track further back in history for machine learning training. Second, the Team selected the Billboard Top 100 for how the songs are selected to be on the chart. Like the Grammys, the Billboard Top 100 is chosen each week by a committee and not consumer activity. 


# Data Exploration and Analysis
Upon finding the data, the Team selected Excel to initially explore the data and identify general trends. Excel is not a popular tool for large file exploration or significant file combinations. However, the initial Excel exploration did provide the Team with initial ideas on how to approach the combination and further exploration of the data sets. Once the initial exploration provided some data insight, the Team moved the information to Python and Jupyter notebook for futher analysis. Postgres joins were completed to provide a basis for the machine learning. 

<img src="https://github.com/jratliff1215/final-group-project/blob/main/Final_Project/week_chart.png" width="500" height="320"> 
The image above shows weeks on chart (grouped) for all songs included in Billboard Chart. A regression was completed to determine correlation between weeks on chart and a Grammy win. With a r vlue of 0.0008, the team determined this was not conclusive to confirm our hypothesis. 
<br/><br/>

<img src="https://github.com/jratliff1215/final-group-project/blob/main/Final_Project/peak_position.png" width="500" height="320"> 
The image above groups the peak position on the Billboard chart to a Grammy win. As with the weeks on chart, this was inconclusive in determining Grammy winners from the peak position on the Billboard Chart, with a r value of 0.14. 
<br/><br/>

<img src="https://github.com/jratliff1215/final-group-project/blob/main/Final_Project/Tableau_Chart.PNG" width="500" height="320"> 
Tableau tables and charts have been constructed to provide visualizations of the dataset. These charts show total number of grammy wins compared to the total weeks on the Billboard chart, peak position on the chart, year the song was released, and genre. We have also created a chart that compares the total weeks on the chart and grammy wins based on the song's genre. 


# Machine Learing Model Questions
- Model Selection
  - We chose the logistic regression model because it is used to predict binary outcomes, and the goal of our project is to predict whether or not an artist that is on the Billboard Top 100 Chart will win a Grammy.  Some limitations of this model are that it cannot work with non-linear outcomes and it requires a large data set.
Benefits of this model are that it is simple to implement and make predictions for binary outcomes (yes/no). It is also easy to understand and update with new data to be used in the future.

- Preprocessing
  - Our team used Python in order to clean and preprocess our data. We started by dropping duplicates in the Billboard csv order to get a single instance of each song.  We arranged the data so that the first inclusion illustrated peak position on chart and total weeks on the chart, then dropped all but the first inclusion of each song.  We then dropped the "weekly_rank", "writing_credits", and "lyrics" columns, because they are not relevant for this analysis. In the Grammy CSV, we totaled number of Grammy Awards for each song to get total number of Grammy Wins.  This required elimination of the Grammy Award Title column, which is a limitation of this analysis.

- Database Interfacing
  -  Our MLM interfaces with our data by using a Python string to load cleaned CSVs from a postgres database. We began by using Python to load the cleaned data into 3 Postgres tables - Billboard, Grammy, and Grammy Genre.  We then used a join statement to combine the billboard data with the grammy wins column and grammy genre column. Finally, we used a connection f-string to load this into our MLM.
 
- Feature Engineering & Feature Selection
  - In order to identify the necessary features and maximize the performance of the machine learning model, we dropped Variables: "weekly_rank", "writing_credits", "lyrics". 
  - These variables were not informative for our logistic regression analysis. Dropping these unnecessary variables allowed for our machine learning model to easily read through the independent variables and increased our overall Accuracy Score from 84.62% to 94.12%.
 
- Training & Testing Sets
  - We are using "X" to predict "y".  "y" is the “GrammyAward” column, or the output. "X", or features, is created by dropping the “artists’’ and “name” columns from the DataFrame. Next we used the train_test_split module to split X and y into training and testing sets: X_train, X_test, y_train, y_test. 
   
- Model Traning
  -  We are comparing the actual outcome values from the test set against the model's predicted values. y_test are the outcomes (whether or not an artist that is on the Billboard Top 100 Chart will win a Grammy)from the original dataset that were set aside for testing. The model's predictions, y_pred, were compared with these actual values, y_test. Additional testing in the future can be performed using larger datasets containing Billboard and Grammy information from prior to the year 2000.  

- Accuracy Score
  - 0.9411764705882353 
  - The accuracy score is simply the percentage of predictions that are correct. The accuracy of the logistic regression machine learning model is 94.12%. This shows that the machine learning model will accurately predict whether or not an artist will receive a grammy based on their Billboard Top 100 Chart performance 94.12% of the time.


# Results

Our final model provided an accuracy result of 94.12%. We determined this was significant and to not reject our hypothesis that Billboard Chart information can be used to predict Grammy Winners. In comparison to the original analysis we completed, and as discussed by Hayley, that showed little or no correlation based on numbers, this model allows the user to be comfortable with their prediction. As it is well known, simply looking at a data point, it cannot be assumed what the outcome will be. For example, four-time Grammy Winner Michael Bublé has never been in the Top 20 of the Hot 100 Chart and never exceeded more than 10 weeks on the chart. For the reverse, the international YouTube sensation of Gangnam Style reached the second spot on the chart, remained there for 4 weeks, and spent over 35 weeks on the Hot 100, did NOT win a Grammy. 

At the outset of this project and the initial analysis completed on the dataset, we noted issues with the data set and other considerations we needed to be mindful of throughout the project and when reviewing the hypothesis. The cleaned Billboard information included several thousand data points. However, the set wasn’t complete due to factors such as a song not exiting the chart on our dataset, thus weeks on chart may be inaccurate. If a song was new to the chart, the peak position is likely related to the current position, which may not be where the song actually peaks. By adding this information to the dataset, which would require locating appropriate datasets, our model would likely become more accurate in predicting Grammy winners. 

Throughout most of its time, the Billboard Charts have been compiled based on committee decisions which relied on radio play or cassette or CD purchases. However, in reference to an earlier mention of Gangnam style, The Harvard Business Review published an article written by Kevin Evers, who explained how "Gangnam Style" had changed Billboard's ranking methodology of its music charts. Instead of relying solely on radio plays and paid purchases, Billboard started to place a heavier emphasis on digital sales and YouTube views. This 2017 change in the compilation process of the Hot 100 may have an impact on more recent chart and Grammy winner prediction. .

# Additions
The model accuracy of 94.12% with only one set of data was strong enough to accept our hypothesis. However, we agree that it may be strengthened with the addition of a few items. Most of us have a music streaming app, which typically has Top 10 lists or Hot 100 lists of their own. These lists are available on standard sources, such as Kaggle, and could be applied to current Grammy awards. 

Since the Billboard Hot 100 is compiled each week, an automatic scraper could be used to add the new charts to our database. During the project a web scraper was created to automatically pull in the Billboard Hot 100 each week. However, it was not utilized in the final project due to data mismatch in naming style and we are still working on our Google skills to find solutions on StackOverflow. 

We could elect to not include new data sources but expand the current ones used. Datasets could encompass all data available for the Billboard Chart and the Grammys. The Billboard Chart was first produced in 1894 and produced a magazine which highlighted the cool and popular items of that week, including songs and plays. The Billboard Hot 100 started in 1991 as a modified version of the Honor Roll of Hits that started in 1945. The Grammys first started in 1959 with only 14 categories and have expanded to 84 categories as of 2021. Our model could also be tested on the ability to determine specific category winner if the inputs were available to train and test this possibility. Overall, there are several possible additions to expand the data set, which could be tested to determine if these expansions could improve the accuracy. 

# Presentation Link
- [Google Slides](https://docs.google.com/presentation/d/1gNiLVhv1PRAzBwcYhDEzvymbgdiNwZT_MBioeOvYKPA/edit#slide=id.gce7da8c980_0_82)
- [Tableau Dashboard](https://public.tableau.com/profile/jomol#!/vizhome/BillboardtoGrammyDashboard/BillboardtoGrammy?publish=yes)
