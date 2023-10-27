CREATE VIEW analytics_features_demo.GLM_model_NC as (
SELECT * FROM td_glm (
  ON analytics_features_demo.feature_enriched AS InputTable
  USING
  InputColumns('freq_usage_month','usage_session','encoded_subs_type','scaled_subs_length')
  ResponseColumn('churn')
  Family ('Binomial')
  MaxIterNum (100)
  Tolerance (0.0001)
  Intercept ('true')
) AS dt
);
SELECT * FROM analytics_features_demo.GLM_model_NC;

CREATE VIEW analytics_features_demo.GLM_model_CV as (
SELECT * FROM td_glm (
  ON analytics_features_demo.feature_enriched AS InputTable
  USING
  InputColumns('freq_usage_month','usage_session','scaled_subs_length')
  ResponseColumn('churn')
  Family ('Binomial')
  MaxIterNum (100)
  Tolerance (0.0001)
  Intercept ('true')
) AS dt
);
SELECT * FROM analytics_features_demo.GLM_model_CV;