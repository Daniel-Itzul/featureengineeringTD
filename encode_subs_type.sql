CREATE VIEW analytics_features_demo.ordinal_encoding_type AS (
  SELECT * FROM TD_OrdinalEncodingFit (
    ON churn_data_set AS InputTable
    USING
    TargetColumn ('subs_type')
    Approach ('LIST')
    Categories ('Basic','Pro','Premium')
    OrdinalValues (1, 2,3)  
  ) AS dt
  );

 SELECT * FROM analytics_features_demo.ordinal_encoding_type;

CREATE VIEW analytics_features_demo.feature_encoded_subs_type AS (
SELECT * FROM TD_OrdinalEncodingTransform (
   ON analytics_features_demo.churn_data_set AS InputTable
   ON analytics_features_demo.ordinal_encoding_type AS FitTable Dimension
   USING
   ACCUMULATE ('user_id')  
 ) AS dt
);

SELECT TOP 20 * FROM analytics_features_demo.feature_encoded_subs_type
ORDER BY user_id;