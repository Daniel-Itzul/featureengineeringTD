CREATE VIEW analytics_features_demo.feature_enriched AS
SELECT 
    base_data.*,
    encoded_subs_type.subs_type as encoded_subs_type,
    scaled_subs_length.subs_length as scaled_subs_length
FROM 
    analytics_features_demo.churn_data_set AS base_data
JOIN 
    analytics_features_demo.feature_encoded_subs_type 
    AS encoded_subs_type ON base_data.user_id = encoded_subs_type.user_id
JOIN 
    analytics_features_demo.feature_scaled_subs_length 
    AS scaled_subs_length ON base_data.user_id = scaled_subs_length.user_id;

SELECT TOP 20 * FROM analytics_features_demo.feature_enriched
ORDER BY user_id;