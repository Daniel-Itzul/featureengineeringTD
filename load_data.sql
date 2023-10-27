CREATE TABLE analytics_features_demo.churn_data_set AS
(
SELECT 
    user_id,
    subs_type,
    subs_start,
    subs_end,
    subs_length,
    churn,
    freq_usage_month,
    usage_session
FROM(
LOCATION='/gs/storage.googleapis.com/clearscape_analytics_demo_data/DEMO_AIBlogSeries/churn_prediction_dataset.csv') as churn
) WITH DATA;

-- Sampling 20 records to get a sense of the data

SELECT TOP 20 * FROM analytics_features_demo.churn_data_set 
ORDER BY user_id;