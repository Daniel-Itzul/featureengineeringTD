CREATE VIEW analytics_features_demo.scaled_dimmensions AS (
SELECT * FROM TD_ScaleFit (
  ON analytics_features_demo.churn_data_set AS InputTable
  USING
    TargetColumns ('subs_length')
    ScaleMethod ('RANGE')
) AS t
);

SELECT * from analytics_features_demo.scaled_dimmensions;


CREATE VIEW analytics_features_demo.feature_scaled_subs_length AS (
SELECT * FROM TD_ScaleTransform (
  ON analytics_features_demo.churn_data_set AS InputTable
  ON analytics_features_demo.scaled_dimmensions AS FitTable DIMENSION
  USING
    Accumulate ('user_id')
) AS t
);

SELECT TOP 20 * FROM analytics_features_demo.feature_scaled_subs_length
ORDER BY user_id;

DROP VIEW analytics_features_demo.feature_scaled_subs_length;
DROP VIEW analytics_features_demo.scaled_dimmensions;