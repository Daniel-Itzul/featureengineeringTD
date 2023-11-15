CREATE TABLE analytics_features_demo.ordinal_encoding_type AS (
  SELECT * FROM TD_OrdinalEncodingFit (
    ON analytics_features_demo.churn_data_set AS InputTable
    USING
    TargetColumn ('subs_type')
    Approach ('LIST')
    Categories ('Basic','Pro','Premium')
    OrdinalValues (1, 2,3)  
  ) AS dt
  )WITH DATA;
 
SELECT * FROM analytics_features_demo.ordinal_encoding_type;
  
CREATE TABLE analytics_features_demo.predicting_features AS (
SELECT * FROM TD_OrdinalEncodingTransform (
   ON analytics_features_demo.churn_data_set AS InputTable
   ON analytics_features_demo.ordinal_encoding_type AS FitTable Dimension
   USING
   ACCUMULATE ('user_id','subs_length','churn','freq_usage_month','usage_session')  
 ) AS dt
)WITH DATA;

SELECT * FROM analytics_features_demo.predicting_features;