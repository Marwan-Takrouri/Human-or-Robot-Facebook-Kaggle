# Human-or-Robot-Facebook-Kaggle

## Topic
The goal of this project is to identify online auction bids that are placed by "robots", helping the site owners easily flag these users for removal from their site to prevent unfair auction activity. 

## Reason why choose this topic
It is predicted that online retail sales will reach $6.17 trillion by 2023*. The project focusses on identifying robotic/automated bidders for online auctions. The hope is that the machine learning model could be further improved and developed to not only help with websites like eBay, which rely on bidding for items, but for any online transaction that relies on bidding.
<br>[* Global Ecommerce Explained: Stats and Trends to Watch in 2022](https://www.shopify.ca/enterprise/global-ecommerce-statistics#3)

## Description of the source of data
Our data is from Kaggle Competition: [Facebook Recruiting IV: Human or Robot?](https://www.kaggle.com/competitions/facebook-recruiting-iv-human-or-bot/data)
- Bidder datasets
  - train.csv - the training set from the bidder dataset
  - test.csv - the test set from the bidder dataset
- Bid dataset<br />
  - bids.csv - the bid dataset <br>
  
The data in this competition comes from an online platform, not from Facebook.

## Questions hope to answer with the data
In order to improve fairness of bidding competition, can we identify and eliminate computer generated bidding auction? </br>

## Plans to do for the dataset
- EDA
  1.	[Roughly explore the data](https://github.com/Marwan-Takrouri/Human-or-Robot-Facebook-Kaggle/blob/jiawen/Explore_the_data.ipynb)
  2.	Replace the bidder_id in bidder dataset to a shorter format to save memory and computational time.
  3.	Merge each bidder dataset separately to bids, since all train and test data are unique. This step could be done with PostgreSQL, and store in a new database.
  4.	Add some visualizations to describe our cleaned data (Optional)
  5.	Preprocess the data: clean (i.e. missing values) and transform, drop unnecessary columns, bucket, encode, scale for machine learning
- Machine Learning
  1.	Split the merged dataset into test and train data
  2.	If the data is imbalanced, use undersampling or oversampling models
  3.	We have both test and train data, and target is predicting categorical labels, so we will choose several supervised models: Easy Ensemble AdaBoost Classifier, Deep Learning, Random Forest Classifier 
  4.	Check model results, such as accuracy, confusion matrix, feature importance, recall score, to get the best performance to predict the robot bidders. 

**About Individual Branches: We didn't assign specific task to each member yet, thus we just used our name. Later we will rename each branch to corresponding task name.**
