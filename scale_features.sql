CREATE TABLE analytics_features_demo.scaled_dimmensions AS (
SELECT * FROM TD_ScaleFit (
  ON analytics_features_demo.predicting_features AS InputTable
  USING
    TargetColumns ('subs_length','subs_type','freq_usage_month','usage_session')
    ScaleMethod ('RANGE')
) AS t
)WITH DATA;

CREATE TABLE analytics_features_demo.predicting_features_scaled AS (
	SELECT * FROM TD_ColumnTransformer(
		ON analytics_features_demo.predicting_features AS InputTable
		ON analytics_features_demo.scaled_dimmensions AS ScaleFitTable DIMENSION
	)as dt 
) WITH DATA;

SELECT * FROM analytics_features_demo.predicting_features_scaled;