CREATE USER superset_app WITH PASSWORD 'pwd';

GRANT CONNECT ON DATABASE dwh TO superset_app;
GRANT USAGE ON SCHEMA common_analytics TO superset_app;
GRANT SELECT ON ALL TABLES IN SCHEMA common_analytics TO superset_app;
ALTER DEFAULT PRIVILEGES IN SCHEMA common_analytics GRANT SELECT ON TABLES TO superset_app;

REVOKE ALL ON SCHEMA public FROM superset_app;

ALTER USER superset_app SET search_path = common_analytics
