# Human-or-Robot-Facebook-Kaggle

## Objective/Purpose
The goal of this project is to identify online auction bids that are placed by "robots", helping the site owners easily flag these users for removal from their site to prevent unfair auction activity. 

## Reason why we chose this topic
It is predicted that online retail sales will reach $6.17 trillion by 2023*. The project focusses on identifying robotic/automated bidders for online auctions. The hope is that the machine learning model could be further improved and developed to not only help with websites like eBay, which rely on bidding for items, but for any online transaction that relies on bidding.
<br>[* Global Ecommerce Explained: Stats and Trends to Watch in 2022](https://www.shopify.ca/enterprise/global-ecommerce-statistics#3)

## Data source description
Our data is from Kaggle Competition: [Facebook Recruiting IV: Human or Robot?](https://www.kaggle.com/competitions/facebook-recruiting-iv-human-or-bot/data)
- Bidder datasets
  - train.csv - the training set from the bidder dataset
  - test.csv - the test set from the bidder dataset

- Bid dataset<br />
  - bids.csv - the bid dataset <br>

The data in this competition comes from an online platform, not from Facebook.

## List of columns for each dataset
- Bidder datasets
  - bidder_id – Unique identifier of a bidder.
  - payment_account – Payment account associated with a bidder. These are obfuscated to protect privacy. 
  - address – Mailing address of a bidder. These are obfuscated to protect privacy. 
  - outcome – Label of a bidder indicating whether or not it is a robot. ***Value 1.0 indicates a robot, where value 0.0 indicates human.*** 
    - The outcome was half hand labeled, half stats-based. There are two types of "bots" with different levels of proof:
      1. Bidders who are identified as bots/fraudulent with clear proof. Their accounts were banned by the auction site.
      2. Bidder who may have just started their business/clicks or their stats exceed from system wide average. There are no clear proof that they are bots. <br />
      
- Bid dataset
  - bid_id - unique id for this bid
  - bidder_id – Unique identifier of a bidder (same as the bidder_id used in train.csv and test.csv)
  - auction – Unique identifier of an auction
  - merchandise –  The category of the auction site campaign, which means the bidder might come to this site by way of searching for "home goods" but ended up bidding  for "sporting goods" - and that leads to this field being "home goods". This categorical field could be a search term, or online advertisement. 
  - device – Phone model of a visitor
  - time - Time that the bid is made (transformed to protect privacy).
  - country - The country that the IP belongs to
  - ip – IP address of a bidder (obfuscated to protect privacy).
  - url - url where the bidder was referred from (obfuscated to protect privacy). 


## Questions hope to answer with the data
In order to improve fairness of bidding competition, can we identify and eliminate (if not greatly reduce) bot generated bids in auctions? </br>

## Data Analysis
- EDA
  1.	[Explore the three dataset](https://github.com/Marwan-Takrouri/Human-or-Robot-Facebook-Kaggle/blob/main/Explore_the_data.ipynb)
  2.	[Clean the data](https://github.com/Marwan-Takrouri/Human-or-Robot-Facebook-Kaggle/blob/main/Data_Cleaning.ipynb): There are 8,859 null values in *country* column in bids dataset. Instead of dropping all the null, we tried [MaxMind GeoIP2 Python API](https://geoip2.readthedocs.io/en/latest/) to acquire country information based on the ip address.
  3.	Store the cleaned bids dataset and bidder dataset (train and test) to PostgreSql locally.
- [Preprocess the data](https://github.com/Marwan-Takrouri/Human-or-Robot-Facebook-Kaggle/blob/main/Preprocessing_the_data.ipynb): 
  1. Transform: Calculate time difference between each bid (new column: *timediff*) and the rank of each bidder within one auction (new column: *bidding_order*). Group by *bidder_id* to understand their behaviour, such as the number of devices the bidder used and the total number of bids the bidder participated. Also group by *bidder_id* and *auction* for better understanding.
  2. Bucket: *Device* and *country* contain more than two hundred of categories, therefore we binned the categories into a smaller number of groups to reduce the effects of minor observation errors.
  3. Encode: Convert object data in <i>merchandise</i>, *device* and *country* columns to numbers that the machine learning model is able to understand and extract valuable information. Then group by bidder_id to obtain more behaviour information of each bidder.
 
- [Machine Learning](https://github.com/Marwan-Takrouri/Human-or-Robot-Facebook-Kaggle/blob/main/Modeling.ipynb)
  1.  Merge train data with processed data, then drop the unnecessary columns (*bidder_id, payment_account, address*) for modeling.
  2.	Split the merged dataset into test and train data
  3.	Scale the merged dataset: comparing the two methods MinMaxScaler and StandardScaler, then choose the one with better accuracy. Finial Choice: *MinMaxScaler*
  4.	Since our data is severely imbalanced (103 robots vs 1,881 human), and our target is predicting categorical labels, we choose several supervised models to find out the best one for final prediction: 
          - Balanced RandomForest Classifier and extract feature importances
          <br> <p align="center"> <img src="https://github.com/Marwan-Takrouri/Human-or-Robot-Facebook-Kaggle/blob/Codes/Images/Importances.png"> </p>
          - Easy Ensemble AdaBoost Classifier Classifier
          - Gradient Boosting Classifier
          - Ada Boost Classifier
  5.	Comparet the model accuracy, confusion matrix, feature importance, recall score of all 4 models. ***Balanced RandomForest Classifie*** has the highest accuracy score 0.8872 and is the one we will apply to test dataset. 
 <br> <p align="center"> <img src="https://github.com/Marwan-Takrouri/Human-or-Robot-Facebook-Kaggle/blob/main/Images/model_comparision.png"> </p> 
  
  6.	Use Balanced RandomForest Classifie to predict test data and get the final result.
  
- [Data Storage](https://github.com/Marwan-Takrouri/Human-or-Robot-Facebook-Kaggle/tree/main/Database)
  1. We are using PostgreSQL for data storage, current choice is PgAdmin 4.

***Branches Updated with new names on 28th may 2022 ***
***Branches and Files updated 05 june 2022***

## Slides added on 28th May 2022
[Human or Robot Final Project](https://docs.google.com/presentation/d/e/2PACX-1vSAzBq0DW5q_teQ5KHmgzMkcZCFw8pFGJNL2bPyhPEparlof1yy_QKsOJSAPeR7BDSdQrDo2pbZu2Dh/pub?start=false&loop=false&delayms=3000)

## Dashboard
There are 3 dashboards in our [Tableau storyboard](https://public.tableau.com/app/profile/jiawen.zhao/viz/human_bots_1_0/EDA#1): EDA, Machine learning, Feature importances. 
