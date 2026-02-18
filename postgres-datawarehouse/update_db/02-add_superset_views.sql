CREATE OR REPLACE VIEW common_analytics.bulls AS 
SELECT * FROM bulls_fact;

CREATE OR REPLACE VIEW common_analytics.car AS 
SELECT * FROM dim_car;

CREATE OR REPLACE VIEW common_analytics.condition AS 
SELECT * FROM dim_condition;

CREATE OR REPLACE VIEW common_analytics.date AS 
SELECT * FROM dim_date;
