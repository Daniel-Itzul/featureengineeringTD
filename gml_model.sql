CREATE TABLE analytics_features_demo.GLM_model_NC AS (
SELECT * FROM td_glm (
  ON analytics_features_demo.scaled_dimmensions AS InputTable
  USING
  InputColumns('subs_length','subs_type','freq_usage_month','usage_session')
  ResponseColumn('churn')
  Family ('Binomial')
  MaxIterNum (100)
  Tolerance (0.0001)
  Intercept ('true')
) AS dt
);
SELECT * FROM analytics_features_demo.GLM_model_NC;
