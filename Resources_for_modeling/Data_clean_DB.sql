-- Remove any spaces in bids_table
SELECT REPLACE(bidder_id,' ','')
FROM bids_table;

SELECT REPLACE(auction,' ','')
FROM bids_table;

SELECT REPLACE(merchandise,' ','')
FROM bids_table;

SELECT REPLACE(device,' ','')
FROM bids_table;

SELECT REPLACE(time,' ','')
FROM bids_table;

SELECT REPLACE(country,' ','')
FROM bids_table;

SELECT REPLACE(ip,' ','')
FROM bids_table;

SELECT REPLACE(url,' ','')
FROM bids_table;

-- Remove any spaces in train_table
SELECT REPLACE(bidder_id,' ','')
FROM train_table;

SELECT REPLACE(payment_account,' ','')
FROM train_table;

SELECT REPLACE(address,' ','')
FROM train_table;

SELECT REPLACE(outcome,' ','')
FROM train_table;

-- Remove any spaces in train_table
SELECT REPLACE(bidder_id,' ','')
FROM test_table;

SELECT REPLACE(payment_account,' ','')
FROM test_table;

SELECT REPLACE(address,' ','')
FROM test_table;

