CREATE TABLE analytics_features_demo.GLM_model AS (
SELECT * FROM td_glm (
  ON analytics_features_demo.predicting_features_scaled AS InputTable
  USING
  InputColumns('subs_length','subs_type','freq_usage_month','usage_session')
  ResponseColumn('churn')
  Family ('Binomial')
  MaxIterNum (300)
  Tolerance (0.0001)
  Intercept ('true')
) AS dt
)WITH DATA;

SELECT * FROM analytics_features_demo.GLM_model;