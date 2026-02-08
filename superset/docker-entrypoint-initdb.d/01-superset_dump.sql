--
-- PostgreSQL database dump
--

\restrict DrCbIeO3gf8gDrJbx8hde1o6HRPjbpkMYEz8bcl7S7PHvHra5kdbZzQj2vovrt2

-- Dumped from database version 15.15
-- Dumped by pg_dump version 15.15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.user_favorite_tag DROP CONSTRAINT IF EXISTS user_favorite_tag_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.user_favorite_tag DROP CONSTRAINT IF EXISTS user_favorite_tag_tag_id_fkey;
ALTER TABLE IF EXISTS ONLY public.user_attribute DROP CONSTRAINT IF EXISTS user_attribute_welcome_dashboard_id_fkey;
ALTER TABLE IF EXISTS ONLY public.user_attribute DROP CONSTRAINT IF EXISTS user_attribute_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.user_attribute DROP CONSTRAINT IF EXISTS user_attribute_created_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.user_attribute DROP CONSTRAINT IF EXISTS user_attribute_changed_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.tagged_object DROP CONSTRAINT IF EXISTS tagged_object_tag_id_fkey;
ALTER TABLE IF EXISTS ONLY public.tagged_object DROP CONSTRAINT IF EXISTS tagged_object_created_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.tagged_object DROP CONSTRAINT IF EXISTS tagged_object_changed_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.tag DROP CONSTRAINT IF EXISTS tag_created_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.tag DROP CONSTRAINT IF EXISTS tag_changed_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.tables DROP CONSTRAINT IF EXISTS tables_database_id_fkey;
ALTER TABLE IF EXISTS ONLY public.tables DROP CONSTRAINT IF EXISTS tables_created_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.tables DROP CONSTRAINT IF EXISTS tables_changed_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.table_schema DROP CONSTRAINT IF EXISTS table_schema_tab_state_id_fkey;
ALTER TABLE IF EXISTS ONLY public.table_schema DROP CONSTRAINT IF EXISTS table_schema_database_id_fkey;
ALTER TABLE IF EXISTS ONLY public.table_schema DROP CONSTRAINT IF EXISTS table_schema_created_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.table_schema DROP CONSTRAINT IF EXISTS table_schema_changed_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.table_columns DROP CONSTRAINT IF EXISTS table_columns_created_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.table_columns DROP CONSTRAINT IF EXISTS table_columns_changed_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.tab_state DROP CONSTRAINT IF EXISTS tab_state_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.tab_state DROP CONSTRAINT IF EXISTS tab_state_latest_query_id_fkey;
ALTER TABLE IF EXISTS ONLY public.tab_state DROP CONSTRAINT IF EXISTS tab_state_database_id_fkey;
ALTER TABLE IF EXISTS ONLY public.tab_state DROP CONSTRAINT IF EXISTS tab_state_created_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.tab_state DROP CONSTRAINT IF EXISTS tab_state_changed_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.ssh_tunnels DROP CONSTRAINT IF EXISTS ssh_tunnels_database_id_fkey;
ALTER TABLE IF EXISTS ONLY public.sql_metrics DROP CONSTRAINT IF EXISTS sql_metrics_created_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.sql_metrics DROP CONSTRAINT IF EXISTS sql_metrics_changed_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.slices DROP CONSTRAINT IF EXISTS slices_table_id_fkey;
ALTER TABLE IF EXISTS ONLY public.slices DROP CONSTRAINT IF EXISTS slices_last_saved_by_fk;
ALTER TABLE IF EXISTS ONLY public.slices DROP CONSTRAINT IF EXISTS slices_created_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.slices DROP CONSTRAINT IF EXISTS slices_changed_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.saved_query DROP CONSTRAINT IF EXISTS saved_query_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.tab_state DROP CONSTRAINT IF EXISTS saved_query_id;
ALTER TABLE IF EXISTS ONLY public.saved_query DROP CONSTRAINT IF EXISTS saved_query_db_id_fkey;
ALTER TABLE IF EXISTS ONLY public.saved_query DROP CONSTRAINT IF EXISTS saved_query_created_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.saved_query DROP CONSTRAINT IF EXISTS saved_query_changed_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.row_level_security_filters DROP CONSTRAINT IF EXISTS row_level_security_filters_created_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.row_level_security_filters DROP CONSTRAINT IF EXISTS row_level_security_filters_changed_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.rls_filter_tables DROP CONSTRAINT IF EXISTS rls_filter_tables_table_id_fkey;
ALTER TABLE IF EXISTS ONLY public.rls_filter_tables DROP CONSTRAINT IF EXISTS rls_filter_tables_rls_filter_id_fkey;
ALTER TABLE IF EXISTS ONLY public.rls_filter_roles DROP CONSTRAINT IF EXISTS rls_filter_roles_role_id_fkey;
ALTER TABLE IF EXISTS ONLY public.rls_filter_roles DROP CONSTRAINT IF EXISTS rls_filter_roles_rls_filter_id_fkey;
ALTER TABLE IF EXISTS ONLY public.report_schedule DROP CONSTRAINT IF EXISTS report_schedule_database_id_fkey;
ALTER TABLE IF EXISTS ONLY public.report_schedule DROP CONSTRAINT IF EXISTS report_schedule_dashboard_id_fkey;
ALTER TABLE IF EXISTS ONLY public.report_schedule DROP CONSTRAINT IF EXISTS report_schedule_created_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.report_schedule DROP CONSTRAINT IF EXISTS report_schedule_chart_id_fkey;
ALTER TABLE IF EXISTS ONLY public.report_schedule DROP CONSTRAINT IF EXISTS report_schedule_changed_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.report_recipient DROP CONSTRAINT IF EXISTS report_recipient_report_schedule_id_fkey;
ALTER TABLE IF EXISTS ONLY public.report_recipient DROP CONSTRAINT IF EXISTS report_recipient_created_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.report_recipient DROP CONSTRAINT IF EXISTS report_recipient_changed_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.report_execution_log DROP CONSTRAINT IF EXISTS report_execution_log_report_schedule_id_fkey;
ALTER TABLE IF EXISTS ONLY public.query DROP CONSTRAINT IF EXISTS query_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.query DROP CONSTRAINT IF EXISTS query_database_id_fkey;
ALTER TABLE IF EXISTS ONLY public.logs DROP CONSTRAINT IF EXISTS logs_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.key_value DROP CONSTRAINT IF EXISTS key_value_created_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.key_value DROP CONSTRAINT IF EXISTS key_value_changed_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.themes DROP CONSTRAINT IF EXISTS fk_themes_created_by_fk_ab_user;
ALTER TABLE IF EXISTS ONLY public.themes DROP CONSTRAINT IF EXISTS fk_themes_changed_by_fk_ab_user;
ALTER TABLE IF EXISTS ONLY public.table_columns DROP CONSTRAINT IF EXISTS fk_table_columns_table_id_tables;
ALTER TABLE IF EXISTS ONLY public.sqlatable_user DROP CONSTRAINT IF EXISTS fk_sqlatable_user_user_id_ab_user;
ALTER TABLE IF EXISTS ONLY public.sqlatable_user DROP CONSTRAINT IF EXISTS fk_sqlatable_user_table_id_tables;
ALTER TABLE IF EXISTS ONLY public.sql_metrics DROP CONSTRAINT IF EXISTS fk_sql_metrics_table_id_tables;
ALTER TABLE IF EXISTS ONLY public.slice_user DROP CONSTRAINT IF EXISTS fk_slice_user_user_id_ab_user;
ALTER TABLE IF EXISTS ONLY public.slice_user DROP CONSTRAINT IF EXISTS fk_slice_user_slice_id_slices;
ALTER TABLE IF EXISTS ONLY public.report_schedule_user DROP CONSTRAINT IF EXISTS fk_report_schedule_user_user_id_ab_user;
ALTER TABLE IF EXISTS ONLY public.report_schedule_user DROP CONSTRAINT IF EXISTS fk_report_schedule_user_report_schedule_id_report_schedule;
ALTER TABLE IF EXISTS ONLY public.embedded_dashboards DROP CONSTRAINT IF EXISTS fk_embedded_dashboards_dashboard_id_dashboards;
ALTER TABLE IF EXISTS ONLY public.dashboards DROP CONSTRAINT IF EXISTS fk_dashboards_theme_id_themes;
ALTER TABLE IF EXISTS ONLY public.dashboard_user DROP CONSTRAINT IF EXISTS fk_dashboard_user_user_id_ab_user;
ALTER TABLE IF EXISTS ONLY public.dashboard_user DROP CONSTRAINT IF EXISTS fk_dashboard_user_dashboard_id_dashboards;
ALTER TABLE IF EXISTS ONLY public.dashboard_slices DROP CONSTRAINT IF EXISTS fk_dashboard_slices_slice_id_slices;
ALTER TABLE IF EXISTS ONLY public.dashboard_slices DROP CONSTRAINT IF EXISTS fk_dashboard_slices_dashboard_id_dashboards;
ALTER TABLE IF EXISTS ONLY public.dashboard_roles DROP CONSTRAINT IF EXISTS fk_dashboard_roles_role_id_ab_role;
ALTER TABLE IF EXISTS ONLY public.dashboard_roles DROP CONSTRAINT IF EXISTS fk_dashboard_roles_dashboard_id_dashboards;
ALTER TABLE IF EXISTS ONLY public.favstar DROP CONSTRAINT IF EXISTS favstar_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.dynamic_plugin DROP CONSTRAINT IF EXISTS dynamic_plugin_created_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.dynamic_plugin DROP CONSTRAINT IF EXISTS dynamic_plugin_changed_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.dbs DROP CONSTRAINT IF EXISTS dbs_created_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.dbs DROP CONSTRAINT IF EXISTS dbs_changed_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.database_user_oauth2_tokens DROP CONSTRAINT IF EXISTS database_user_oauth2_tokens_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.database_user_oauth2_tokens DROP CONSTRAINT IF EXISTS database_user_oauth2_tokens_database_id_fkey;
ALTER TABLE IF EXISTS ONLY public.database_user_oauth2_tokens DROP CONSTRAINT IF EXISTS database_user_oauth2_tokens_created_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.database_user_oauth2_tokens DROP CONSTRAINT IF EXISTS database_user_oauth2_tokens_changed_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.dashboards DROP CONSTRAINT IF EXISTS dashboards_created_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.dashboards DROP CONSTRAINT IF EXISTS dashboards_changed_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.css_templates DROP CONSTRAINT IF EXISTS css_templates_created_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.css_templates DROP CONSTRAINT IF EXISTS css_templates_changed_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.annotation DROP CONSTRAINT IF EXISTS annotation_layer_id_fkey;
ALTER TABLE IF EXISTS ONLY public.annotation_layer DROP CONSTRAINT IF EXISTS annotation_layer_created_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.annotation_layer DROP CONSTRAINT IF EXISTS annotation_layer_changed_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.annotation DROP CONSTRAINT IF EXISTS annotation_created_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.annotation DROP CONSTRAINT IF EXISTS annotation_changed_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.ab_user_role DROP CONSTRAINT IF EXISTS ab_user_role_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.ab_user_role DROP CONSTRAINT IF EXISTS ab_user_role_role_id_fkey;
ALTER TABLE IF EXISTS ONLY public.ab_user_group DROP CONSTRAINT IF EXISTS ab_user_group_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.ab_user_group DROP CONSTRAINT IF EXISTS ab_user_group_group_id_fkey;
ALTER TABLE IF EXISTS ONLY public.ab_user DROP CONSTRAINT IF EXISTS ab_user_created_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.ab_user DROP CONSTRAINT IF EXISTS ab_user_changed_by_fk_fkey;
ALTER TABLE IF EXISTS ONLY public.ab_permission_view DROP CONSTRAINT IF EXISTS ab_permission_view_view_menu_id_fkey;
ALTER TABLE IF EXISTS ONLY public.ab_permission_view_role DROP CONSTRAINT IF EXISTS ab_permission_view_role_role_id_fkey;
ALTER TABLE IF EXISTS ONLY public.ab_permission_view_role DROP CONSTRAINT IF EXISTS ab_permission_view_role_permission_view_id_fkey;
ALTER TABLE IF EXISTS ONLY public.ab_permission_view DROP CONSTRAINT IF EXISTS ab_permission_view_permission_id_fkey;
ALTER TABLE IF EXISTS ONLY public.ab_group_role DROP CONSTRAINT IF EXISTS ab_group_role_role_id_fkey;
ALTER TABLE IF EXISTS ONLY public.ab_group_role DROP CONSTRAINT IF EXISTS ab_group_role_group_id_fkey;
DROP INDEX IF EXISTS public.ti_user_id_changed_on;
DROP INDEX IF EXISTS public.ti_dag_state;
DROP INDEX IF EXISTS public.ix_tagged_object_object_id;
DROP INDEX IF EXISTS public.ix_table_schema_id;
DROP INDEX IF EXISTS public.ix_tab_state_id;
DROP INDEX IF EXISTS public.ix_ssh_tunnels_uuid;
DROP INDEX IF EXISTS public.ix_ssh_tunnels_database_id;
DROP INDEX IF EXISTS public.ix_sql_editor_id;
DROP INDEX IF EXISTS public.ix_row_level_security_filters_filter_type;
DROP INDEX IF EXISTS public.ix_report_schedule_active;
DROP INDEX IF EXISTS public.ix_report_recipient_report_schedule_id;
DROP INDEX IF EXISTS public.ix_report_execution_log_start_dttm;
DROP INDEX IF EXISTS public.ix_report_execution_log_report_schedule_id;
DROP INDEX IF EXISTS public.ix_query_results_key;
DROP INDEX IF EXISTS public.ix_logs_user_id_dttm;
DROP INDEX IF EXISTS public.ix_key_value_uuid;
DROP INDEX IF EXISTS public.ix_key_value_expires_on;
DROP INDEX IF EXISTS public.ix_creation_method;
DROP INDEX IF EXISTS public.ix_cache_keys_datasource_uid;
DROP INDEX IF EXISTS public.idx_view_menu_id;
DROP INDEX IF EXISTS public.idx_user_id_database_id;
DROP INDEX IF EXISTS public.idx_user_id;
DROP INDEX IF EXISTS public.idx_user_group_id;
DROP INDEX IF EXISTS public.idx_theme_is_system_default;
DROP INDEX IF EXISTS public.idx_theme_is_system_dark;
DROP INDEX IF EXISTS public.idx_role_id;
DROP INDEX IF EXISTS public.idx_permission_view_id;
DROP INDEX IF EXISTS public.idx_permission_id;
DROP INDEX IF EXISTS public.idx_group_role_id;
DROP INDEX IF EXISTS public.idx_group_id;
ALTER TABLE IF EXISTS ONLY public.user_attribute DROP CONSTRAINT IF EXISTS user_attribute_pkey;
ALTER TABLE IF EXISTS ONLY public.tables DROP CONSTRAINT IF EXISTS uq_tables_uuid;
ALTER TABLE IF EXISTS ONLY public.table_columns DROP CONSTRAINT IF EXISTS uq_table_columns_uuid;
ALTER TABLE IF EXISTS ONLY public.table_columns DROP CONSTRAINT IF EXISTS uq_table_columns_column_name;
ALTER TABLE IF EXISTS ONLY public.sql_metrics DROP CONSTRAINT IF EXISTS uq_sql_metrics_uuid;
ALTER TABLE IF EXISTS ONLY public.sql_metrics DROP CONSTRAINT IF EXISTS uq_sql_metrics_metric_name;
ALTER TABLE IF EXISTS ONLY public.slices DROP CONSTRAINT IF EXISTS uq_slices_uuid;
ALTER TABLE IF EXISTS ONLY public.saved_query DROP CONSTRAINT IF EXISTS uq_saved_query_uuid;
ALTER TABLE IF EXISTS ONLY public.row_level_security_filters DROP CONSTRAINT IF EXISTS uq_rls_name;
ALTER TABLE IF EXISTS ONLY public.report_schedule DROP CONSTRAINT IF EXISTS uq_report_schedule_name_type;
ALTER TABLE IF EXISTS ONLY public.dbs DROP CONSTRAINT IF EXISTS uq_dbs_uuid;
ALTER TABLE IF EXISTS ONLY public.dashboards DROP CONSTRAINT IF EXISTS uq_dashboards_uuid;
ALTER TABLE IF EXISTS ONLY public.dashboard_slices DROP CONSTRAINT IF EXISTS uq_dashboard_slice;
ALTER TABLE IF EXISTS ONLY public.tagged_object DROP CONSTRAINT IF EXISTS uix_tagged_object;
ALTER TABLE IF EXISTS ONLY public.themes DROP CONSTRAINT IF EXISTS themes_uuid_key;
ALTER TABLE IF EXISTS ONLY public.themes DROP CONSTRAINT IF EXISTS themes_pkey;
ALTER TABLE IF EXISTS ONLY public.tagged_object DROP CONSTRAINT IF EXISTS tagged_object_pkey;
ALTER TABLE IF EXISTS ONLY public.tag DROP CONSTRAINT IF EXISTS tag_pkey;
ALTER TABLE IF EXISTS ONLY public.tag DROP CONSTRAINT IF EXISTS tag_name_key;
ALTER TABLE IF EXISTS ONLY public.tables DROP CONSTRAINT IF EXISTS tables_pkey;
ALTER TABLE IF EXISTS ONLY public.table_schema DROP CONSTRAINT IF EXISTS table_schema_pkey;
ALTER TABLE IF EXISTS ONLY public.table_columns DROP CONSTRAINT IF EXISTS table_columns_pkey;
ALTER TABLE IF EXISTS ONLY public.tab_state DROP CONSTRAINT IF EXISTS tab_state_pkey;
ALTER TABLE IF EXISTS ONLY public.ssh_tunnels DROP CONSTRAINT IF EXISTS ssh_tunnels_pkey;
ALTER TABLE IF EXISTS ONLY public.sqlatable_user DROP CONSTRAINT IF EXISTS sqlatable_user_pkey;
ALTER TABLE IF EXISTS ONLY public.sql_metrics DROP CONSTRAINT IF EXISTS sql_metrics_pkey;
ALTER TABLE IF EXISTS ONLY public.slices DROP CONSTRAINT IF EXISTS slices_pkey;
ALTER TABLE IF EXISTS ONLY public.slice_user DROP CONSTRAINT IF EXISTS slice_user_pkey;
ALTER TABLE IF EXISTS ONLY public.saved_query DROP CONSTRAINT IF EXISTS saved_query_pkey;
ALTER TABLE IF EXISTS ONLY public.row_level_security_filters DROP CONSTRAINT IF EXISTS row_level_security_filters_pkey;
ALTER TABLE IF EXISTS ONLY public.rls_filter_tables DROP CONSTRAINT IF EXISTS rls_filter_tables_pkey;
ALTER TABLE IF EXISTS ONLY public.rls_filter_roles DROP CONSTRAINT IF EXISTS rls_filter_roles_pkey;
ALTER TABLE IF EXISTS ONLY public.report_schedule_user DROP CONSTRAINT IF EXISTS report_schedule_user_pkey;
ALTER TABLE IF EXISTS ONLY public.report_schedule DROP CONSTRAINT IF EXISTS report_schedule_pkey;
ALTER TABLE IF EXISTS ONLY public.report_recipient DROP CONSTRAINT IF EXISTS report_recipient_pkey;
ALTER TABLE IF EXISTS ONLY public.report_execution_log DROP CONSTRAINT IF EXISTS report_execution_log_pkey;
ALTER TABLE IF EXISTS ONLY public.query DROP CONSTRAINT IF EXISTS query_pkey;
ALTER TABLE IF EXISTS ONLY public.logs DROP CONSTRAINT IF EXISTS logs_pkey;
ALTER TABLE IF EXISTS ONLY public.keyvalue DROP CONSTRAINT IF EXISTS keyvalue_pkey;
ALTER TABLE IF EXISTS ONLY public.key_value DROP CONSTRAINT IF EXISTS key_value_pkey;
ALTER TABLE IF EXISTS ONLY public.dashboards DROP CONSTRAINT IF EXISTS idx_unique_slug;
ALTER TABLE IF EXISTS ONLY public.favstar DROP CONSTRAINT IF EXISTS favstar_pkey;
ALTER TABLE IF EXISTS ONLY public.dynamic_plugin DROP CONSTRAINT IF EXISTS dynamic_plugin_pkey;
ALTER TABLE IF EXISTS ONLY public.dynamic_plugin DROP CONSTRAINT IF EXISTS dynamic_plugin_name_key;
ALTER TABLE IF EXISTS ONLY public.dynamic_plugin DROP CONSTRAINT IF EXISTS dynamic_plugin_key_key;
ALTER TABLE IF EXISTS ONLY public.dbs DROP CONSTRAINT IF EXISTS dbs_verbose_name_key;
ALTER TABLE IF EXISTS ONLY public.dbs DROP CONSTRAINT IF EXISTS dbs_pkey;
ALTER TABLE IF EXISTS ONLY public.dbs DROP CONSTRAINT IF EXISTS dbs_database_name_key;
ALTER TABLE IF EXISTS ONLY public.database_user_oauth2_tokens DROP CONSTRAINT IF EXISTS database_user_oauth2_tokens_pkey;
ALTER TABLE IF EXISTS ONLY public.dashboards DROP CONSTRAINT IF EXISTS dashboards_pkey;
ALTER TABLE IF EXISTS ONLY public.dashboard_user DROP CONSTRAINT IF EXISTS dashboard_user_pkey;
ALTER TABLE IF EXISTS ONLY public.dashboard_slices DROP CONSTRAINT IF EXISTS dashboard_slices_pkey;
ALTER TABLE IF EXISTS ONLY public.dashboard_roles DROP CONSTRAINT IF EXISTS dashboard_roles_pkey;
ALTER TABLE IF EXISTS ONLY public.css_templates DROP CONSTRAINT IF EXISTS css_templates_pkey;
ALTER TABLE IF EXISTS ONLY public.query DROP CONSTRAINT IF EXISTS client_id;
ALTER TABLE IF EXISTS ONLY public.cache_keys DROP CONSTRAINT IF EXISTS cache_keys_pkey;
ALTER TABLE IF EXISTS ONLY public.annotation DROP CONSTRAINT IF EXISTS annotation_pkey;
ALTER TABLE IF EXISTS ONLY public.annotation_layer DROP CONSTRAINT IF EXISTS annotation_layer_pkey;
ALTER TABLE IF EXISTS ONLY public.alembic_version DROP CONSTRAINT IF EXISTS alembic_version_pkc;
ALTER TABLE IF EXISTS ONLY public.ab_view_menu DROP CONSTRAINT IF EXISTS ab_view_menu_pkey;
ALTER TABLE IF EXISTS ONLY public.ab_view_menu DROP CONSTRAINT IF EXISTS ab_view_menu_name_key;
ALTER TABLE IF EXISTS ONLY public.ab_user DROP CONSTRAINT IF EXISTS ab_user_username_key;
ALTER TABLE IF EXISTS ONLY public.ab_user_role DROP CONSTRAINT IF EXISTS ab_user_role_user_id_role_id_key;
ALTER TABLE IF EXISTS ONLY public.ab_user_role DROP CONSTRAINT IF EXISTS ab_user_role_pkey;
ALTER TABLE IF EXISTS ONLY public.ab_user DROP CONSTRAINT IF EXISTS ab_user_pkey;
ALTER TABLE IF EXISTS ONLY public.ab_user_group DROP CONSTRAINT IF EXISTS ab_user_group_user_id_group_id_key;
ALTER TABLE IF EXISTS ONLY public.ab_user_group DROP CONSTRAINT IF EXISTS ab_user_group_pkey;
ALTER TABLE IF EXISTS ONLY public.ab_user DROP CONSTRAINT IF EXISTS ab_user_email_key;
ALTER TABLE IF EXISTS ONLY public.ab_role DROP CONSTRAINT IF EXISTS ab_role_pkey;
ALTER TABLE IF EXISTS ONLY public.ab_role DROP CONSTRAINT IF EXISTS ab_role_name_key;
ALTER TABLE IF EXISTS ONLY public.ab_register_user DROP CONSTRAINT IF EXISTS ab_register_user_username_key;
ALTER TABLE IF EXISTS ONLY public.ab_register_user DROP CONSTRAINT IF EXISTS ab_register_user_pkey;
ALTER TABLE IF EXISTS ONLY public.ab_register_user DROP CONSTRAINT IF EXISTS ab_register_user_email_key;
ALTER TABLE IF EXISTS ONLY public.ab_permission_view_role DROP CONSTRAINT IF EXISTS ab_permission_view_role_pkey;
ALTER TABLE IF EXISTS ONLY public.ab_permission_view_role DROP CONSTRAINT IF EXISTS ab_permission_view_role_permission_view_id_role_id_key;
ALTER TABLE IF EXISTS ONLY public.ab_permission_view DROP CONSTRAINT IF EXISTS ab_permission_view_pkey;
ALTER TABLE IF EXISTS ONLY public.ab_permission_view DROP CONSTRAINT IF EXISTS ab_permission_view_permission_id_view_menu_id_key;
ALTER TABLE IF EXISTS ONLY public.ab_permission DROP CONSTRAINT IF EXISTS ab_permission_pkey;
ALTER TABLE IF EXISTS ONLY public.ab_permission DROP CONSTRAINT IF EXISTS ab_permission_name_key;
ALTER TABLE IF EXISTS ONLY public.ab_group_role DROP CONSTRAINT IF EXISTS ab_group_role_pkey;
ALTER TABLE IF EXISTS ONLY public.ab_group_role DROP CONSTRAINT IF EXISTS ab_group_role_group_id_role_id_key;
ALTER TABLE IF EXISTS ONLY public.ab_group DROP CONSTRAINT IF EXISTS ab_group_pkey;
ALTER TABLE IF EXISTS ONLY public.ab_group DROP CONSTRAINT IF EXISTS ab_group_name_key;
ALTER TABLE IF EXISTS ONLY public.tables DROP CONSTRAINT IF EXISTS _customer_location_uc;
ALTER TABLE IF EXISTS public.user_attribute ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.themes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tagged_object ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tag ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tables ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.table_schema ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.table_columns ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tab_state ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.ssh_tunnels ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.sqlatable_user ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.sql_metrics ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.slices ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.slice_user ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.saved_query ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.row_level_security_filters ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.rls_filter_tables ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.rls_filter_roles ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.report_schedule_user ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.report_schedule ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.report_recipient ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.report_execution_log ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.query ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.logs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.keyvalue ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.key_value ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.favstar ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.dynamic_plugin ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.dbs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.database_user_oauth2_tokens ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.dashboards ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.dashboard_user ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.dashboard_slices ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.dashboard_roles ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.css_templates ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.cache_keys ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.annotation_layer ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.annotation ALTER COLUMN id DROP DEFAULT;
DROP TABLE IF EXISTS public.user_favorite_tag;
DROP SEQUENCE IF EXISTS public.user_attribute_id_seq;
DROP TABLE IF EXISTS public.user_attribute;
DROP SEQUENCE IF EXISTS public.themes_id_seq;
DROP TABLE IF EXISTS public.themes;
DROP SEQUENCE IF EXISTS public.tagged_object_id_seq;
DROP TABLE IF EXISTS public.tagged_object;
DROP SEQUENCE IF EXISTS public.tag_id_seq;
DROP TABLE IF EXISTS public.tag;
DROP SEQUENCE IF EXISTS public.tables_id_seq;
DROP TABLE IF EXISTS public.tables;
DROP SEQUENCE IF EXISTS public.table_schema_id_seq;
DROP TABLE IF EXISTS public.table_schema;
DROP SEQUENCE IF EXISTS public.table_columns_id_seq;
DROP TABLE IF EXISTS public.table_columns;
DROP SEQUENCE IF EXISTS public.tab_state_id_seq;
DROP TABLE IF EXISTS public.tab_state;
DROP SEQUENCE IF EXISTS public.ssh_tunnels_id_seq;
DROP TABLE IF EXISTS public.ssh_tunnels;
DROP SEQUENCE IF EXISTS public.sqlatable_user_id_seq;
DROP TABLE IF EXISTS public.sqlatable_user;
DROP SEQUENCE IF EXISTS public.sql_metrics_id_seq;
DROP TABLE IF EXISTS public.sql_metrics;
DROP SEQUENCE IF EXISTS public.slices_id_seq;
DROP TABLE IF EXISTS public.slices;
DROP SEQUENCE IF EXISTS public.slice_user_id_seq;
DROP TABLE IF EXISTS public.slice_user;
DROP SEQUENCE IF EXISTS public.saved_query_id_seq;
DROP TABLE IF EXISTS public.saved_query;
DROP SEQUENCE IF EXISTS public.row_level_security_filters_id_seq;
DROP TABLE IF EXISTS public.row_level_security_filters;
DROP SEQUENCE IF EXISTS public.rls_filter_tables_id_seq;
DROP TABLE IF EXISTS public.rls_filter_tables;
DROP SEQUENCE IF EXISTS public.rls_filter_roles_id_seq;
DROP TABLE IF EXISTS public.rls_filter_roles;
DROP SEQUENCE IF EXISTS public.report_schedule_user_id_seq;
DROP TABLE IF EXISTS public.report_schedule_user;
DROP SEQUENCE IF EXISTS public.report_schedule_id_seq;
DROP TABLE IF EXISTS public.report_schedule;
DROP SEQUENCE IF EXISTS public.report_recipient_id_seq;
DROP TABLE IF EXISTS public.report_recipient;
DROP SEQUENCE IF EXISTS public.report_execution_log_id_seq;
DROP TABLE IF EXISTS public.report_execution_log;
DROP SEQUENCE IF EXISTS public.query_id_seq;
DROP TABLE IF EXISTS public.query;
DROP SEQUENCE IF EXISTS public.logs_id_seq;
DROP TABLE IF EXISTS public.logs;
DROP SEQUENCE IF EXISTS public.keyvalue_id_seq;
DROP TABLE IF EXISTS public.keyvalue;
DROP SEQUENCE IF EXISTS public.key_value_id_seq;
DROP TABLE IF EXISTS public.key_value;
DROP SEQUENCE IF EXISTS public.favstar_id_seq;
DROP TABLE IF EXISTS public.favstar;
DROP TABLE IF EXISTS public.embedded_dashboards;
DROP SEQUENCE IF EXISTS public.dynamic_plugin_id_seq;
DROP TABLE IF EXISTS public.dynamic_plugin;
DROP SEQUENCE IF EXISTS public.dbs_id_seq;
DROP TABLE IF EXISTS public.dbs;
DROP SEQUENCE IF EXISTS public.database_user_oauth2_tokens_id_seq;
DROP TABLE IF EXISTS public.database_user_oauth2_tokens;
DROP SEQUENCE IF EXISTS public.dashboards_id_seq;
DROP TABLE IF EXISTS public.dashboards;
DROP SEQUENCE IF EXISTS public.dashboard_user_id_seq;
DROP TABLE IF EXISTS public.dashboard_user;
DROP SEQUENCE IF EXISTS public.dashboard_slices_id_seq;
DROP TABLE IF EXISTS public.dashboard_slices;
DROP SEQUENCE IF EXISTS public.dashboard_roles_id_seq;
DROP TABLE IF EXISTS public.dashboard_roles;
DROP SEQUENCE IF EXISTS public.css_templates_id_seq;
DROP TABLE IF EXISTS public.css_templates;
DROP SEQUENCE IF EXISTS public.cache_keys_id_seq;
DROP TABLE IF EXISTS public.cache_keys;
DROP SEQUENCE IF EXISTS public.annotation_layer_id_seq;
DROP TABLE IF EXISTS public.annotation_layer;
DROP SEQUENCE IF EXISTS public.annotation_id_seq;
DROP TABLE IF EXISTS public.annotation;
DROP TABLE IF EXISTS public.alembic_version;
DROP SEQUENCE IF EXISTS public.ab_view_menu_id_seq;
DROP TABLE IF EXISTS public.ab_view_menu;
DROP SEQUENCE IF EXISTS public.ab_user_role_id_seq;
DROP TABLE IF EXISTS public.ab_user_role;
DROP SEQUENCE IF EXISTS public.ab_user_id_seq;
DROP SEQUENCE IF EXISTS public.ab_user_group_id_seq;
DROP TABLE IF EXISTS public.ab_user_group;
DROP TABLE IF EXISTS public.ab_user;
DROP SEQUENCE IF EXISTS public.ab_role_id_seq;
DROP TABLE IF EXISTS public.ab_role;
DROP SEQUENCE IF EXISTS public.ab_register_user_id_seq;
DROP TABLE IF EXISTS public.ab_register_user;
DROP SEQUENCE IF EXISTS public.ab_permission_view_role_id_seq;
DROP TABLE IF EXISTS public.ab_permission_view_role;
DROP SEQUENCE IF EXISTS public.ab_permission_view_id_seq;
DROP TABLE IF EXISTS public.ab_permission_view;
DROP SEQUENCE IF EXISTS public.ab_permission_id_seq;
DROP TABLE IF EXISTS public.ab_permission;
DROP SEQUENCE IF EXISTS public.ab_group_role_id_seq;
DROP TABLE IF EXISTS public.ab_group_role;
DROP SEQUENCE IF EXISTS public.ab_group_id_seq;
DROP TABLE IF EXISTS public.ab_group;
DROP FUNCTION IF EXISTS public.safe_to_jsonb(input text);
DROP TYPE IF EXISTS public.tagtype;
DROP TYPE IF EXISTS public.sliceemailreportformat;
DROP TYPE IF EXISTS public.objecttype;
DROP TYPE IF EXISTS public.emaildeliverytype;
--
-- Name: emaildeliverytype; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.emaildeliverytype AS ENUM (
    'attachment',
    'inline'
);


--
-- Name: objecttype; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.objecttype AS ENUM (
    'query',
    'chart',
    'dashboard',
    'dataset'
);


--
-- Name: sliceemailreportformat; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.sliceemailreportformat AS ENUM (
    'visualization',
    'data'
);


--
-- Name: tagtype; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.tagtype AS ENUM (
    'custom',
    'type',
    'owner',
    'favorited_by'
);


--
-- Name: safe_to_jsonb(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.safe_to_jsonb(input text) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
BEGIN
  RETURN input::jsonb;
EXCEPTION WHEN invalid_text_representation THEN
  RETURN NULL;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ab_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ab_group (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    label character varying(150),
    description character varying(512)
);


--
-- Name: ab_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ab_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ab_group_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ab_group_role (
    id integer NOT NULL,
    group_id integer,
    role_id integer
);


--
-- Name: ab_group_role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ab_group_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ab_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ab_permission (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


--
-- Name: ab_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ab_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ab_permission_view; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ab_permission_view (
    id integer NOT NULL,
    permission_id integer,
    view_menu_id integer
);


--
-- Name: ab_permission_view_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ab_permission_view_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ab_permission_view_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ab_permission_view_role (
    id integer NOT NULL,
    permission_view_id integer,
    role_id integer
);


--
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ab_permission_view_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ab_register_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ab_register_user (
    id integer NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    username character varying(128) NOT NULL,
    password character varying(256),
    email character varying(320) NOT NULL,
    registration_date timestamp without time zone,
    registration_hash character varying(256)
);


--
-- Name: ab_register_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ab_register_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ab_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ab_role (
    id integer NOT NULL,
    name character varying(64) NOT NULL
);


--
-- Name: ab_role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ab_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ab_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ab_user (
    id integer NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    username character varying(128) NOT NULL,
    password character varying(256),
    active boolean,
    email character varying(320) NOT NULL,
    last_login timestamp without time zone,
    login_count integer,
    fail_login_count integer,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer
);


--
-- Name: ab_user_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ab_user_group (
    id integer NOT NULL,
    user_id integer,
    group_id integer
);


--
-- Name: ab_user_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ab_user_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ab_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ab_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ab_user_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ab_user_role (
    id integer NOT NULL,
    user_id integer,
    role_id integer
);


--
-- Name: ab_user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ab_user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ab_view_menu; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ab_view_menu (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


--
-- Name: ab_view_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ab_view_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


--
-- Name: annotation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.annotation (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    start_dttm timestamp without time zone,
    end_dttm timestamp without time zone,
    layer_id integer,
    short_descr character varying(500),
    long_descr text,
    changed_by_fk integer,
    created_by_fk integer,
    json_metadata text
);


--
-- Name: annotation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.annotation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: annotation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.annotation_id_seq OWNED BY public.annotation.id;


--
-- Name: annotation_layer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.annotation_layer (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    name character varying(250),
    descr text,
    changed_by_fk integer,
    created_by_fk integer
);


--
-- Name: annotation_layer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.annotation_layer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: annotation_layer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.annotation_layer_id_seq OWNED BY public.annotation_layer.id;


--
-- Name: cache_keys; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cache_keys (
    id integer NOT NULL,
    cache_key character varying(256) NOT NULL,
    cache_timeout integer,
    datasource_uid character varying(64) NOT NULL,
    created_on timestamp without time zone
);


--
-- Name: cache_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cache_keys_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cache_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cache_keys_id_seq OWNED BY public.cache_keys.id;


--
-- Name: css_templates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.css_templates (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    template_name character varying(250),
    css text,
    changed_by_fk integer,
    created_by_fk integer,
    uuid uuid
);


--
-- Name: css_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.css_templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: css_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.css_templates_id_seq OWNED BY public.css_templates.id;


--
-- Name: dashboard_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dashboard_roles (
    id integer NOT NULL,
    role_id integer NOT NULL,
    dashboard_id integer
);


--
-- Name: dashboard_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dashboard_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dashboard_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dashboard_roles_id_seq OWNED BY public.dashboard_roles.id;


--
-- Name: dashboard_slices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dashboard_slices (
    id integer NOT NULL,
    dashboard_id integer,
    slice_id integer
);


--
-- Name: dashboard_slices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dashboard_slices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dashboard_slices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dashboard_slices_id_seq OWNED BY public.dashboard_slices.id;


--
-- Name: dashboard_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dashboard_user (
    id integer NOT NULL,
    user_id integer,
    dashboard_id integer
);


--
-- Name: dashboard_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dashboard_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dashboard_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dashboard_user_id_seq OWNED BY public.dashboard_user.id;


--
-- Name: dashboards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dashboards (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    dashboard_title character varying(500),
    position_json text,
    created_by_fk integer,
    changed_by_fk integer,
    css text,
    description text,
    slug character varying(255),
    json_metadata text,
    published boolean,
    uuid uuid,
    certified_by text,
    certification_details text,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text,
    theme_id integer
);


--
-- Name: dashboards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dashboards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dashboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dashboards_id_seq OWNED BY public.dashboards.id;


--
-- Name: database_user_oauth2_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.database_user_oauth2_tokens (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    user_id integer NOT NULL,
    database_id integer NOT NULL,
    access_token bytea,
    access_token_expiration timestamp without time zone,
    refresh_token bytea,
    created_by_fk integer,
    changed_by_fk integer
);


--
-- Name: database_user_oauth2_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.database_user_oauth2_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: database_user_oauth2_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.database_user_oauth2_tokens_id_seq OWNED BY public.database_user_oauth2_tokens.id;


--
-- Name: dbs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dbs (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    database_name character varying(250) NOT NULL,
    sqlalchemy_uri character varying(1024) NOT NULL,
    created_by_fk integer,
    changed_by_fk integer,
    password bytea,
    cache_timeout integer,
    extra text,
    select_as_create_table_as boolean,
    allow_ctas boolean,
    expose_in_sqllab boolean,
    force_ctas_schema character varying(250),
    allow_run_async boolean,
    allow_dml boolean,
    verbose_name character varying(250),
    impersonate_user boolean,
    allow_file_upload boolean DEFAULT true NOT NULL,
    encrypted_extra bytea,
    server_cert bytea,
    allow_cvas boolean,
    uuid uuid,
    configuration_method character varying(255) DEFAULT 'sqlalchemy_form'::character varying,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text
);


--
-- Name: dbs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dbs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dbs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dbs_id_seq OWNED BY public.dbs.id;


--
-- Name: dynamic_plugin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dynamic_plugin (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    key character varying(50) NOT NULL,
    bundle_url character varying(1000) NOT NULL,
    created_by_fk integer,
    changed_by_fk integer
);


--
-- Name: dynamic_plugin_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dynamic_plugin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dynamic_plugin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dynamic_plugin_id_seq OWNED BY public.dynamic_plugin.id;


--
-- Name: embedded_dashboards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.embedded_dashboards (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    allow_domain_list text,
    uuid uuid,
    dashboard_id integer NOT NULL,
    changed_by_fk integer,
    created_by_fk integer
);


--
-- Name: favstar; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.favstar (
    id integer NOT NULL,
    user_id integer,
    class_name character varying(50),
    obj_id integer,
    dttm timestamp without time zone,
    uuid uuid
);


--
-- Name: favstar_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.favstar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: favstar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.favstar_id_seq OWNED BY public.favstar.id;


--
-- Name: key_value; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.key_value (
    id integer NOT NULL,
    resource character varying(32) NOT NULL,
    value bytea NOT NULL,
    uuid uuid,
    created_on timestamp without time zone,
    created_by_fk integer,
    changed_on timestamp without time zone,
    changed_by_fk integer,
    expires_on timestamp without time zone
);


--
-- Name: key_value_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.key_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: key_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.key_value_id_seq OWNED BY public.key_value.id;


--
-- Name: keyvalue; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.keyvalue (
    id integer NOT NULL,
    value text NOT NULL
);


--
-- Name: keyvalue_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.keyvalue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: keyvalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.keyvalue_id_seq OWNED BY public.keyvalue.id;


--
-- Name: logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.logs (
    id integer NOT NULL,
    action character varying(512),
    user_id integer,
    json text,
    dttm timestamp without time zone,
    dashboard_id integer,
    slice_id integer,
    duration_ms integer,
    referrer character varying(1024)
);


--
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;


--
-- Name: query; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.query (
    id integer NOT NULL,
    client_id character varying(11) NOT NULL,
    database_id integer NOT NULL,
    tmp_table_name character varying(256),
    tab_name character varying(256),
    sql_editor_id character varying(256),
    user_id integer,
    status character varying(16),
    schema character varying(256),
    sql text,
    select_sql text,
    executed_sql text,
    "limit" integer,
    select_as_cta boolean,
    select_as_cta_used boolean,
    progress integer,
    rows integer,
    error_message text,
    start_time numeric(20,6),
    changed_on timestamp without time zone,
    end_time numeric(20,6),
    results_key character varying(64),
    start_running_time numeric(20,6),
    end_result_backend_time numeric(20,6),
    tracking_url text,
    extra_json text,
    tmp_schema_name character varying(256),
    ctas_method character varying(16),
    limiting_factor character varying(255) DEFAULT 'UNKNOWN'::character varying,
    catalog character varying(256)
);


--
-- Name: query_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.query_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.query_id_seq OWNED BY public.query.id;


--
-- Name: report_execution_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.report_execution_log (
    id integer NOT NULL,
    scheduled_dttm timestamp without time zone NOT NULL,
    start_dttm timestamp without time zone,
    end_dttm timestamp without time zone,
    value double precision,
    value_row_json text,
    state character varying(50) NOT NULL,
    error_message text,
    report_schedule_id integer NOT NULL,
    uuid uuid
);


--
-- Name: report_execution_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.report_execution_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: report_execution_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.report_execution_log_id_seq OWNED BY public.report_execution_log.id;


--
-- Name: report_recipient; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.report_recipient (
    id integer NOT NULL,
    type character varying(50) NOT NULL,
    recipient_config_json text,
    report_schedule_id integer NOT NULL,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer
);


--
-- Name: report_recipient_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.report_recipient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: report_recipient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.report_recipient_id_seq OWNED BY public.report_recipient.id;


--
-- Name: report_schedule; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.report_schedule (
    id integer NOT NULL,
    type character varying(50) NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    context_markdown text,
    active boolean,
    crontab character varying(1000) NOT NULL,
    sql text,
    chart_id integer,
    dashboard_id integer,
    database_id integer,
    last_eval_dttm timestamp without time zone,
    last_state character varying(50),
    last_value double precision,
    last_value_row_json text,
    validator_type character varying(100),
    validator_config_json text,
    log_retention integer,
    grace_period integer,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer,
    working_timeout integer,
    report_format character varying(50) DEFAULT 'PNG'::character varying,
    creation_method character varying(255) DEFAULT 'alerts_reports'::character varying,
    timezone character varying(100) DEFAULT 'UTC'::character varying NOT NULL,
    extra_json text NOT NULL,
    force_screenshot boolean,
    custom_width integer,
    custom_height integer,
    email_subject character varying(255)
);


--
-- Name: report_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.report_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: report_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.report_schedule_id_seq OWNED BY public.report_schedule.id;


--
-- Name: report_schedule_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.report_schedule_user (
    id integer NOT NULL,
    user_id integer NOT NULL,
    report_schedule_id integer NOT NULL
);


--
-- Name: report_schedule_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.report_schedule_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: report_schedule_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.report_schedule_user_id_seq OWNED BY public.report_schedule_user.id;


--
-- Name: rls_filter_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rls_filter_roles (
    id integer NOT NULL,
    role_id integer NOT NULL,
    rls_filter_id integer
);


--
-- Name: rls_filter_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rls_filter_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rls_filter_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.rls_filter_roles_id_seq OWNED BY public.rls_filter_roles.id;


--
-- Name: rls_filter_tables; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rls_filter_tables (
    id integer NOT NULL,
    table_id integer,
    rls_filter_id integer
);


--
-- Name: rls_filter_tables_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rls_filter_tables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rls_filter_tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.rls_filter_tables_id_seq OWNED BY public.rls_filter_tables.id;


--
-- Name: row_level_security_filters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.row_level_security_filters (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    clause text NOT NULL,
    created_by_fk integer,
    changed_by_fk integer,
    filter_type character varying(255),
    group_key character varying(255),
    name character varying(255) NOT NULL,
    description text
);


--
-- Name: row_level_security_filters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.row_level_security_filters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: row_level_security_filters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.row_level_security_filters_id_seq OWNED BY public.row_level_security_filters.id;


--
-- Name: saved_query; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.saved_query (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    user_id integer,
    db_id integer,
    label character varying(256),
    schema character varying(128),
    sql text,
    description text,
    changed_by_fk integer,
    created_by_fk integer,
    extra_json text,
    last_run timestamp without time zone,
    rows integer,
    uuid uuid,
    template_parameters text,
    catalog character varying(256)
);


--
-- Name: saved_query_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.saved_query_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: saved_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.saved_query_id_seq OWNED BY public.saved_query.id;


--
-- Name: slice_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.slice_user (
    id integer NOT NULL,
    user_id integer,
    slice_id integer
);


--
-- Name: slice_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.slice_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: slice_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.slice_user_id_seq OWNED BY public.slice_user.id;


--
-- Name: slices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.slices (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    slice_name character varying(250),
    druid_datasource_id integer,
    table_id integer,
    datasource_type character varying(200),
    datasource_name character varying(2000),
    viz_type character varying(250),
    params text,
    created_by_fk integer,
    changed_by_fk integer,
    description text,
    cache_timeout integer,
    perm character varying(2000),
    datasource_id integer,
    schema_perm character varying(1000),
    uuid uuid,
    query_context text,
    last_saved_at timestamp without time zone,
    last_saved_by_fk integer,
    certified_by text,
    certification_details text,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text,
    catalog_perm character varying(1000),
    CONSTRAINT ck_chart_datasource CHECK (((datasource_type)::text = 'table'::text))
);


--
-- Name: slices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.slices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: slices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.slices_id_seq OWNED BY public.slices.id;


--
-- Name: sql_metrics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sql_metrics (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    metric_name character varying(255) NOT NULL,
    verbose_name character varying(1024),
    metric_type character varying(32),
    table_id integer,
    expression text NOT NULL,
    description text,
    created_by_fk integer,
    changed_by_fk integer,
    d3format character varying(128),
    warning_text text,
    extra text,
    uuid uuid,
    currency jsonb
);


--
-- Name: sql_metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sql_metrics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sql_metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sql_metrics_id_seq OWNED BY public.sql_metrics.id;


--
-- Name: sqlatable_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sqlatable_user (
    id integer NOT NULL,
    user_id integer,
    table_id integer
);


--
-- Name: sqlatable_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sqlatable_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sqlatable_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sqlatable_user_id_seq OWNED BY public.sqlatable_user.id;


--
-- Name: ssh_tunnels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ssh_tunnels (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer,
    extra_json text,
    uuid uuid,
    id integer NOT NULL,
    database_id integer,
    server_address character varying(256),
    server_port integer,
    username bytea,
    password bytea,
    private_key bytea,
    private_key_password bytea
);


--
-- Name: ssh_tunnels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ssh_tunnels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ssh_tunnels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ssh_tunnels_id_seq OWNED BY public.ssh_tunnels.id;


--
-- Name: tab_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tab_state (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    extra_json text,
    id integer NOT NULL,
    user_id integer,
    label character varying(256),
    active boolean,
    database_id integer,
    schema character varying(256),
    sql text,
    query_limit integer,
    latest_query_id character varying(11),
    autorun boolean NOT NULL,
    template_params text,
    created_by_fk integer,
    changed_by_fk integer,
    hide_left_bar boolean DEFAULT false NOT NULL,
    saved_query_id integer,
    catalog character varying(256)
);


--
-- Name: tab_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tab_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tab_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tab_state_id_seq OWNED BY public.tab_state.id;


--
-- Name: table_columns; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.table_columns (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    table_id integer,
    column_name character varying(255) NOT NULL,
    is_dttm boolean,
    is_active boolean,
    type text,
    groupby boolean,
    filterable boolean,
    description text,
    created_by_fk integer,
    changed_by_fk integer,
    expression text,
    verbose_name character varying(1024),
    python_date_format character varying(255),
    uuid uuid,
    extra text,
    advanced_data_type character varying(255),
    datetime_format character varying(100)
);


--
-- Name: table_columns_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.table_columns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: table_columns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.table_columns_id_seq OWNED BY public.table_columns.id;


--
-- Name: table_schema; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.table_schema (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    extra_json text,
    id integer NOT NULL,
    tab_state_id integer,
    database_id integer NOT NULL,
    schema character varying(256),
    "table" character varying(256),
    description text,
    expanded boolean,
    created_by_fk integer,
    changed_by_fk integer,
    catalog character varying(256)
);


--
-- Name: table_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.table_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: table_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.table_schema_id_seq OWNED BY public.table_schema.id;


--
-- Name: tables; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tables (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    table_name character varying(250) NOT NULL,
    main_dttm_col character varying(250),
    default_endpoint text,
    database_id integer NOT NULL,
    created_by_fk integer,
    changed_by_fk integer,
    "offset" integer,
    description text,
    is_featured boolean,
    cache_timeout integer,
    schema character varying(255),
    sql text,
    params text,
    perm character varying(1000),
    filter_select_enabled boolean,
    fetch_values_predicate text,
    is_sqllab_view boolean DEFAULT false,
    template_params text,
    schema_perm character varying(1000),
    extra text,
    uuid uuid,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text,
    normalize_columns boolean DEFAULT false,
    always_filter_main_dttm boolean DEFAULT false,
    catalog character varying(256),
    catalog_perm character varying(1000),
    folders json,
    currency_code_column character varying(250)
);


--
-- Name: tables_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tables_id_seq OWNED BY public.tables.id;


--
-- Name: tag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tag (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    name character varying(250),
    type character varying,
    created_by_fk integer,
    changed_by_fk integer,
    description text
);


--
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tag_id_seq OWNED BY public.tag.id;


--
-- Name: tagged_object; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tagged_object (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    tag_id integer,
    object_id integer,
    object_type character varying,
    created_by_fk integer,
    changed_by_fk integer
);


--
-- Name: tagged_object_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tagged_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tagged_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tagged_object_id_seq OWNED BY public.tagged_object.id;


--
-- Name: themes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.themes (
    uuid uuid,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    theme_name character varying(250),
    json_data text,
    is_system boolean NOT NULL,
    created_by_fk integer,
    changed_by_fk integer,
    is_system_default boolean NOT NULL,
    is_system_dark boolean NOT NULL
);


--
-- Name: themes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.themes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: themes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.themes_id_seq OWNED BY public.themes.id;


--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_attribute (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    user_id integer,
    welcome_dashboard_id integer,
    created_by_fk integer,
    changed_by_fk integer,
    avatar_url character varying(100)
);


--
-- Name: user_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_attribute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_attribute_id_seq OWNED BY public.user_attribute.id;


--
-- Name: user_favorite_tag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_favorite_tag (
    user_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- Name: annotation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.annotation ALTER COLUMN id SET DEFAULT nextval('public.annotation_id_seq'::regclass);


--
-- Name: annotation_layer id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.annotation_layer ALTER COLUMN id SET DEFAULT nextval('public.annotation_layer_id_seq'::regclass);


--
-- Name: cache_keys id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cache_keys ALTER COLUMN id SET DEFAULT nextval('public.cache_keys_id_seq'::regclass);


--
-- Name: css_templates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.css_templates ALTER COLUMN id SET DEFAULT nextval('public.css_templates_id_seq'::regclass);


--
-- Name: dashboard_roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dashboard_roles ALTER COLUMN id SET DEFAULT nextval('public.dashboard_roles_id_seq'::regclass);


--
-- Name: dashboard_slices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dashboard_slices ALTER COLUMN id SET DEFAULT nextval('public.dashboard_slices_id_seq'::regclass);


--
-- Name: dashboard_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dashboard_user ALTER COLUMN id SET DEFAULT nextval('public.dashboard_user_id_seq'::regclass);


--
-- Name: dashboards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dashboards ALTER COLUMN id SET DEFAULT nextval('public.dashboards_id_seq'::regclass);


--
-- Name: database_user_oauth2_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.database_user_oauth2_tokens ALTER COLUMN id SET DEFAULT nextval('public.database_user_oauth2_tokens_id_seq'::regclass);


--
-- Name: dbs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dbs ALTER COLUMN id SET DEFAULT nextval('public.dbs_id_seq'::regclass);


--
-- Name: dynamic_plugin id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dynamic_plugin ALTER COLUMN id SET DEFAULT nextval('public.dynamic_plugin_id_seq'::regclass);


--
-- Name: favstar id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favstar ALTER COLUMN id SET DEFAULT nextval('public.favstar_id_seq'::regclass);


--
-- Name: key_value id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.key_value ALTER COLUMN id SET DEFAULT nextval('public.key_value_id_seq'::regclass);


--
-- Name: keyvalue id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.keyvalue ALTER COLUMN id SET DEFAULT nextval('public.keyvalue_id_seq'::regclass);


--
-- Name: logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);


--
-- Name: query id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.query ALTER COLUMN id SET DEFAULT nextval('public.query_id_seq'::regclass);


--
-- Name: report_execution_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.report_execution_log ALTER COLUMN id SET DEFAULT nextval('public.report_execution_log_id_seq'::regclass);


--
-- Name: report_recipient id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.report_recipient ALTER COLUMN id SET DEFAULT nextval('public.report_recipient_id_seq'::regclass);


--
-- Name: report_schedule id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.report_schedule ALTER COLUMN id SET DEFAULT nextval('public.report_schedule_id_seq'::regclass);


--
-- Name: report_schedule_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.report_schedule_user ALTER COLUMN id SET DEFAULT nextval('public.report_schedule_user_id_seq'::regclass);


--
-- Name: rls_filter_roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rls_filter_roles ALTER COLUMN id SET DEFAULT nextval('public.rls_filter_roles_id_seq'::regclass);


--
-- Name: rls_filter_tables id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rls_filter_tables ALTER COLUMN id SET DEFAULT nextval('public.rls_filter_tables_id_seq'::regclass);


--
-- Name: row_level_security_filters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.row_level_security_filters ALTER COLUMN id SET DEFAULT nextval('public.row_level_security_filters_id_seq'::regclass);


--
-- Name: saved_query id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saved_query ALTER COLUMN id SET DEFAULT nextval('public.saved_query_id_seq'::regclass);


--
-- Name: slice_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slice_user ALTER COLUMN id SET DEFAULT nextval('public.slice_user_id_seq'::regclass);


--
-- Name: slices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slices ALTER COLUMN id SET DEFAULT nextval('public.slices_id_seq'::regclass);


--
-- Name: sql_metrics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sql_metrics ALTER COLUMN id SET DEFAULT nextval('public.sql_metrics_id_seq'::regclass);


--
-- Name: sqlatable_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sqlatable_user ALTER COLUMN id SET DEFAULT nextval('public.sqlatable_user_id_seq'::regclass);


--
-- Name: ssh_tunnels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ssh_tunnels ALTER COLUMN id SET DEFAULT nextval('public.ssh_tunnels_id_seq'::regclass);


--
-- Name: tab_state id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tab_state ALTER COLUMN id SET DEFAULT nextval('public.tab_state_id_seq'::regclass);


--
-- Name: table_columns id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.table_columns ALTER COLUMN id SET DEFAULT nextval('public.table_columns_id_seq'::regclass);


--
-- Name: table_schema id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.table_schema ALTER COLUMN id SET DEFAULT nextval('public.table_schema_id_seq'::regclass);


--
-- Name: tables id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tables ALTER COLUMN id SET DEFAULT nextval('public.tables_id_seq'::regclass);


--
-- Name: tag id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tag ALTER COLUMN id SET DEFAULT nextval('public.tag_id_seq'::regclass);


--
-- Name: tagged_object id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tagged_object ALTER COLUMN id SET DEFAULT nextval('public.tagged_object_id_seq'::regclass);


--
-- Name: themes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.themes ALTER COLUMN id SET DEFAULT nextval('public.themes_id_seq'::regclass);


--
-- Name: user_attribute id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_attribute ALTER COLUMN id SET DEFAULT nextval('public.user_attribute_id_seq'::regclass);


--
-- Data for Name: ab_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ab_group (id, name, label, description) FROM stdin;
\.


--
-- Data for Name: ab_group_role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ab_group_role (id, group_id, role_id) FROM stdin;
\.


--
-- Data for Name: ab_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ab_permission (id, name) FROM stdin;
1	can_read
2	can_write
8	can_upload
9	can_this_form_get
10	can_this_form_post
11	can_delete
12	can_list
13	can_show
14	can_userinfo
15	can_download
16	can_add
17	can_edit
18	resetmypassword
19	resetpasswords
20	userinfoedit
21	copyrole
22	can_info
23	can_get
24	can_add_role_permissions
25	can_post
26	can_update_role_users
27	can_put
28	can_update_role_groups
29	can_list_role_permissions
30	can_invalidate
31	can_export
32	can_warm_up_cache
33	can_put_chart_customizations
34	can_set_embedded
35	can_export_as_example
36	can_cache_dashboard_screenshot
37	can_get_embedded
38	can_delete_embedded
39	can_duplicate
40	can_get_or_create_dataset
41	can_get_drill_info
42	can_get_column_values
43	can_validate_expression
44	can_import_
45	can_bulk_create
46	can_format_sql
47	can_estimate_query_cost
48	can_export_csv
49	can_get_results
50	can_execute_sql_query
51	can_export_streaming_csv
52	can_recent_activity
53	can_time_range
54	can_query
55	can_query_form_data
56	can_save
57	can_samples
58	can_external_metadata
59	can_external_metadata_by_name
60	can_explore_json
61	can_language_pack
62	can_dashboard
63	can_fetch_datasource_metadata
64	can_dashboard_permalink
65	can_log
66	can_sqllab_history
67	can_file_handler
68	can_slice
69	can_explore
70	can_expanded
71	can_delete_query
72	can_activate
73	can_migrate_query
74	can_tags
75	can_list_roles
76	can_grant_guest_token
77	menu_access
78	all_datasource_access
79	all_database_access
80	all_query_access
81	can_csv
82	can_share_dashboard
83	can_share_chart
84	can_sqllab
85	can_view_query
86	can_view_chart_as_table
87	can_drill
88	can_tag
89	database_access
90	catalog_access
91	schema_access
92	datasource_access
\.


--
-- Data for Name: ab_permission_view; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ab_permission_view (id, permission_id, view_menu_id) FROM stdin;
1	1	1
2	2	1
3	1	2
4	2	2
5	1	3
6	2	3
7	1	4
8	2	4
9	1	5
10	2	5
11	1	6
12	2	6
13	1	7
14	2	7
15	1	8
16	2	8
17	1	9
18	2	9
19	1	10
25	8	9
26	9	17
27	10	17
28	9	18
29	10	18
30	9	19
31	10	19
32	11	21
33	12	21
34	13	21
35	14	21
36	15	21
37	16	21
38	17	21
39	18	21
40	19	21
41	20	21
42	11	22
43	12	22
44	13	22
45	15	22
46	16	22
47	17	22
48	21	22
49	11	23
50	12	23
51	13	23
52	15	23
53	16	23
54	17	23
55	22	24
56	23	24
57	24	25
58	11	25
59	22	25
60	25	25
61	26	25
62	27	25
63	23	25
64	28	25
65	29	25
66	11	26
67	22	26
68	25	26
69	27	26
70	23	26
71	11	27
72	22	27
73	25	27
74	27	27
75	23	27
76	11	28
77	22	28
78	25	28
79	27	28
80	23	28
81	11	29
82	22	29
83	25	29
84	27	29
85	23	29
86	23	30
87	13	31
88	23	32
89	12	33
90	1	34
91	1	35
92	30	36
93	31	4
94	32	4
95	2	37
96	1	37
97	31	37
98	2	38
99	1	38
100	2	40
101	1	40
102	2	41
103	1	41
104	31	8
105	33	8
106	34	8
107	35	8
108	36	8
109	37	8
110	38	8
111	31	9
112	32	6
113	31	6
114	39	6
115	40	6
116	41	6
117	42	42
118	43	42
119	1	43
120	1	44
121	2	45
122	1	45
123	2	46
124	1	46
125	44	47
126	31	47
127	2	48
128	1	48
129	31	1
130	2	49
131	1	49
132	45	49
133	46	50
134	1	50
135	47	50
136	48	50
137	49	50
138	50	50
139	51	50
140	2	51
141	1	51
142	52	7
143	1	52
144	12	53
145	13	53
146	2	53
147	15	53
148	16	53
149	17	53
150	1	54
151	53	55
152	54	55
153	55	55
154	56	42
155	57	42
156	23	42
157	58	42
158	59	42
159	12	1
160	60	57
161	61	57
162	62	57
163	63	57
164	64	57
165	65	57
166	32	57
167	66	57
168	67	57
169	68	57
170	69	57
171	70	58
172	11	58
173	25	58
174	11	59
175	71	59
176	25	59
177	72	59
178	27	59
179	23	59
180	73	59
181	12	60
182	74	61
183	75	62
184	1	63
185	11	64
186	12	64
187	13	64
188	16	64
189	17	64
190	76	65
191	1	65
192	1	66
193	77	67
194	77	68
195	77	69
196	77	70
197	77	71
198	77	72
199	77	48
200	77	73
201	77	74
202	77	75
203	77	76
204	77	77
205	77	78
206	77	79
207	77	80
208	77	81
209	77	82
210	77	54
211	77	60
212	77	83
213	77	84
214	77	85
215	77	86
216	77	87
217	77	88
218	78	89
219	79	90
220	80	91
221	81	57
222	82	57
223	83	57
224	84	57
225	85	8
226	86	8
227	87	8
228	88	4
229	88	8
230	89	92
231	90	93
232	91	94
233	91	95
234	92	96
\.


--
-- Data for Name: ab_permission_view_role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ab_permission_view_role (id, permission_view_id, role_id) FROM stdin;
1	26	1
2	27	1
3	28	1
4	29	1
5	30	1
6	31	1
7	32	1
8	33	1
9	34	1
10	35	1
11	36	1
12	37	1
13	38	1
14	39	1
15	40	1
16	41	1
17	42	1
18	43	1
19	44	1
20	45	1
21	46	1
22	47	1
23	48	1
24	49	1
25	50	1
26	51	1
27	52	1
28	53	1
29	54	1
30	55	1
31	56	1
32	57	1
33	58	1
34	59	1
35	60	1
36	61	1
37	62	1
38	63	1
39	64	1
40	65	1
41	66	1
42	67	1
43	68	1
44	69	1
45	70	1
46	71	1
47	72	1
48	73	1
49	74	1
50	75	1
51	76	1
52	77	1
53	78	1
54	79	1
55	80	1
56	81	1
57	82	1
58	83	1
59	84	1
60	85	1
61	86	1
62	87	1
63	88	1
64	9	1
65	10	1
66	89	1
67	90	1
68	91	1
69	92	1
70	93	1
71	94	1
72	7	1
73	8	1
74	3	1
75	4	1
76	95	1
77	96	1
78	97	1
79	98	1
80	99	1
81	100	1
82	101	1
83	102	1
84	103	1
85	104	1
86	105	1
87	106	1
88	107	1
89	108	1
90	109	1
91	110	1
92	15	1
93	16	1
94	111	1
95	17	1
96	18	1
97	25	1
98	112	1
99	113	1
100	114	1
101	115	1
102	116	1
103	11	1
104	12	1
105	117	1
106	118	1
107	119	1
108	120	1
109	121	1
110	122	1
111	123	1
112	124	1
113	125	1
114	126	1
115	19	1
116	5	1
117	6	1
118	127	1
119	128	1
120	129	1
121	1	1
122	2	1
123	130	1
124	131	1
125	132	1
126	133	1
127	134	1
128	135	1
129	136	1
130	137	1
131	138	1
132	139	1
133	140	1
134	141	1
135	142	1
136	13	1
137	14	1
138	143	1
139	144	1
140	145	1
141	146	1
142	147	1
143	148	1
144	149	1
145	150	1
146	151	1
147	152	1
148	153	1
149	154	1
150	155	1
151	156	1
152	157	1
153	158	1
154	159	1
155	160	1
156	161	1
157	162	1
158	163	1
159	164	1
160	165	1
161	166	1
162	167	1
163	168	1
164	169	1
165	170	1
166	171	1
167	172	1
168	173	1
169	174	1
170	175	1
171	176	1
172	177	1
173	178	1
174	179	1
175	180	1
176	181	1
177	182	1
178	183	1
179	184	1
180	185	1
181	186	1
182	187	1
183	188	1
184	189	1
185	190	1
186	191	1
187	192	1
188	193	1
189	194	1
190	195	1
191	196	1
192	197	1
193	198	1
194	199	1
195	200	1
196	201	1
197	202	1
198	203	1
199	204	1
200	205	1
201	206	1
202	207	1
203	208	1
204	209	1
205	210	1
206	211	1
207	212	1
208	213	1
209	214	1
210	215	1
211	216	1
212	217	1
213	218	1
214	219	1
215	220	1
216	221	1
217	222	1
218	223	1
219	224	1
220	225	1
221	226	1
222	227	1
223	228	1
224	229	1
225	3	3
226	4	3
227	5	3
228	6	3
229	7	3
230	8	3
231	9	3
232	10	3
233	11	3
234	12	3
235	15	3
236	16	3
237	17	3
238	25	3
239	30	3
240	31	3
241	35	3
242	39	3
243	86	3
244	87	3
245	88	3
246	89	3
247	90	3
248	91	3
249	92	3
250	93	3
251	95	3
252	96	3
253	97	3
254	98	3
255	99	3
256	100	3
257	101	3
258	102	3
259	103	3
260	104	3
261	105	3
262	107	3
263	108	3
264	109	3
265	110	3
266	113	3
267	114	3
268	115	3
269	116	3
270	117	3
271	118	3
272	119	3
273	120	3
274	121	3
275	122	3
276	123	3
277	124	3
278	125	3
279	126	3
280	130	3
281	131	3
282	132	3
283	139	3
284	142	3
285	143	3
286	144	3
287	145	3
288	151	3
289	152	3
290	153	3
291	154	3
292	155	3
293	156	3
294	157	3
295	158	3
296	159	3
297	160	3
298	161	3
299	162	3
300	163	3
301	164	3
302	165	3
303	168	3
304	169	3
305	170	3
306	181	3
307	182	3
308	184	3
309	185	3
310	186	3
311	187	3
312	188	3
313	189	3
314	191	3
315	192	3
316	198	3
317	200	3
318	201	3
319	202	3
320	203	3
321	204	3
322	205	3
323	206	3
324	207	3
325	208	3
326	209	3
327	211	3
328	212	3
329	213	3
330	218	3
331	219	3
332	221	3
333	222	3
334	223	3
335	225	3
336	226	3
337	227	3
338	228	3
339	229	3
340	3	4
341	7	4
342	8	4
343	11	4
344	15	4
345	16	4
346	17	4
347	30	4
348	31	4
349	35	4
350	39	4
351	86	4
352	87	4
353	88	4
354	89	4
355	90	4
356	91	4
357	92	4
358	93	4
359	95	4
360	96	4
361	97	4
362	98	4
363	99	4
364	100	4
365	101	4
366	102	4
367	103	4
368	104	4
369	105	4
370	107	4
371	108	4
372	109	4
373	110	4
374	116	4
375	119	4
376	120	4
377	121	4
378	122	4
379	123	4
380	124	4
381	130	4
382	131	4
383	132	4
384	139	4
385	142	4
386	143	4
387	144	4
388	145	4
389	151	4
390	152	4
391	153	4
392	156	4
393	157	4
394	158	4
395	159	4
396	160	4
397	161	4
398	162	4
399	163	4
400	164	4
401	165	4
402	168	4
403	169	4
404	170	4
405	181	4
406	182	4
407	184	4
408	185	4
409	186	4
410	187	4
411	188	4
412	189	4
413	191	4
414	192	4
415	198	4
416	200	4
417	201	4
418	202	4
419	203	4
420	204	4
421	205	4
422	207	4
423	209	4
424	211	4
425	221	4
426	222	4
427	223	4
428	225	4
429	226	4
430	227	4
431	228	4
432	229	4
433	1	5
434	2	5
435	17	5
436	19	5
437	129	5
438	133	5
439	134	5
440	135	5
441	136	5
442	137	5
443	138	5
444	140	5
445	141	5
446	167	5
447	171	5
448	172	5
449	173	5
450	174	5
451	175	5
452	176	5
453	177	5
454	178	5
455	179	5
456	180	5
457	214	5
458	215	5
459	216	5
460	217	5
461	221	5
462	224	5
\.


--
-- Data for Name: ab_register_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ab_register_user (id, first_name, last_name, username, password, email, registration_date, registration_hash) FROM stdin;
\.


--
-- Data for Name: ab_role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ab_role (id, name) FROM stdin;
1	Admin
2	Public
3	Alpha
4	Gamma
5	sql_lab
\.


--
-- Data for Name: ab_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ab_user (id, first_name, last_name, username, password, active, email, last_login, login_count, fail_login_count, created_on, changed_on, created_by_fk, changed_by_fk) FROM stdin;
1	Superset	Admin	admin	scrypt:32768:8:1$1Nc9MGsEfRZl2J2q$97fb4d313d8c790cb963f0fb36f2d48462bd5ef3d6f17154d0c9875e5d5bf7915e7c9ded733c4c478d44cbab8b4eb34e399cb39a85f065878fc4937720d32fae	t	admin@superset.com	\N	\N	\N	2026-02-08 10:57:52.374475	2026-02-08 10:57:52.374507	\N	\N
\.


--
-- Data for Name: ab_user_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ab_user_group (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: ab_user_role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ab_user_role (id, user_id, role_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: ab_view_menu; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ab_view_menu (id, name) FROM stdin;
1	SavedQuery
2	CssTemplate
3	ReportSchedule
4	Chart
5	Annotation
6	Dataset
7	Log
8	Dashboard
9	Database
10	Query
11	SupersetIndexView
12	UtilView
13	LocaleView
14	SupersetAuthView
15	SupersetRegisterUserView
16	SecurityApi
17	UserInfoEditView
18	ResetPasswordView
19	ResetMyPasswordView
20	AuthDBView
21	UserDBModelView
22	RoleModelView
23	UserGroupModelView
24	Permission
25	Role
26	User
27	ViewMenu
28	PermissionViewMenu
29	Group
30	OpenApi
31	SwaggerView
32	MenuApi
33	AsyncEventsRestApi
34	AdvancedDataType
35	AvailableDomains
36	CacheRestApi
37	Theme
38	CurrentUserRestApi
39	UserRestApi
40	DashboardFilterStateRestApi
41	DashboardPermalinkRestApi
42	Datasource
43	EmbeddedDashboard
44	Explore
45	ExploreFormDataRestApi
46	ExplorePermalinkRestApi
47	ImportExportRestApi
48	Row Level Security
49	Tag
50	SQLLab
51	SqlLabPermalinkRestApi
52	security
53	DynamicPlugin
54	Extensions
55	Api
56	EmbeddedView
57	Superset
58	TableSchemaView
59	TabStateView
60	Tags
61	TagView
62	RoleRestAPI
63	user
64	UserRegistrationsRestAPI
65	SecurityRestApi
66	RowLevelSecurity
67	Security
68	List Roles
69	User Registrations
70	List Users
71	List Groups
72	Action Log
73	Home
74	Data
75	Databases
76	Dashboards
77	Charts
78	Datasets
79	Manage
80	Plugins
81	CSS Templates
82	Themes
83	Alerts & Report
84	Annotation Layers
85	SQL Lab
86	SQL Editor
87	Saved Queries
88	Query Search
89	all_datasource_access
90	all_database_access
91	all_query_access
92	[Bulletins DWH].(id:1)
93	[Bulletins DWH].[dwh]
94	[Bulletins DWH].[dwh].[information_schema]
95	[Bulletins DWH].[dwh].[public]
96	[Bulletins DWH].[dim_car](id:1)
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.alembic_version (version_num) FROM stdin;
9787190b3d89
\.


--
-- Data for Name: annotation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.annotation (created_on, changed_on, id, start_dttm, end_dttm, layer_id, short_descr, long_descr, changed_by_fk, created_by_fk, json_metadata) FROM stdin;
\.


--
-- Data for Name: annotation_layer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.annotation_layer (created_on, changed_on, id, name, descr, changed_by_fk, created_by_fk) FROM stdin;
\.


--
-- Data for Name: cache_keys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cache_keys (id, cache_key, cache_timeout, datasource_uid, created_on) FROM stdin;
\.


--
-- Data for Name: css_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.css_templates (created_on, changed_on, id, template_name, css, changed_by_fk, created_by_fk, uuid) FROM stdin;
\.


--
-- Data for Name: dashboard_roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dashboard_roles (id, role_id, dashboard_id) FROM stdin;
\.


--
-- Data for Name: dashboard_slices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dashboard_slices (id, dashboard_id, slice_id) FROM stdin;
\.


--
-- Data for Name: dashboard_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dashboard_user (id, user_id, dashboard_id) FROM stdin;
\.


--
-- Data for Name: dashboards; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dashboards (created_on, changed_on, id, dashboard_title, position_json, created_by_fk, changed_by_fk, css, description, slug, json_metadata, published, uuid, certified_by, certification_details, is_managed_externally, external_url, theme_id) FROM stdin;
\.


--
-- Data for Name: database_user_oauth2_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.database_user_oauth2_tokens (created_on, changed_on, id, user_id, database_id, access_token, access_token_expiration, refresh_token, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: dbs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dbs (created_on, changed_on, id, database_name, sqlalchemy_uri, created_by_fk, changed_by_fk, password, cache_timeout, extra, select_as_create_table_as, allow_ctas, expose_in_sqllab, force_ctas_schema, allow_run_async, allow_dml, verbose_name, impersonate_user, allow_file_upload, encrypted_extra, server_cert, allow_cvas, uuid, configuration_method, is_managed_externally, external_url) FROM stdin;
2026-02-08 10:58:48.802493	2026-02-08 10:58:51.263374	1	Bulletins DWH	postgresql+psycopg2://user:XXXXXXXXXX@postgres:5432/dwh	1	1	\\x513147736c72564852444676466e377739516d4b61673d3d	\N	{"allows_virtual_table_explore":true}	f	f	t	\N	f	f	\N	f	f	\\x2b476a6879765758364b5a673662464a6b364e6f4e413d3d	\N	f	75af6f54-5b65-4f5b-91e0-7c35cdb419e6	dynamic_form	f	\N
\.


--
-- Data for Name: dynamic_plugin; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.dynamic_plugin (created_on, changed_on, id, name, key, bundle_url, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: embedded_dashboards; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.embedded_dashboards (created_on, changed_on, allow_domain_list, uuid, dashboard_id, changed_by_fk, created_by_fk) FROM stdin;
\.


--
-- Data for Name: favstar; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.favstar (id, user_id, class_name, obj_id, dttm, uuid) FROM stdin;
\.


--
-- Data for Name: key_value; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.key_value (id, resource, value, uuid, created_on, created_by_fk, changed_on, changed_by_fk, expires_on) FROM stdin;
2	superset_metastore_cache	\\x2271393277754a433747543422	63e922dc-ffdc-3e51-8a6a-2230700edee0	2026-02-08 10:59:28.952123	1	\N	\N	2026-02-15 10:59:28.948282
1	superset_metastore_cache	\\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20312c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c226d6574726963735c223a5b5d2c5c2267726f757062795c223a5b5d2c5c2274696d655f72616e67655c223a5c224e6f2066696c7465725c222c5c22726f775f6c696d69745c223a313030302c5c2264617461736f757263655c223a5c22315f5f7461626c655c222c5c22616c6c5f636f6c756d6e735c223a5b5c226361725f6b65795c222c5c226d616e7566616374757265725c222c5c226d6f64656c5c222c5c22796561725c222c5c22656e67696e655f63617061636974795c222c5c22656e67696e655f706f7765725c222c5c22656e67696e655f747970655c222c5c227472616e736d697373696f6e5f747970655c222c5c22776865656c5f64726976655c222c5c227374656572696e675c222c5c22636f6c6f725c225d7d227d	e1e28791-6c36-3072-b56b-7be66de75e87	2026-02-08 10:59:28.940139	1	2026-02-08 10:59:30.204429	1	2026-02-15 10:59:30.20238
3	superset_metastore_cache	\\x22596e7765707a72307a346722	23b5dac6-07d1-3586-81fd-54fce6c935a1	2026-02-08 10:59:32.405789	1	\N	\N	2026-02-15 10:59:32.404631
4	superset_metastore_cache	\\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20312c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c22315f5f7461626c655c222c5c2276697a5f747970655c223a5c227461626c655c222c5c226d61747269786966795f656e61626c655f686f72697a6f6e74616c5f6c61796f75745c223a66616c73652c5c226d61747269786966795f73686f775f636f6c756d6e5f686561646572735c223a747275652c5c226d61747269786966795f6d6f64655f636f6c756d6e735c223a5c226d6574726963735c222c5c226d61747269786966795f64696d656e73696f6e5f73656c656374696f6e5f6d6f64655f636f6c756d6e735c223a5c226d656d626572735c222c5c226d61747269786966795f64696d656e73696f6e5f636f6c756d6e735c223a7b5c2264696d656e73696f6e5c223a5c225c222c5c2276616c7565735c223a5b5d7d2c5c226d61747269786966795f746f706e5f76616c75655f636f6c756d6e735c223a31302c5c226d61747269786966795f746f706e5f6f726465725f636f6c756d6e735c223a5c22646573635c222c5c226d61747269786966795f656e61626c655f766572746963616c5f6c61796f75745c223a66616c73652c5c226d61747269786966795f73686f775f726f775f6c6162656c735c223a747275652c5c226d61747269786966795f6d6f64655f726f77735c223a5c226d6574726963735c222c5c226d61747269786966795f64696d656e73696f6e5f73656c656374696f6e5f6d6f64655f726f77735c223a5c226d656d626572735c222c5c226d61747269786966795f64696d656e73696f6e5f726f77735c223a7b5c2264696d656e73696f6e5c223a5c225c222c5c2276616c7565735c223a5b5d7d2c5c226d61747269786966795f746f706e5f76616c75655f726f77735c223a31302c5c226d61747269786966795f746f706e5f6f726465725f726f77735c223a5c22646573635c222c5c226d61747269786966795f726f775f6865696768745c223a3330302c5c226d61747269786966795f6669745f636f6c756d6e735f64796e616d6963616c6c795c223a747275652c5c226d61747269786966795f6368617274735f7065725f726f775c223a332c5c226d61747269786966795f63656c6c5f7469746c655f74656d706c6174655c223a5c225c222c5c2271756572795f6d6f64655c223a5c227261775c222c5c2267726f757062795c223a5b5d2c5c2274696d655f677261696e5f73716c615c223a5c225031445c222c5c2274656d706f72616c5f636f6c756d6e735f6c6f6f6b75705c223a7b7d2c5c226d6574726963735c223a5b5d2c5c22616c6c5f636f6c756d6e735c223a5b5c226361725f6b65795c222c5c226d616e7566616374757265725c222c5c226d6f64656c5c222c5c22796561725c222c5c22656e67696e655f63617061636974795c222c5c22656e67696e655f706f7765725c222c5c22656e67696e655f747970655c222c5c227472616e736d697373696f6e5f747970655c222c5c22776865656c5f64726976655c222c5c227374656572696e675c222c5c22636f6c6f725c225d2c5c2270657263656e745f6d6574726963735c223a5b5d2c5c226164686f635f66696c746572735c223a5b5d2c5c226f726465725f62795f636f6c735c223a5b5d2c5c226f726465725f646573635c223a747275652c5c227365727665725f706167696e6174696f6e5c223a66616c73652c5c227365727665725f706167655f6c656e6774685c223a31302c5c22726f775f6c696d69745c223a313030302c5c2270657263656e745f6d65747269635f63616c63756c6174696f6e5c223a5c22726f775f6c696d69745c222c5c2273686f775f746f74616c735c223a66616c73652c5c227461626c655f74696d657374616d705f666f726d61745c223a5c22736d6172745f646174655c222c5c22696e636c7564655f7365617263685c223a66616c73652c5c22616c6c6f775f7265617272616e67655f636f6c756d6e735c223a66616c73652c5c22616c6c6f775f72656e6465725f68746d6c5c223a747275652c5c2273686f775f63656c6c5f626172735c223a747275652c5c22616c69676e5f706e5c223a66616c73652c5c22636f6c6f725f706e5c223a747275652c5c22636f6d70617269736f6e5f636f6c6f725f656e61626c65645c223a66616c73652c5c22636f6d70617269736f6e5f636f6c6f725f736368656d655c223a5c22477265656e5c222c5c22636f6d70617269736f6e5f747970655c223a5c2276616c7565735c222c5c2265787472615f666f726d5f646174615c223a7b7d7d227d	e6067c8b-3ba4-38b5-8ec5-401bd9cb8f8e	2026-02-08 10:59:32.415325	1	\N	\N	2026-02-15 10:59:32.412451
\.


--
-- Data for Name: keyvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.keyvalue (id, value) FROM stdin;
\.


--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.logs (id, action, user_id, json, dttm, dashboard_id, slice_id, duration_ms, referrer) FROM stdin;
1	welcome	1	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2026-02-08 10:58:11.807464	\N	\N	629	\N
2	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2026-02-08 10:58:12.52642	\N	\N	174	http://localhost:8088/superset/welcome/
3	LogRestApi.recent_activity	1	{"path": "/api/v1/log/recent_activity/", "q": "(distinct:!f,page_size:24)", "object_ref": "LogRestApi.recent_activity", "rison": {"distinct": false, "page_size": 24}}	2026-02-08 10:58:12.538243	\N	\N	77	http://localhost:8088/superset/welcome/
4	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2026-02-08 10:58:12.658693	\N	\N	181	http://localhost:8088/superset/welcome/
5	SavedQueryRestApi.get_list	1	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "1"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2026-02-08 10:58:12.870857	\N	\N	329	http://localhost:8088/superset/welcome/
6	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "1"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2026-02-08 10:58:12.990666	\N	\N	412	http://localhost:8088/superset/welcome/
7	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "object_ref": "DashboardRestApi.get_list"}	2026-02-08 10:58:13.054717	\N	\N	537	http://localhost:8088/superset/welcome/
8	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2026-02-08 10:58:13.255683	\N	\N	164	http://localhost:8088/superset/welcome/
9	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "object_ref": "DashboardRestApi.get_list"}	2026-02-08 10:58:13.263447	\N	\N	236	http://localhost:8088/superset/welcome/
10	ChartRestApi.get_list	1	{"path": "/api/v1/chart/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2026-02-08 10:58:13.289941	\N	\N	282	http://localhost:8088/superset/welcome/
11	ChartRestApi.get_list	1	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "1"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2026-02-08 10:58:13.29386	\N	\N	845	http://localhost:8088/superset/welcome/
12	log	1	{"impression_id": "imzmKkhOQIO8j9nFZeWFM", "version": "v2", "ts": 1770548292259, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "5pqsxZF5DTOGvj1PYP4Co", "visibility": "visible"}	2026-02-08 10:58:13.298764	\N	\N	0	http://localhost:8088/superset/welcome/
13	DashboardRestApi.info	1	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2026-02-08 10:58:13.423279	\N	\N	45	http://localhost:8088/superset/welcome/
14	ChartRestApi.info	1	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2026-02-08 10:58:13.432124	\N	\N	18	http://localhost:8088/superset/welcome/
15	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2026-02-08 10:58:18.235331	\N	\N	54	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
16	DatasetRestApi.info	1	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2026-02-08 10:58:18.241187	\N	\N	64	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
17	log	1	{"impression_id": "imzmKkhOQIO8j9nFZeWFM", "version": "v2", "ts": 1770548298027, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "-3_A-aD3tUjD1F7jsCPee", "visibility": "visible"}	2026-02-08 10:58:19.041589	\N	\N	0	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
18	LogRestApi.recent_activity	1	{"path": "/api/v1/log/recent_activity/", "q": "(distinct:!f,page_size:24)", "object_ref": "LogRestApi.recent_activity", "rison": {"distinct": false, "page_size": 24}}	2026-02-08 10:58:24.241121	\N	\N	15	http://localhost:8088/superset/welcome/
19	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "1"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2026-02-08 10:58:24.379211	\N	\N	108	http://localhost:8088/superset/welcome/
20	ChartRestApi.get_list	1	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "1"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2026-02-08 10:58:24.394368	\N	\N	148	http://localhost:8088/superset/welcome/
21	SavedQueryRestApi.get_list	1	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "1"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2026-02-08 10:58:24.397782	\N	\N	89	http://localhost:8088/superset/welcome/
22	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "object_ref": "DashboardRestApi.get_list"}	2026-02-08 10:58:24.42854	\N	\N	170	http://localhost:8088/superset/welcome/
26	ChartRestApi.info	1	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2026-02-08 10:58:24.644902	\N	\N	14	http://localhost:8088/superset/welcome/
23	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2026-02-08 10:58:24.504155	\N	\N	50	http://localhost:8088/superset/welcome/
28	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2026-02-08 10:58:25.253273	\N	\N	49	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
34	DatabaseRestApi.available	1	{"path": "/api/v1/database/available/", "object_ref": "DatabaseRestApi.available"}	2026-02-08 10:58:27.137399	\N	\N	21	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
39	validation_error	1	{"path": "/api/v1/database/validate_parameters/", "database_name": "PostgreSQL", "engine": "postgresql", "configuration_method": "dynamic_form", "engine_information": {"disable_ssh_tunneling": false, "supports_dynamic_catalog": true, "supports_file_upload": true, "supports_oauth2": false}, "driver": "psycopg2", "sqlalchemy_uri_placeholder": "postgresql://user:password@host:port/dbname[?key=value&key=value...]", "extra": "{\\"allows_virtual_table_explore\\":true}", "expose_in_sqllab": true, "parameters": {"host": "postgres", "port": "5432", "database": "dwh"}}	2026-02-08 10:58:38.175786	\N	\N	\N	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
43	DatabaseRestApi.validate_parameters	1	{"path": "/api/v1/database/validate_parameters/", "database_name": "Bulletins DWH", "engine": "postgresql", "configuration_method": "dynamic_form", "engine_information": {"disable_ssh_tunneling": false, "supports_dynamic_catalog": true, "supports_file_upload": true, "supports_oauth2": false}, "driver": "psycopg2", "sqlalchemy_uri_placeholder": "postgresql://user:password@host:port/dbname[?key=value&key=value...]", "extra": "{\\"allows_virtual_table_explore\\":true}", "expose_in_sqllab": true, "parameters": {"host": "postgres", "port": "5432", "database": "dwh", "username": "user", "password": "pwd"}, "object_ref": "DatabaseRestApi.validate_parameters"}	2026-02-08 10:58:48.71175	\N	\N	31	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
49	SqlLabRestApi.get	1	{"path": "/api/v1/sqllab/", "object_ref": "SqlLabRestApi.get"}	2026-02-08 10:58:54.84522	\N	\N	15	http://localhost:8088/sqllab/
54	log	1	{"source": "sqlLab", "ts": 1770548336916, "event_name": "sqllab_monitor_local_storage_usage", "current_usage": 0.14, "query_count": 0, "event_type": "user", "event_id": "u-OjKpQK-HW2gj4AgK9L2", "visibility": "visible"}	2026-02-08 10:58:57.938417	\N	\N	0	http://localhost:8088/sqllab/
24	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "object_ref": "DashboardRestApi.get_list"}	2026-02-08 10:58:24.519078	\N	\N	109	http://localhost:8088/superset/welcome/
29	DatasetRestApi.info	1	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2026-02-08 10:58:25.254829	\N	\N	55	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
36	validation_error	1	{"path": "/api/v1/database/validate_parameters/", "database_name": "PostgreSQL", "engine": "postgresql", "configuration_method": "dynamic_form", "engine_information": {"disable_ssh_tunneling": false, "supports_dynamic_catalog": true, "supports_file_upload": true, "supports_oauth2": false}, "driver": "psycopg2", "sqlalchemy_uri_placeholder": "postgresql://user:password@host:port/dbname[?key=value&key=value...]", "extra": "{\\"allows_virtual_table_explore\\":true}", "expose_in_sqllab": true, "parameters": {"host": "postgresd"}}	2026-02-08 10:58:34.417542	\N	\N	\N	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
40	DatabaseRestApi.validate_parameters	1	{"path": "/api/v1/database/validate_parameters/", "database_name": "PostgreSQL", "engine": "postgresql", "configuration_method": "dynamic_form", "engine_information": {"disable_ssh_tunneling": false, "supports_dynamic_catalog": true, "supports_file_upload": true, "supports_oauth2": false}, "driver": "psycopg2", "sqlalchemy_uri_placeholder": "postgresql://user:password@host:port/dbname[?key=value&key=value...]", "extra": "{\\"allows_virtual_table_explore\\":true}", "expose_in_sqllab": true, "parameters": {"host": "postgres", "port": "5432", "database": "dwh", "username": "user", "password": "pwd"}, "object_ref": "DatabaseRestApi.validate_parameters"}	2026-02-08 10:58:40.153181	\N	\N	67	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
45	test_connection_success	1	{"path": "/api/v1/database/", "database_name": "Bulletins DWH", "configuration_method": "dynamic_form", "engine_information": {"disable_ssh_tunneling": false, "supports_dynamic_catalog": true, "supports_file_upload": true, "supports_oauth2": false}, "sqlalchemy_uri_placeholder": "postgresql://user:password@host:port/dbname[?key=value&key=value...]", "extra": "{\\"allows_virtual_table_explore\\":true}", "expose_in_sqllab": true, "masked_encrypted_extra": "{}", "sqlalchemy_uri": "postgresql+psycopg2://user:pwd@postgres:5432/dwh", "engine": "postgresql"}	2026-02-08 10:58:48.792753	\N	\N	\N	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
47	DatabaseRestApi.validate_parameters	1	{"path": "/api/v1/database/validate_parameters/", "id": 1, "configuration_method": "dynamic_form", "database_name": "Bulletins DWH", "driver": "psycopg2", "expose_in_sqllab": true, "extra": "{\\"allows_virtual_table_explore\\":true}", "masked_encrypted_extra": "{}", "parameters": {"database": "dwh", "encryption": false, "host": "postgres", "password": "XXXXXXXXXX", "port": 5432, "query": {}, "username": "user"}, "sqlalchemy_uri": "postgresql+psycopg2://user:XXXXXXXXXX@postgres:5432/dwh", "uuid": "75af6f54-5b65-4f5b-91e0-7c35cdb419e6", "engine": "postgresql", "catalog": {}, "query_input": "", "object_ref": "DatabaseRestApi.validate_parameters"}	2026-02-08 10:58:51.173129	\N	\N	52	http://localhost:8088/tablemodelview/list/?databaseAdded=1&pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
51	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:'')),order_column:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}], "order_column": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2026-02-08 10:58:56.540434	\N	\N	39	http://localhost:8088/sqllab/
55	DatabaseRestApi.function_names	1	{"path": "/api/v1/database/1/function_names/", "url_rule": "/api/v1/database/<int:pk>/function_names/", "object_ref": "DatabaseRestApi.function_names", "pk": 1}	2026-02-08 10:59:00.677693	\N	\N	12	http://localhost:8088/sqllab
25	ChartRestApi.get_list	1	{"path": "/api/v1/chart/", "q": "(filters:!(),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2026-02-08 10:58:24.533545	\N	\N	122	http://localhost:8088/superset/welcome/
30	log	1	{"impression_id": "imzmKkhOQIO8j9nFZeWFM", "version": "v2", "ts": 1770548304156, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "r_e6V5MmWIt3NMDzyrpo8", "visibility": "visible"}	2026-02-08 10:58:26.143987	\N	\N	0	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
31	log	1	{"impression_id": "imzmKkhOQIO8j9nFZeWFM", "version": "v2", "ts": 1770548305122, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "-SiYTk_oNMj4h35TL036d", "visibility": "visible"}	2026-02-08 10:58:26.143992	\N	\N	0	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
37	validation_error	1	{"path": "/api/v1/database/validate_parameters/", "database_name": "PostgreSQL", "engine": "postgresql", "configuration_method": "dynamic_form", "engine_information": {"disable_ssh_tunneling": false, "supports_dynamic_catalog": true, "supports_file_upload": true, "supports_oauth2": false}, "driver": "psycopg2", "sqlalchemy_uri_placeholder": "postgresql://user:password@host:port/dbname[?key=value&key=value...]", "extra": "{\\"allows_virtual_table_explore\\":true}", "expose_in_sqllab": true, "parameters": {"host": "postgresd"}}	2026-02-08 10:58:34.950723	\N	\N	\N	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
41	DatabaseRestApi.validate_parameters	1	{"path": "/api/v1/database/validate_parameters/", "database_name": "Bulletins DWH", "engine": "postgresql", "configuration_method": "dynamic_form", "engine_information": {"disable_ssh_tunneling": false, "supports_dynamic_catalog": true, "supports_file_upload": true, "supports_oauth2": false}, "driver": "psycopg2", "sqlalchemy_uri_placeholder": "postgresql://user:password@host:port/dbname[?key=value&key=value...]", "extra": "{\\"allows_virtual_table_explore\\":true}", "expose_in_sqllab": true, "parameters": {"host": "postgres", "port": "5432", "database": "dwh", "username": "user", "password": "pwd"}, "object_ref": "DatabaseRestApi.validate_parameters"}	2026-02-08 10:58:46.45719	\N	\N	30	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
52	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:'')),order_column:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}], "order_column": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2026-02-08 10:58:57.704855	\N	\N	33	http://localhost:8088/sqllab/
57	log	1	{"impression_id": "imzmKkhOQIO8j9nFZeWFM", "version": "v2", "ts": 1770548340597, "event_name": "sqllab_load_tab_state", "payload": {"queryEditorId": "GQTAxeUTQi9", "duration": 76, "inLocalStorage": true, "hasLoaded": true}, "event_type": "timing", "trigger_event": "u-OjKpQK-HW2gj4AgK9L2"}	2026-02-08 10:59:01.641684	\N	\N	0	http://localhost:8088/sqllab
27	DashboardRestApi.info	1	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2026-02-08 10:58:24.663321	\N	\N	39	http://localhost:8088/superset/welcome/
33	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2026-02-08 10:58:26.29606	\N	\N	43	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
38	validation_error	1	{"path": "/api/v1/database/validate_parameters/", "database_name": "PostgreSQL", "engine": "postgresql", "configuration_method": "dynamic_form", "engine_information": {"disable_ssh_tunneling": false, "supports_dynamic_catalog": true, "supports_file_upload": true, "supports_oauth2": false}, "driver": "psycopg2", "sqlalchemy_uri_placeholder": "postgresql://user:password@host:port/dbname[?key=value&key=value...]", "extra": "{\\"allows_virtual_table_explore\\":true}", "expose_in_sqllab": true, "parameters": {"host": "postgres", "port": "5432"}}	2026-02-08 10:58:35.053922	\N	\N	\N	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
42	DatabaseRestApi.validate_parameters	1	{"path": "/api/v1/database/validate_parameters/", "database_name": "Bulletins DWH", "engine": "postgresql", "configuration_method": "dynamic_form", "engine_information": {"disable_ssh_tunneling": false, "supports_dynamic_catalog": true, "supports_file_upload": true, "supports_oauth2": false}, "driver": "psycopg2", "sqlalchemy_uri_placeholder": "postgresql://user:password@host:port/dbname[?key=value&key=value...]", "extra": "{\\"allows_virtual_table_explore\\":true}", "expose_in_sqllab": true, "parameters": {"host": "postgres", "port": "5432", "database": "dwh", "username": "user", "password": "pwd"}, "object_ref": "DatabaseRestApi.validate_parameters"}	2026-02-08 10:58:47.113453	\N	\N	28	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
48	DatabaseRestApi.put	1	{"path": "/api/v1/database/1", "id": 1, "configuration_method": "dynamic_form", "database_name": "Bulletins DWH", "expose_in_sqllab": true, "extra": "{\\"allows_virtual_table_explore\\":true}", "masked_encrypted_extra": "{}", "sqlalchemy_uri": "postgresql+psycopg2://user:XXXXXXXXXX@postgres:5432/dwh", "uuid": "75af6f54-5b65-4f5b-91e0-7c35cdb419e6", "catalog": [], "query_input": "", "url_rule": "/api/v1/database/<int:pk>", "object_ref": "DatabaseRestApi.put", "pk": 1}	2026-02-08 10:58:51.362952	\N	\N	149	http://localhost:8088/tablemodelview/list/?databaseAdded=1&pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
53	DatabaseRestApi.schemas	1	{"path": "/api/v1/database/1/schemas/", "q": "(force:!f)", "url_rule": "/api/v1/database/<int:pk>/schemas/", "object_ref": "DatabaseRestApi.schemas", "pk": 1, "rison": {"force": false}}	2026-02-08 10:58:57.746586	\N	\N	50	http://localhost:8088/sqllab/
32	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2026-02-08 10:58:26.273468	\N	\N	37	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
35	validation_error	1	{"path": "/api/v1/database/validate_parameters/", "database_name": "PostgreSQL", "engine": "postgresql", "configuration_method": "dynamic_form", "engine_information": {"disable_ssh_tunneling": false, "supports_dynamic_catalog": true, "supports_file_upload": true, "supports_oauth2": false}, "driver": "psycopg2", "sqlalchemy_uri_placeholder": "postgresql://user:password@host:port/dbname[?key=value&key=value...]", "extra": "{\\"allows_virtual_table_explore\\":true}", "expose_in_sqllab": true, "parameters": {"host": "postgres"}}	2026-02-08 10:58:32.858714	\N	\N	\N	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
44	test_connection_attempt	1	{"path": "/api/v1/database/", "database_name": "Bulletins DWH", "configuration_method": "dynamic_form", "engine_information": {"disable_ssh_tunneling": false, "supports_dynamic_catalog": true, "supports_file_upload": true, "supports_oauth2": false}, "sqlalchemy_uri_placeholder": "postgresql://user:password@host:port/dbname[?key=value&key=value...]", "extra": "{\\"allows_virtual_table_explore\\":true}", "expose_in_sqllab": true, "masked_encrypted_extra": "{}", "sqlalchemy_uri": "postgresql+psycopg2://user:pwd@postgres:5432/dwh", "engine": "postgresql"}	2026-02-08 10:58:48.760873	\N	\N	\N	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
46	DatabaseRestApi.post	1	{"path": "/api/v1/database/", "database_name": "Bulletins DWH", "configuration_method": "dynamic_form", "engine_information": {"disable_ssh_tunneling": false, "supports_dynamic_catalog": true, "supports_file_upload": true, "supports_oauth2": false}, "sqlalchemy_uri_placeholder": "postgresql://user:password@host:port/dbname[?key=value&key=value...]", "extra": "{\\"allows_virtual_table_explore\\":true}", "expose_in_sqllab": true, "masked_encrypted_extra": "{}", "sqlalchemy_uri": "postgresql+psycopg2://user:pwd@postgres:5432/dwh", "object_ref": "DatabaseRestApi.post"}	2026-02-08 10:58:48.988626	\N	\N	243	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
50	log	1	{"source": "sqlLab", "ts": 1770548334746, "event_name": "spa_navigation", "path": "/sqllab/", "event_type": "user", "event_id": "PXWcznS_nj5ARFZw976fX", "visibility": "visible"}	2026-02-08 10:58:55.789364	\N	\N	0	http://localhost:8088/sqllab/
56	DatabaseRestApi.validate_sql	1	{"path": "/api/v1/database/1/validate_sql/", "sql": "SELECT ...", "url_rule": "/api/v1/database/<int:pk>/validate_sql/", "object_ref": "DatabaseRestApi.validate_sql", "pk": 1}	2026-02-08 10:59:00.699192	\N	\N	36	http://localhost:8088/sqllab
58	DatabaseRestApi.validate_sql	1	{"path": "/api/v1/database/1/validate_sql/", "sql": "SELECT * from dim_car", "url_rule": "/api/v1/database/<int:pk>/validate_sql/", "object_ref": "DatabaseRestApi.validate_sql", "pk": 1}	2026-02-08 10:59:05.053278	\N	\N	22	http://localhost:8088/sqllab
59	execute_sql	1	{"path": "/", "object_ref": "superset.sql_lab"}	2026-02-08 10:59:05.225112	\N	\N	35	\N
60	SqlLabRestApi.get_results	1	{"path": "/api/v1/sqllab/execute/", "client_id": "gAtS5Bb5Ajo", "database_id": 1, "runAsync": false, "sql": "SELECT * from dim_car", "sql_editor_id": "GQTAxeUTQi9", "tab": "Untitled Query 1", "tmp_table_name": "", "select_as_cta": false, "ctas_method": "TABLE", "queryLimit": 1000, "expand_data": true, "object_ref": "SqlLabRestApi.execute_sql_query"}	2026-02-08 10:59:05.341885	\N	\N	322	http://localhost:8088/sqllab
61	log	1	{"impression_id": "imzmKkhOQIO8j9nFZeWFM", "version": "v2", "ts": 1770548344952, "event_name": "sqllab_run_query", "payload": {"queryEditorId": "GQTAxeUTQi9", "shortcut": false}, "event_type": "user", "event_id": "dvVznZx-dpgprw7MmfpNX", "visibility": "visible"}	2026-02-08 10:59:06.001611	\N	\N	0	http://localhost:8088/sqllab
62	log	1	{"impression_id": "imzmKkhOQIO8j9nFZeWFM", "version": "v2", "ts": 1770548346793, "event_name": "sqllab_create_chart", "payload": {"queryEditorId": "GQTAxeUTQi9"}, "event_type": "user", "event_id": "BI0c3VUg2WNftzzcTkMGl", "visibility": "visible"}	2026-02-08 10:59:07.861448	\N	\N	0	http://localhost:8088/sqllab
63	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2026-02-08 10:59:15.360167	\N	\N	40	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
64	DatasetRestApi.info	1	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2026-02-08 10:59:15.36997	\N	\N	43	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
65	ChartRestApi.info	1	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2026-02-08 10:59:16.42857	\N	\N	32	http://localhost:8088/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
66	ChartRestApi.get_list	1	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2026-02-08 10:59:16.521595	\N	\N	117	http://localhost:8088/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
67	log	1	{"impression_id": "imzmKkhOQIO8j9nFZeWFM", "version": "v2", "ts": 1770548355242, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "mcv4Sk30LRSEKRAXodlyW", "visibility": "visible"}	2026-02-08 10:59:17.2803	\N	\N	0	http://localhost:8088/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
68	log	1	{"impression_id": "imzmKkhOQIO8j9nFZeWFM", "version": "v2", "ts": 1770548356267, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "2ztlY7b2_gBLGHsbyodka", "visibility": "visible"}	2026-02-08 10:59:17.280303	\N	\N	0	http://localhost:8088/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
69	log	1	{"source": "sqlLab", "source_id": "GQTAxeUTQi9", "db_id": 1, "ts": 1770548358335, "event_name": "spa_navigation", "path": "/sqllab/", "event_type": "user", "event_id": "AqLOvS1SzUEd0jU1tKAbH", "visibility": "visible"}	2026-02-08 10:59:19.38449	\N	\N	0	http://localhost:8088/sqllab/
70	log	1	{"source": "sqlLab", "source_id": "GQTAxeUTQi9", "db_id": 1, "ts": 1770548358337, "event_name": "sqllab_load_tab_state", "payload": {"queryEditorId": "GQTAxeUTQi9", "duration": 2, "inLocalStorage": false, "hasLoaded": true}, "event_type": "timing", "trigger_event": "AqLOvS1SzUEd0jU1tKAbH"}	2026-02-08 10:59:19.384497	\N	\N	0	http://localhost:8088/sqllab/
71	log	1	{"source": "sqlLab", "source_id": "GQTAxeUTQi9", "db_id": 1, "ts": 1770548359897, "event_name": "sqllab_create_chart", "payload": {"queryEditorId": "GQTAxeUTQi9"}, "event_type": "user", "event_id": "Mw4GrVr7iMKEabS7gSedx", "visibility": "visible"}	2026-02-08 10:59:20.943544	\N	\N	0	http://localhost:8088/sqllab/
72	DatasetRestApi.post	1	{"path": "/api/v1/dataset/", "database": 1, "catalog": null, "schema": "", "sql": "SELECT * from dim_car", "table_name": "dim_car", "is_managed_externally": false, "external_url": null, "object_ref": "DatasetRestApi.post"}	2026-02-08 10:59:28.899244	\N	\N	146	http://localhost:8088/sqllab/
76	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2026-02-08 10:59:29.836947	\N	\N	91	http://localhost:8088/explore/?form_data_key=q92wuJC7GT4
80	QueryObject.post_processing	1	{"path": "/api/v1/chart/data", "datasource": {"id": 1, "type": "table"}, "force": false, "queries": [{"filters": [], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["car_key", "manufacturer", "model", "year", "engine_capacity", "engine_power", "engine_type", "transmission_type", "wheel_drive", "steering", "color"], "orderby": [], "annotation_layers": [], "row_limit": 1000, "series_limit": 0, "group_others_when_limit_reached": false, "order_desc": true, "url_params": {"form_data_key": "q92wuJC7GT4"}, "custom_params": {}, "custom_form_data": {}, "post_processing": [], "time_offsets": []}], "form_data": {"filters": [], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["car_key", "manufacturer", "model", "year", "engine_capacity", "engine_power", "engine_type", "transmission_type", "wheel_drive", "steering", "color"], "orderby": [], "annotation_layers": [], "row_limit": 1000, "series_limit": 0, "group_others_when_limit_reached": false, "order_desc": true, "url_params": {"form_data_key": "q92wuJC7GT4"}, "custom_params": {}, "custom_form_data": {}, "post_processing": [], "time_offsets": []}, "result_format": "json", "result_type": "full"}	2026-02-08 10:59:31.010371	\N	\N	0	http://localhost:8088/explore/?form_data_key=q92wuJC7GT4
85	load_into_dataframe	1	{"path": "/api/v1/chart/data", "datasource": {"id": 1, "type": "table"}, "force": false, "queries": [{"filters": [], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["car_key", "manufacturer", "model", "year", "engine_capacity", "engine_power", "engine_type", "transmission_type", "wheel_drive", "steering", "color"], "orderby": [], "annotation_layers": [], "row_limit": 1000, "series_limit": 0, "group_others_when_limit_reached": false, "order_desc": true, "url_params": {"form_data_key": "q92wuJC7GT4"}, "custom_params": {}, "custom_form_data": {}, "post_processing": [], "time_offsets": []}], "form_data": {"filters": [], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["car_key", "manufacturer", "model", "year", "engine_capacity", "engine_power", "engine_type", "transmission_type", "wheel_drive", "steering", "color"], "orderby": [], "annotation_layers": [], "row_limit": 1000, "series_limit": 0, "group_others_when_limit_reached": false, "order_desc": true, "url_params": {"form_data_key": "q92wuJC7GT4"}, "custom_params": {}, "custom_form_data": {}, "post_processing": [], "time_offsets": []}, "result_format": "json", "result_type": "full", "object_ref": "Database.load_into_dataframe"}	2026-02-08 10:59:31.616738	\N	\N	3	http://localhost:8088/explore/?form_data_key=q92wuJC7GT4
96	DatasetRestApi.info	1	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2026-02-08 10:59:33.42385	\N	\N	44	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
73	ExploreFormDataRestApi.post	1	{"path": "/api/v1/explore/form_data", "datasource_id": 1, "datasource_type": "table", "form_data": {}, "object_ref": "ExploreFormDataRestApi.post"}	2026-02-08 10:59:28.964481	\N	\N	35	http://localhost:8088/sqllab/
77	ExploreRestApi.get	1	{"path": "/api/v1/explore/", "form_data_key": "q92wuJC7GT4", "object_ref": "ExploreRestApi.get"}	2026-02-08 10:59:30.251871	\N	\N	57	http://localhost:8088/explore/?form_data_key=q92wuJC7GT4
82	_get_data_response	1	\N	2026-02-08 10:59:31.051096	\N	\N	367	http://localhost:8088/explore/?form_data_key=q92wuJC7GT4
87	ChartDataRestApi.json_dumps	1	{"path": "/api/v1/chart/data", "datasource": {"id": 1, "type": "table"}, "force": false, "queries": [{"filters": [], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["car_key", "manufacturer", "model", "year", "engine_capacity", "engine_power", "engine_type", "transmission_type", "wheel_drive", "steering", "color"], "orderby": [], "annotation_layers": [], "row_limit": 1000, "series_limit": 0, "group_others_when_limit_reached": false, "order_desc": true, "url_params": {"form_data_key": "q92wuJC7GT4"}, "custom_params": {}, "custom_form_data": {}, "post_processing": [], "time_offsets": []}], "form_data": {"filters": [], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["car_key", "manufacturer", "model", "year", "engine_capacity", "engine_power", "engine_type", "transmission_type", "wheel_drive", "steering", "color"], "orderby": [], "annotation_layers": [], "row_limit": 1000, "series_limit": 0, "group_others_when_limit_reached": false, "order_desc": true, "url_params": {"form_data_key": "q92wuJC7GT4"}, "custom_params": {}, "custom_form_data": {}, "post_processing": [], "time_offsets": []}, "result_format": "json", "result_type": "full"}	2026-02-08 10:59:31.656032	\N	\N	4	http://localhost:8088/explore/?form_data_key=q92wuJC7GT4
90	ExploreFormDataRestApi.put	1	{"path": "/api/v1/explore/form_data/q92wuJC7GT4", "tab_id": "10", "datasource_id": 1, "datasource_type": "table", "form_data": {}, "url_rule": "/api/v1/explore/form_data/<string:key>", "object_ref": "ExploreFormDataRestApi.put", "key": "q92wuJC7GT4"}	2026-02-08 10:59:32.426123	\N	\N	29	http://localhost:8088/explore/?form_data_key=q92wuJC7GT4
74	root	1	{"path": "/explore/", "form_data_key": "q92wuJC7GT4", "object_ref": "ExploreView.root"}	2026-02-08 10:59:29.156194	\N	\N	99	\N
78	execute_sql	1	{"path": "/api/v1/chart/data", "datasource": {"id": 1, "type": "table"}, "force": false, "queries": [{"filters": [], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["car_key", "manufacturer", "model", "year", "engine_capacity", "engine_power", "engine_type", "transmission_type", "wheel_drive", "steering", "color"], "orderby": [], "annotation_layers": [], "row_limit": 1000, "series_limit": 0, "group_others_when_limit_reached": false, "order_desc": true, "url_params": {"form_data_key": "q92wuJC7GT4"}, "custom_params": {}, "custom_form_data": {}, "post_processing": [], "time_offsets": []}], "form_data": {"filters": [], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["car_key", "manufacturer", "model", "year", "engine_capacity", "engine_power", "engine_type", "transmission_type", "wheel_drive", "steering", "color"], "orderby": [], "annotation_layers": [], "row_limit": 1000, "series_limit": 0, "group_others_when_limit_reached": false, "order_desc": true, "url_params": {"form_data_key": "q92wuJC7GT4"}, "custom_params": {}, "custom_form_data": {}, "post_processing": [], "time_offsets": []}, "result_format": "json", "result_type": "full", "object_ref": "superset.models.core"}	2026-02-08 10:59:30.784677	\N	\N	3	http://localhost:8088/explore/?form_data_key=q92wuJC7GT4
83	ChartDataRestApi.data	1	{"path": "/api/v1/chart/data", "datasource": {"id": 1, "type": "table"}, "force": false, "queries": [{"filters": [], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["car_key", "manufacturer", "model", "year", "engine_capacity", "engine_power", "engine_type", "transmission_type", "wheel_drive", "steering", "color"], "orderby": [], "annotation_layers": [], "row_limit": 1000, "series_limit": 0, "group_others_when_limit_reached": false, "order_desc": true, "url_params": {"form_data_key": "q92wuJC7GT4"}, "custom_params": {}, "custom_form_data": {}, "post_processing": [], "time_offsets": []}], "form_data": {"filters": [], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["car_key", "manufacturer", "model", "year", "engine_capacity", "engine_power", "engine_type", "transmission_type", "wheel_drive", "steering", "color"], "orderby": [], "annotation_layers": [], "row_limit": 1000, "series_limit": 0, "group_others_when_limit_reached": false, "order_desc": true, "url_params": {"form_data_key": "q92wuJC7GT4"}, "custom_params": {}, "custom_form_data": {}, "post_processing": [], "time_offsets": []}, "result_format": "json", "result_type": "full", "object_ref": "ChartDataRestApi.data", "is_cached": [null]}	2026-02-08 10:59:31.058196	\N	\N	429	http://localhost:8088/explore/?form_data_key=q92wuJC7GT4
88	_get_data_response	1	\N	2026-02-08 10:59:31.666094	\N	\N	156	http://localhost:8088/explore/?form_data_key=q92wuJC7GT4
91	log	1	{"impression_id": "M42ICmFi9ZFG0tFFfwClv", "version": "v2", "ts": 1770548369589, "event_name": "spa_navigation", "path": "/explore/", "event_type": "user", "event_id": "eEAe2XriAMRa8-D7bQvmn", "visibility": "visible"}	2026-02-08 10:59:32.720101	\N	\N	0	http://localhost:8088/explore/?form_data_key=q92wuJC7GT4&datasource_id=1&datasource_type=table
92	log	1	{"impression_id": "M42ICmFi9ZFG0tFFfwClv", "version": "v2", "ts": 1770548370479, "event_name": "mount_explorer", "event_type": "user", "event_id": "36bGFIp3YMrauZ9G3gTzO", "visibility": "visible"}	2026-02-08 10:59:32.720108	\N	\N	0	http://localhost:8088/explore/?form_data_key=q92wuJC7GT4&datasource_id=1&datasource_type=table
93	log	1	{"impression_id": "M42ICmFi9ZFG0tFFfwClv", "version": "v2", "ts": 1770548371085, "event_name": "load_chart", "slice_id": 0, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 551, "datasource": "1__table", "start_offset": 1532, "duration": 535, "viz_type": "table", "data_age": null, "event_type": "timing", "trigger_event": "36bGFIp3YMrauZ9G3gTzO"}	2026-02-08 10:59:32.721741	\N	0	0	http://localhost:8088/explore/?form_data_key=q92wuJC7GT4&datasource_id=1&datasource_type=table
94	log	1	{"impression_id": "M42ICmFi9ZFG0tFFfwClv", "version": "v2", "ts": 1770548371696, "event_name": "load_chart", "slice_id": 0, "applied_filters": [], "is_cached": null, "force_refresh": false, "row_count": 551, "datasource": "1__table", "start_offset": 2381, "duration": 296, "viz_type": "table", "data_age": null, "event_type": "timing", "trigger_event": "36bGFIp3YMrauZ9G3gTzO"}	2026-02-08 10:59:32.721749	\N	0	0	http://localhost:8088/explore/?form_data_key=q92wuJC7GT4&datasource_id=1&datasource_type=table
98	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2026-02-08 10:59:36.839527	\N	\N	0	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
75	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2026-02-08 10:59:29.822653	\N	\N	78	http://localhost:8088/explore/?form_data_key=q92wuJC7GT4
79	load_into_dataframe	1	{"path": "/api/v1/chart/data", "datasource": {"id": 1, "type": "table"}, "force": false, "queries": [{"filters": [], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["car_key", "manufacturer", "model", "year", "engine_capacity", "engine_power", "engine_type", "transmission_type", "wheel_drive", "steering", "color"], "orderby": [], "annotation_layers": [], "row_limit": 1000, "series_limit": 0, "group_others_when_limit_reached": false, "order_desc": true, "url_params": {"form_data_key": "q92wuJC7GT4"}, "custom_params": {}, "custom_form_data": {}, "post_processing": [], "time_offsets": []}], "form_data": {"filters": [], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["car_key", "manufacturer", "model", "year", "engine_capacity", "engine_power", "engine_type", "transmission_type", "wheel_drive", "steering", "color"], "orderby": [], "annotation_layers": [], "row_limit": 1000, "series_limit": 0, "group_others_when_limit_reached": false, "order_desc": true, "url_params": {"form_data_key": "q92wuJC7GT4"}, "custom_params": {}, "custom_form_data": {}, "post_processing": [], "time_offsets": []}, "result_format": "json", "result_type": "full", "object_ref": "Database.load_into_dataframe"}	2026-02-08 10:59:30.801815	\N	\N	4	http://localhost:8088/explore/?form_data_key=q92wuJC7GT4
84	execute_sql	1	{"path": "/api/v1/chart/data", "datasource": {"id": 1, "type": "table"}, "force": false, "queries": [{"filters": [], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["car_key", "manufacturer", "model", "year", "engine_capacity", "engine_power", "engine_type", "transmission_type", "wheel_drive", "steering", "color"], "orderby": [], "annotation_layers": [], "row_limit": 1000, "series_limit": 0, "group_others_when_limit_reached": false, "order_desc": true, "url_params": {"form_data_key": "q92wuJC7GT4"}, "custom_params": {}, "custom_form_data": {}, "post_processing": [], "time_offsets": []}], "form_data": {"filters": [], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["car_key", "manufacturer", "model", "year", "engine_capacity", "engine_power", "engine_type", "transmission_type", "wheel_drive", "steering", "color"], "orderby": [], "annotation_layers": [], "row_limit": 1000, "series_limit": 0, "group_others_when_limit_reached": false, "order_desc": true, "url_params": {"form_data_key": "q92wuJC7GT4"}, "custom_params": {}, "custom_form_data": {}, "post_processing": [], "time_offsets": []}, "result_format": "json", "result_type": "full", "object_ref": "superset.models.core"}	2026-02-08 10:59:31.60204	\N	\N	3	http://localhost:8088/explore/?form_data_key=q92wuJC7GT4
89	ChartDataRestApi.data	1	{"path": "/api/v1/chart/data", "datasource": {"id": 1, "type": "table"}, "force": false, "queries": [{"filters": [], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["car_key", "manufacturer", "model", "year", "engine_capacity", "engine_power", "engine_type", "transmission_type", "wheel_drive", "steering", "color"], "orderby": [], "annotation_layers": [], "row_limit": 1000, "series_limit": 0, "group_others_when_limit_reached": false, "order_desc": true, "url_params": {"form_data_key": "q92wuJC7GT4"}, "custom_params": {}, "custom_form_data": {}, "post_processing": [], "time_offsets": []}], "form_data": {"filters": [], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["car_key", "manufacturer", "model", "year", "engine_capacity", "engine_power", "engine_type", "transmission_type", "wheel_drive", "steering", "color"], "orderby": [], "annotation_layers": [], "row_limit": 1000, "series_limit": 0, "group_others_when_limit_reached": false, "order_desc": true, "url_params": {"form_data_key": "q92wuJC7GT4"}, "custom_params": {}, "custom_form_data": {}, "post_processing": [], "time_offsets": []}, "result_format": "json", "result_type": "full", "object_ref": "ChartDataRestApi.data", "is_cached": [null]}	2026-02-08 10:59:31.673739	\N	\N	210	http://localhost:8088/explore/?form_data_key=q92wuJC7GT4
95	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2026-02-08 10:59:33.418296	\N	\N	36	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
81	ChartDataRestApi.json_dumps	1	{"path": "/api/v1/chart/data", "datasource": {"id": 1, "type": "table"}, "force": false, "queries": [{"filters": [], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["car_key", "manufacturer", "model", "year", "engine_capacity", "engine_power", "engine_type", "transmission_type", "wheel_drive", "steering", "color"], "orderby": [], "annotation_layers": [], "row_limit": 1000, "series_limit": 0, "group_others_when_limit_reached": false, "order_desc": true, "url_params": {"form_data_key": "q92wuJC7GT4"}, "custom_params": {}, "custom_form_data": {}, "post_processing": [], "time_offsets": []}], "form_data": {"filters": [], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["car_key", "manufacturer", "model", "year", "engine_capacity", "engine_power", "engine_type", "transmission_type", "wheel_drive", "steering", "color"], "orderby": [], "annotation_layers": [], "row_limit": 1000, "series_limit": 0, "group_others_when_limit_reached": false, "order_desc": true, "url_params": {"form_data_key": "q92wuJC7GT4"}, "custom_params": {}, "custom_form_data": {}, "post_processing": [], "time_offsets": []}, "result_format": "json", "result_type": "full"}	2026-02-08 10:59:31.040769	\N	\N	3	http://localhost:8088/explore/?form_data_key=q92wuJC7GT4
86	QueryObject.post_processing	1	{"path": "/api/v1/chart/data", "datasource": {"id": 1, "type": "table"}, "force": false, "queries": [{"filters": [], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["car_key", "manufacturer", "model", "year", "engine_capacity", "engine_power", "engine_type", "transmission_type", "wheel_drive", "steering", "color"], "orderby": [], "annotation_layers": [], "row_limit": 1000, "series_limit": 0, "group_others_when_limit_reached": false, "order_desc": true, "url_params": {"form_data_key": "q92wuJC7GT4"}, "custom_params": {}, "custom_form_data": {}, "post_processing": [], "time_offsets": []}], "form_data": {"filters": [], "extras": {"time_grain_sqla": "P1D", "having": "", "where": ""}, "applied_time_extras": {}, "columns": ["car_key", "manufacturer", "model", "year", "engine_capacity", "engine_power", "engine_type", "transmission_type", "wheel_drive", "steering", "color"], "orderby": [], "annotation_layers": [], "row_limit": 1000, "series_limit": 0, "group_others_when_limit_reached": false, "order_desc": true, "url_params": {"form_data_key": "q92wuJC7GT4"}, "custom_params": {}, "custom_form_data": {}, "post_processing": [], "time_offsets": []}, "result_format": "json", "result_type": "full"}	2026-02-08 10:59:31.629369	\N	\N	0	http://localhost:8088/explore/?form_data_key=q92wuJC7GT4
97	log	1	{"impression_id": "M42ICmFi9ZFG0tFFfwClv", "version": "v2", "ts": 1770548373271, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "PUpcoxS9KPQ80pWRfSiIb", "visibility": "visible"}	2026-02-08 10:59:34.292445	\N	\N	0	http://localhost:8088/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
\.


--
-- Data for Name: query; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.query (id, client_id, database_id, tmp_table_name, tab_name, sql_editor_id, user_id, status, schema, sql, select_sql, executed_sql, "limit", select_as_cta, select_as_cta_used, progress, rows, error_message, start_time, changed_on, end_time, results_key, start_running_time, end_result_backend_time, tracking_url, extra_json, tmp_schema_name, ctas_method, limiting_factor, catalog) FROM stdin;
1	gAtS5Bb5Ajo	1	\N	Untitled Query 1	GQTAxeUTQi9	1	success	\N	SELECT * from dim_car	\N	SELECT\n  *\nFROM dim_car\nLIMIT 1001	1000	f	f	100	551	\N	1770548345037.405000	2026-02-08 10:59:05.301118	1770548345285.409000	\N	1770548345097.254200	\N	\N	{"cancel_query": 61, "progress": null, "columns": [{"column_name": "car_key", "name": "car_key", "type": "LONGINTEGER", "type_generic": 0, "is_dttm": false}, {"column_name": "manufacturer", "name": "manufacturer", "type": "STRING", "type_generic": 1, "is_dttm": false}, {"column_name": "model", "name": "model", "type": "STRING", "type_generic": 1, "is_dttm": false}, {"column_name": "year", "name": "year", "type": "INTEGER", "type_generic": 0, "is_dttm": false}, {"column_name": "engine_capacity", "name": "engine_capacity", "type": "DECIMAL", "type_generic": 0, "is_dttm": false}, {"column_name": "engine_power", "name": "engine_power", "type": "INTEGER", "type_generic": 0, "is_dttm": false}, {"column_name": "engine_type", "name": "engine_type", "type": "STRING", "type_generic": 1, "is_dttm": false}, {"column_name": "transmission_type", "name": "transmission_type", "type": "STRING", "type_generic": 1, "is_dttm": false}, {"column_name": "wheel_drive", "name": "wheel_drive", "type": "STRING", "type_generic": 1, "is_dttm": false}, {"column_name": "steering", "name": "steering", "type": "STRING", "type_generic": 1, "is_dttm": false}, {"column_name": "color", "name": "color", "type": "STRING", "type_generic": 1, "is_dttm": false}]}	\N	TABLE	NOT_LIMITED	dwh
\.


--
-- Data for Name: report_execution_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.report_execution_log (id, scheduled_dttm, start_dttm, end_dttm, value, value_row_json, state, error_message, report_schedule_id, uuid) FROM stdin;
\.


--
-- Data for Name: report_recipient; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.report_recipient (id, type, recipient_config_json, report_schedule_id, created_on, changed_on, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: report_schedule; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.report_schedule (id, type, name, description, context_markdown, active, crontab, sql, chart_id, dashboard_id, database_id, last_eval_dttm, last_state, last_value, last_value_row_json, validator_type, validator_config_json, log_retention, grace_period, created_on, changed_on, created_by_fk, changed_by_fk, working_timeout, report_format, creation_method, timezone, extra_json, force_screenshot, custom_width, custom_height, email_subject) FROM stdin;
\.


--
-- Data for Name: report_schedule_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.report_schedule_user (id, user_id, report_schedule_id) FROM stdin;
\.


--
-- Data for Name: rls_filter_roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.rls_filter_roles (id, role_id, rls_filter_id) FROM stdin;
\.


--
-- Data for Name: rls_filter_tables; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.rls_filter_tables (id, table_id, rls_filter_id) FROM stdin;
\.


--
-- Data for Name: row_level_security_filters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.row_level_security_filters (created_on, changed_on, id, clause, created_by_fk, changed_by_fk, filter_type, group_key, name, description) FROM stdin;
\.


--
-- Data for Name: saved_query; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.saved_query (created_on, changed_on, id, user_id, db_id, label, schema, sql, description, changed_by_fk, created_by_fk, extra_json, last_run, rows, uuid, template_parameters, catalog) FROM stdin;
\.


--
-- Data for Name: slice_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.slice_user (id, user_id, slice_id) FROM stdin;
\.


--
-- Data for Name: slices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.slices (created_on, changed_on, id, slice_name, druid_datasource_id, table_id, datasource_type, datasource_name, viz_type, params, created_by_fk, changed_by_fk, description, cache_timeout, perm, datasource_id, schema_perm, uuid, query_context, last_saved_at, last_saved_by_fk, certified_by, certification_details, is_managed_externally, external_url, catalog_perm) FROM stdin;
\.


--
-- Data for Name: sql_metrics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sql_metrics (created_on, changed_on, id, metric_name, verbose_name, metric_type, table_id, expression, description, created_by_fk, changed_by_fk, d3format, warning_text, extra, uuid, currency) FROM stdin;
2026-02-08 10:59:28.839629	2026-02-08 10:59:28.839635	1	count	COUNT(*)	count	1	COUNT(*)	\N	1	1	\N	\N	\N	e83360ff-4752-4347-90eb-0b58267c5d85	\N
\.


--
-- Data for Name: sqlatable_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sqlatable_user (id, user_id, table_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: ssh_tunnels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ssh_tunnels (created_on, changed_on, created_by_fk, changed_by_fk, extra_json, uuid, id, database_id, server_address, server_port, username, password, private_key, private_key_password) FROM stdin;
\.


--
-- Data for Name: tab_state; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tab_state (created_on, changed_on, extra_json, id, user_id, label, active, database_id, schema, sql, query_limit, latest_query_id, autorun, template_params, created_by_fk, changed_by_fk, hide_left_bar, saved_query_id, catalog) FROM stdin;
2026-02-08 10:59:04.946742	2026-02-08 10:59:10.023652	{"updatedAt":1770548344953,"version":1}	1	1	Untitled Query 1	t	1	\N	SELECT * from dim_car	1000	gAtS5Bb5Ajo	f	\N	1	1	f	\N	\N
\.


--
-- Data for Name: table_columns; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.table_columns (created_on, changed_on, id, table_id, column_name, is_dttm, is_active, type, groupby, filterable, description, created_by_fk, changed_by_fk, expression, verbose_name, python_date_format, uuid, extra, advanced_data_type, datetime_format) FROM stdin;
2026-02-08 10:59:28.843633	2026-02-08 10:59:28.843638	1	1	car_key	f	t	LONGINTEGER	t	t	\N	1	1	\N	\N	\N	40809254-3d4b-4f8b-b6b0-b484a9e021fc	\N	\N	\N
2026-02-08 10:59:28.84368	2026-02-08 10:59:28.843681	2	1	manufacturer	f	t	STRING	t	t	\N	1	1	\N	\N	\N	f5f082c6-bad7-4065-b7fa-e74e8ab95999	\N	\N	\N
2026-02-08 10:59:28.843696	2026-02-08 10:59:28.843698	3	1	model	f	t	STRING	t	t	\N	1	1	\N	\N	\N	c3fa96b1-2ad3-47f9-8007-03cd132dde5b	\N	\N	\N
2026-02-08 10:59:28.843712	2026-02-08 10:59:28.843713	4	1	year	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	470bf76e-4bde-40a8-8d98-853471c27bfa	\N	\N	\N
2026-02-08 10:59:28.843728	2026-02-08 10:59:28.843729	5	1	engine_capacity	f	t	DECIMAL	t	t	\N	1	1	\N	\N	\N	7dc71ec0-9bd1-48e3-80ba-b487a9050d92	\N	\N	\N
2026-02-08 10:59:28.843743	2026-02-08 10:59:28.843745	6	1	engine_power	f	t	INTEGER	t	t	\N	1	1	\N	\N	\N	b5155027-2536-40a0-809f-6e9c8fb276ab	\N	\N	\N
2026-02-08 10:59:28.843759	2026-02-08 10:59:28.84376	7	1	engine_type	f	t	STRING	t	t	\N	1	1	\N	\N	\N	6a470d38-2b7c-4b23-a30e-e9ce348d636b	\N	\N	\N
2026-02-08 10:59:28.843775	2026-02-08 10:59:28.843776	8	1	transmission_type	f	t	STRING	t	t	\N	1	1	\N	\N	\N	f05490c9-45d3-4779-9153-feadafd0015e	\N	\N	\N
2026-02-08 10:59:28.84379	2026-02-08 10:59:28.843791	9	1	wheel_drive	f	t	STRING	t	t	\N	1	1	\N	\N	\N	ff79bb8b-bcf3-48e3-b2c1-e65c0547d845	\N	\N	\N
2026-02-08 10:59:28.843806	2026-02-08 10:59:28.843807	10	1	steering	f	t	STRING	t	t	\N	1	1	\N	\N	\N	4c4e8cad-1462-46c4-986a-4d4531a8d5ea	\N	\N	\N
2026-02-08 10:59:28.843821	2026-02-08 10:59:28.843822	11	1	color	f	t	STRING	t	t	\N	1	1	\N	\N	\N	a314644a-cefa-4454-bf0c-60f4330b8fb5	\N	\N	\N
\.


--
-- Data for Name: table_schema; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.table_schema (created_on, changed_on, extra_json, id, tab_state_id, database_id, schema, "table", description, expanded, created_by_fk, changed_by_fk, catalog) FROM stdin;
\.


--
-- Data for Name: tables; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tables (created_on, changed_on, id, table_name, main_dttm_col, default_endpoint, database_id, created_by_fk, changed_by_fk, "offset", description, is_featured, cache_timeout, schema, sql, params, perm, filter_select_enabled, fetch_values_predicate, is_sqllab_view, template_params, schema_perm, extra, uuid, is_managed_externally, external_url, normalize_columns, always_filter_main_dttm, catalog, catalog_perm, folders, currency_code_column) FROM stdin;
2026-02-08 10:59:28.817118	2026-02-08 10:59:28.83486	1	dim_car	\N	\N	1	1	1	0	\N	f	\N		SELECT * from dim_car	\N	[Bulletins DWH].[dim_car](id:1)	t	\N	f	\N	\N	\N	9a993777-4434-4253-899b-bd53e31d5981	f	\N	f	f	dwh	[Bulletins DWH].[dwh]	\N	\N
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tag (created_on, changed_on, id, name, type, created_by_fk, changed_by_fk, description) FROM stdin;
\.


--
-- Data for Name: tagged_object; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tagged_object (created_on, changed_on, id, tag_id, object_id, object_type, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: themes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.themes (uuid, created_on, changed_on, id, theme_name, json_data, is_system, created_by_fk, changed_by_fk, is_system_default, is_system_dark) FROM stdin;
a2648e53-801a-4870-9fc4-c5e49f4123a7	2026-02-08 10:57:51.55911	2026-02-08 10:57:51.559115	1	THEME_DEFAULT	{"token": {"brandAppName": "Superset", "brandLogoAlt": "Apache Superset", "brandLogoUrl": "/static/assets/images/superset-logo-horiz.png", "brandLogoMargin": "18px 0", "brandLogoHref": "/", "brandLogoHeight": "24px", "brandSpinnerUrl": null, "brandSpinnerSvg": null, "colorPrimary": "#2893B3", "colorLink": "#2893B3", "colorError": "#e04355", "colorWarning": "#fcc700", "colorSuccess": "#5ac189", "colorInfo": "#66bcfe", "fontUrls": [], "fontFamily": "Inter, Helvetica, Arial, sans-serif", "fontFamilyCode": "'Fira Code', 'Courier New', monospace", "transitionTiming": 0.3, "brandIconMaxWidth": 37, "fontSizeXS": "8", "fontSizeXXL": "28", "fontWeightNormal": "400", "fontWeightLight": "300", "fontWeightStrong": "500", "colorEditorSelection": "#fff5cf"}, "algorithm": "default"}	t	\N	\N	f	f
075fb058-3768-4db9-9d5c-ad0a63f267b8	2026-02-08 10:57:51.566762	2026-02-08 10:57:51.566768	2	THEME_DARK	{"token": {"brandAppName": "Superset", "brandLogoAlt": "Apache Superset", "brandLogoUrl": "/static/assets/images/superset-logo-horiz.png", "brandLogoMargin": "18px 0", "brandLogoHref": "/", "brandLogoHeight": "24px", "brandSpinnerUrl": null, "brandSpinnerSvg": null, "colorPrimary": "#2893B3", "colorLink": "#2893B3", "colorError": "#e04355", "colorWarning": "#fcc700", "colorSuccess": "#5ac189", "colorInfo": "#66bcfe", "fontUrls": [], "fontFamily": "Inter, Helvetica, Arial, sans-serif", "fontFamilyCode": "'Fira Code', 'Courier New', monospace", "transitionTiming": 0.3, "brandIconMaxWidth": 37, "fontSizeXS": "8", "fontSizeXXL": "28", "fontWeightNormal": "400", "fontWeightLight": "300", "fontWeightStrong": "500", "colorEditorSelection": "#5c4d1a"}, "algorithm": "dark"}	t	\N	\N	f	f
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_attribute (created_on, changed_on, id, user_id, welcome_dashboard_id, created_by_fk, changed_by_fk, avatar_url) FROM stdin;
\.


--
-- Data for Name: user_favorite_tag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_favorite_tag (user_id, tag_id) FROM stdin;
\.


--
-- Name: ab_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ab_group_id_seq', 1, false);


--
-- Name: ab_group_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ab_group_role_id_seq', 1, false);


--
-- Name: ab_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ab_permission_id_seq', 92, true);


--
-- Name: ab_permission_view_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ab_permission_view_id_seq', 234, true);


--
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ab_permission_view_role_id_seq', 462, true);


--
-- Name: ab_register_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ab_register_user_id_seq', 1, false);


--
-- Name: ab_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ab_role_id_seq', 5, true);


--
-- Name: ab_user_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ab_user_group_id_seq', 1, false);


--
-- Name: ab_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ab_user_id_seq', 1, true);


--
-- Name: ab_user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ab_user_role_id_seq', 1, true);


--
-- Name: ab_view_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ab_view_menu_id_seq', 96, true);


--
-- Name: annotation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.annotation_id_seq', 1, false);


--
-- Name: annotation_layer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.annotation_layer_id_seq', 1, false);


--
-- Name: cache_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cache_keys_id_seq', 1, false);


--
-- Name: css_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.css_templates_id_seq', 1, false);


--
-- Name: dashboard_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dashboard_roles_id_seq', 1, false);


--
-- Name: dashboard_slices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dashboard_slices_id_seq', 1, false);


--
-- Name: dashboard_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dashboard_user_id_seq', 1, false);


--
-- Name: dashboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dashboards_id_seq', 1, false);


--
-- Name: database_user_oauth2_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.database_user_oauth2_tokens_id_seq', 1, false);


--
-- Name: dbs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dbs_id_seq', 1, true);


--
-- Name: dynamic_plugin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dynamic_plugin_id_seq', 1, false);


--
-- Name: favstar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.favstar_id_seq', 1, false);


--
-- Name: key_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.key_value_id_seq', 4, true);


--
-- Name: keyvalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.keyvalue_id_seq', 1, false);


--
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.logs_id_seq', 98, true);


--
-- Name: query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.query_id_seq', 1, true);


--
-- Name: report_execution_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.report_execution_log_id_seq', 1, false);


--
-- Name: report_recipient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.report_recipient_id_seq', 1, false);


--
-- Name: report_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.report_schedule_id_seq', 1, false);


--
-- Name: report_schedule_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.report_schedule_user_id_seq', 1, false);


--
-- Name: rls_filter_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.rls_filter_roles_id_seq', 1, false);


--
-- Name: rls_filter_tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.rls_filter_tables_id_seq', 1, false);


--
-- Name: row_level_security_filters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.row_level_security_filters_id_seq', 1, false);


--
-- Name: saved_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.saved_query_id_seq', 1, false);


--
-- Name: slice_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.slice_user_id_seq', 1, false);


--
-- Name: slices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.slices_id_seq', 1, false);


--
-- Name: sql_metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sql_metrics_id_seq', 1, true);


--
-- Name: sqlatable_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sqlatable_user_id_seq', 1, true);


--
-- Name: ssh_tunnels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ssh_tunnels_id_seq', 1, false);


--
-- Name: tab_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tab_state_id_seq', 1, true);


--
-- Name: table_columns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.table_columns_id_seq', 11, true);


--
-- Name: table_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.table_schema_id_seq', 1, false);


--
-- Name: tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tables_id_seq', 1, true);


--
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tag_id_seq', 1, false);


--
-- Name: tagged_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tagged_object_id_seq', 1, false);


--
-- Name: themes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.themes_id_seq', 2, true);


--
-- Name: user_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_attribute_id_seq', 1, false);


--
-- Name: tables _customer_location_uc; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT _customer_location_uc UNIQUE (database_id, schema, table_name);


--
-- Name: ab_group ab_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_group
    ADD CONSTRAINT ab_group_name_key UNIQUE (name);


--
-- Name: ab_group ab_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_group
    ADD CONSTRAINT ab_group_pkey PRIMARY KEY (id);


--
-- Name: ab_group_role ab_group_role_group_id_role_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_group_role
    ADD CONSTRAINT ab_group_role_group_id_role_id_key UNIQUE (group_id, role_id);


--
-- Name: ab_group_role ab_group_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_group_role
    ADD CONSTRAINT ab_group_role_pkey PRIMARY KEY (id);


--
-- Name: ab_permission ab_permission_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_permission
    ADD CONSTRAINT ab_permission_name_key UNIQUE (name);


--
-- Name: ab_permission ab_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_permission
    ADD CONSTRAINT ab_permission_pkey PRIMARY KEY (id);


--
-- Name: ab_permission_view ab_permission_view_permission_id_view_menu_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_permission_id_view_menu_id_key UNIQUE (permission_id, view_menu_id);


--
-- Name: ab_permission_view ab_permission_view_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_pkey PRIMARY KEY (id);


--
-- Name: ab_permission_view_role ab_permission_view_role_permission_view_id_role_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_permission_view_id_role_id_key UNIQUE (permission_view_id, role_id);


--
-- Name: ab_permission_view_role ab_permission_view_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_pkey PRIMARY KEY (id);


--
-- Name: ab_register_user ab_register_user_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_register_user
    ADD CONSTRAINT ab_register_user_email_key UNIQUE (email);


--
-- Name: ab_register_user ab_register_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_register_user
    ADD CONSTRAINT ab_register_user_pkey PRIMARY KEY (id);


--
-- Name: ab_register_user ab_register_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_register_user
    ADD CONSTRAINT ab_register_user_username_key UNIQUE (username);


--
-- Name: ab_role ab_role_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_role
    ADD CONSTRAINT ab_role_name_key UNIQUE (name);


--
-- Name: ab_role ab_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_role
    ADD CONSTRAINT ab_role_pkey PRIMARY KEY (id);


--
-- Name: ab_user ab_user_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_email_key UNIQUE (email);


--
-- Name: ab_user_group ab_user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_user_group
    ADD CONSTRAINT ab_user_group_pkey PRIMARY KEY (id);


--
-- Name: ab_user_group ab_user_group_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_user_group
    ADD CONSTRAINT ab_user_group_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: ab_user ab_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_pkey PRIMARY KEY (id);


--
-- Name: ab_user_role ab_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_pkey PRIMARY KEY (id);


--
-- Name: ab_user_role ab_user_role_user_id_role_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_user_id_role_id_key UNIQUE (user_id, role_id);


--
-- Name: ab_user ab_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_username_key UNIQUE (username);


--
-- Name: ab_view_menu ab_view_menu_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_view_menu
    ADD CONSTRAINT ab_view_menu_name_key UNIQUE (name);


--
-- Name: ab_view_menu ab_view_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_view_menu
    ADD CONSTRAINT ab_view_menu_pkey PRIMARY KEY (id);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: annotation_layer annotation_layer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.annotation_layer
    ADD CONSTRAINT annotation_layer_pkey PRIMARY KEY (id);


--
-- Name: annotation annotation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_pkey PRIMARY KEY (id);


--
-- Name: cache_keys cache_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cache_keys
    ADD CONSTRAINT cache_keys_pkey PRIMARY KEY (id);


--
-- Name: query client_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT client_id UNIQUE (client_id);


--
-- Name: css_templates css_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.css_templates
    ADD CONSTRAINT css_templates_pkey PRIMARY KEY (id);


--
-- Name: dashboard_roles dashboard_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dashboard_roles
    ADD CONSTRAINT dashboard_roles_pkey PRIMARY KEY (id);


--
-- Name: dashboard_slices dashboard_slices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT dashboard_slices_pkey PRIMARY KEY (id);


--
-- Name: dashboard_user dashboard_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dashboard_user
    ADD CONSTRAINT dashboard_user_pkey PRIMARY KEY (id);


--
-- Name: dashboards dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_pkey PRIMARY KEY (id);


--
-- Name: database_user_oauth2_tokens database_user_oauth2_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.database_user_oauth2_tokens
    ADD CONSTRAINT database_user_oauth2_tokens_pkey PRIMARY KEY (id);


--
-- Name: dbs dbs_database_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_database_name_key UNIQUE (database_name);


--
-- Name: dbs dbs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_pkey PRIMARY KEY (id);


--
-- Name: dbs dbs_verbose_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_verbose_name_key UNIQUE (verbose_name);


--
-- Name: dynamic_plugin dynamic_plugin_key_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_key_key UNIQUE (key);


--
-- Name: dynamic_plugin dynamic_plugin_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_name_key UNIQUE (name);


--
-- Name: dynamic_plugin dynamic_plugin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_pkey PRIMARY KEY (id);


--
-- Name: favstar favstar_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favstar
    ADD CONSTRAINT favstar_pkey PRIMARY KEY (id);


--
-- Name: dashboards idx_unique_slug; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT idx_unique_slug UNIQUE (slug);


--
-- Name: key_value key_value_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.key_value
    ADD CONSTRAINT key_value_pkey PRIMARY KEY (id);


--
-- Name: keyvalue keyvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.keyvalue
    ADD CONSTRAINT keyvalue_pkey PRIMARY KEY (id);


--
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- Name: query query_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT query_pkey PRIMARY KEY (id);


--
-- Name: report_execution_log report_execution_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.report_execution_log
    ADD CONSTRAINT report_execution_log_pkey PRIMARY KEY (id);


--
-- Name: report_recipient report_recipient_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.report_recipient
    ADD CONSTRAINT report_recipient_pkey PRIMARY KEY (id);


--
-- Name: report_schedule report_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_pkey PRIMARY KEY (id);


--
-- Name: report_schedule_user report_schedule_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.report_schedule_user
    ADD CONSTRAINT report_schedule_user_pkey PRIMARY KEY (id);


--
-- Name: rls_filter_roles rls_filter_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rls_filter_roles
    ADD CONSTRAINT rls_filter_roles_pkey PRIMARY KEY (id);


--
-- Name: rls_filter_tables rls_filter_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rls_filter_tables
    ADD CONSTRAINT rls_filter_tables_pkey PRIMARY KEY (id);


--
-- Name: row_level_security_filters row_level_security_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.row_level_security_filters
    ADD CONSTRAINT row_level_security_filters_pkey PRIMARY KEY (id);


--
-- Name: saved_query saved_query_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_pkey PRIMARY KEY (id);


--
-- Name: slice_user slice_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slice_user
    ADD CONSTRAINT slice_user_pkey PRIMARY KEY (id);


--
-- Name: slices slices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_pkey PRIMARY KEY (id);


--
-- Name: sql_metrics sql_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT sql_metrics_pkey PRIMARY KEY (id);


--
-- Name: sqlatable_user sqlatable_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sqlatable_user
    ADD CONSTRAINT sqlatable_user_pkey PRIMARY KEY (id);


--
-- Name: ssh_tunnels ssh_tunnels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ssh_tunnels
    ADD CONSTRAINT ssh_tunnels_pkey PRIMARY KEY (id);


--
-- Name: tab_state tab_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_pkey PRIMARY KEY (id);


--
-- Name: table_columns table_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT table_columns_pkey PRIMARY KEY (id);


--
-- Name: table_schema table_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_pkey PRIMARY KEY (id);


--
-- Name: tables tables_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (id);


--
-- Name: tag tag_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_name_key UNIQUE (name);


--
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- Name: tagged_object tagged_object_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT tagged_object_pkey PRIMARY KEY (id);


--
-- Name: themes themes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_pkey PRIMARY KEY (id);


--
-- Name: themes themes_uuid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_uuid_key UNIQUE (uuid);


--
-- Name: tagged_object uix_tagged_object; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT uix_tagged_object UNIQUE (tag_id, object_id, object_type);


--
-- Name: dashboard_slices uq_dashboard_slice; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT uq_dashboard_slice UNIQUE (dashboard_id, slice_id);


--
-- Name: dashboards uq_dashboards_uuid; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT uq_dashboards_uuid UNIQUE (uuid);


--
-- Name: dbs uq_dbs_uuid; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT uq_dbs_uuid UNIQUE (uuid);


--
-- Name: report_schedule uq_report_schedule_name_type; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT uq_report_schedule_name_type UNIQUE (name, type);


--
-- Name: row_level_security_filters uq_rls_name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.row_level_security_filters
    ADD CONSTRAINT uq_rls_name UNIQUE (name);


--
-- Name: saved_query uq_saved_query_uuid; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT uq_saved_query_uuid UNIQUE (uuid);


--
-- Name: slices uq_slices_uuid; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT uq_slices_uuid UNIQUE (uuid);


--
-- Name: sql_metrics uq_sql_metrics_metric_name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT uq_sql_metrics_metric_name UNIQUE (metric_name, table_id);


--
-- Name: sql_metrics uq_sql_metrics_uuid; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT uq_sql_metrics_uuid UNIQUE (uuid);


--
-- Name: table_columns uq_table_columns_column_name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT uq_table_columns_column_name UNIQUE (column_name, table_id);


--
-- Name: table_columns uq_table_columns_uuid; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT uq_table_columns_uuid UNIQUE (uuid);


--
-- Name: tables uq_tables_uuid; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT uq_tables_uuid UNIQUE (uuid);


--
-- Name: user_attribute user_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_pkey PRIMARY KEY (id);


--
-- Name: idx_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_group_id ON public.ab_group_role USING btree (group_id);


--
-- Name: idx_group_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_group_role_id ON public.ab_group_role USING btree (role_id);


--
-- Name: idx_permission_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_permission_id ON public.ab_permission_view USING btree (permission_id);


--
-- Name: idx_permission_view_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_permission_view_id ON public.ab_permission_view_role USING btree (permission_view_id);


--
-- Name: idx_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_role_id ON public.ab_permission_view_role USING btree (role_id);


--
-- Name: idx_theme_is_system_dark; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_theme_is_system_dark ON public.themes USING btree (is_system_dark);


--
-- Name: idx_theme_is_system_default; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_theme_is_system_default ON public.themes USING btree (is_system_default);


--
-- Name: idx_user_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_user_group_id ON public.ab_user_group USING btree (group_id);


--
-- Name: idx_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_user_id ON public.ab_user_group USING btree (user_id);


--
-- Name: idx_user_id_database_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_user_id_database_id ON public.database_user_oauth2_tokens USING btree (user_id, database_id);


--
-- Name: idx_view_menu_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_view_menu_id ON public.ab_permission_view USING btree (view_menu_id);


--
-- Name: ix_cache_keys_datasource_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_cache_keys_datasource_uid ON public.cache_keys USING btree (datasource_uid);


--
-- Name: ix_creation_method; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_creation_method ON public.report_schedule USING btree (creation_method);


--
-- Name: ix_key_value_expires_on; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_key_value_expires_on ON public.key_value USING btree (expires_on);


--
-- Name: ix_key_value_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX ix_key_value_uuid ON public.key_value USING btree (uuid);


--
-- Name: ix_logs_user_id_dttm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_logs_user_id_dttm ON public.logs USING btree (user_id, dttm);


--
-- Name: ix_query_results_key; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_query_results_key ON public.query USING btree (results_key);


--
-- Name: ix_report_execution_log_report_schedule_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_report_execution_log_report_schedule_id ON public.report_execution_log USING btree (report_schedule_id);


--
-- Name: ix_report_execution_log_start_dttm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_report_execution_log_start_dttm ON public.report_execution_log USING btree (start_dttm);


--
-- Name: ix_report_recipient_report_schedule_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_report_recipient_report_schedule_id ON public.report_recipient USING btree (report_schedule_id);


--
-- Name: ix_report_schedule_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_report_schedule_active ON public.report_schedule USING btree (active);


--
-- Name: ix_row_level_security_filters_filter_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_row_level_security_filters_filter_type ON public.row_level_security_filters USING btree (filter_type);


--
-- Name: ix_sql_editor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_sql_editor_id ON public.query USING btree (sql_editor_id);


--
-- Name: ix_ssh_tunnels_database_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX ix_ssh_tunnels_database_id ON public.ssh_tunnels USING btree (database_id);


--
-- Name: ix_ssh_tunnels_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX ix_ssh_tunnels_uuid ON public.ssh_tunnels USING btree (uuid);


--
-- Name: ix_tab_state_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX ix_tab_state_id ON public.tab_state USING btree (id);


--
-- Name: ix_table_schema_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX ix_table_schema_id ON public.table_schema USING btree (id);


--
-- Name: ix_tagged_object_object_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_tagged_object_object_id ON public.tagged_object USING btree (object_id);


--
-- Name: ti_dag_state; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ti_dag_state ON public.annotation USING btree (layer_id, start_dttm, end_dttm);


--
-- Name: ti_user_id_changed_on; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ti_user_id_changed_on ON public.query USING btree (user_id, changed_on);


--
-- Name: ab_group_role ab_group_role_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_group_role
    ADD CONSTRAINT ab_group_role_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.ab_group(id) ON DELETE CASCADE;


--
-- Name: ab_group_role ab_group_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_group_role
    ADD CONSTRAINT ab_group_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id) ON DELETE CASCADE;


--
-- Name: ab_permission_view ab_permission_view_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.ab_permission(id);


--
-- Name: ab_permission_view_role ab_permission_view_role_permission_view_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_permission_view_id_fkey FOREIGN KEY (permission_view_id) REFERENCES public.ab_permission_view(id) ON DELETE CASCADE;


--
-- Name: ab_permission_view_role ab_permission_view_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id) ON DELETE CASCADE;


--
-- Name: ab_permission_view ab_permission_view_view_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_view_menu_id_fkey FOREIGN KEY (view_menu_id) REFERENCES public.ab_view_menu(id);


--
-- Name: ab_user ab_user_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: ab_user ab_user_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: ab_user_group ab_user_group_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_user_group
    ADD CONSTRAINT ab_user_group_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.ab_group(id) ON DELETE CASCADE;


--
-- Name: ab_user_group ab_user_group_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_user_group
    ADD CONSTRAINT ab_user_group_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id) ON DELETE CASCADE;


--
-- Name: ab_user_role ab_user_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id) ON DELETE CASCADE;


--
-- Name: ab_user_role ab_user_role_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id) ON DELETE CASCADE;


--
-- Name: annotation annotation_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: annotation annotation_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: annotation_layer annotation_layer_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.annotation_layer
    ADD CONSTRAINT annotation_layer_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: annotation_layer annotation_layer_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.annotation_layer
    ADD CONSTRAINT annotation_layer_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: annotation annotation_layer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_layer_id_fkey FOREIGN KEY (layer_id) REFERENCES public.annotation_layer(id);


--
-- Name: css_templates css_templates_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.css_templates
    ADD CONSTRAINT css_templates_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: css_templates css_templates_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.css_templates
    ADD CONSTRAINT css_templates_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dashboards dashboards_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dashboards dashboards_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: database_user_oauth2_tokens database_user_oauth2_tokens_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.database_user_oauth2_tokens
    ADD CONSTRAINT database_user_oauth2_tokens_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: database_user_oauth2_tokens database_user_oauth2_tokens_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.database_user_oauth2_tokens
    ADD CONSTRAINT database_user_oauth2_tokens_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: database_user_oauth2_tokens database_user_oauth2_tokens_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.database_user_oauth2_tokens
    ADD CONSTRAINT database_user_oauth2_tokens_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id) ON DELETE CASCADE;


--
-- Name: database_user_oauth2_tokens database_user_oauth2_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.database_user_oauth2_tokens
    ADD CONSTRAINT database_user_oauth2_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id) ON DELETE CASCADE;


--
-- Name: dbs dbs_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dbs dbs_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dynamic_plugin dynamic_plugin_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dynamic_plugin dynamic_plugin_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: favstar favstar_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favstar
    ADD CONSTRAINT favstar_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: dashboard_roles fk_dashboard_roles_dashboard_id_dashboards; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dashboard_roles
    ADD CONSTRAINT fk_dashboard_roles_dashboard_id_dashboards FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id) ON DELETE CASCADE;


--
-- Name: dashboard_roles fk_dashboard_roles_role_id_ab_role; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dashboard_roles
    ADD CONSTRAINT fk_dashboard_roles_role_id_ab_role FOREIGN KEY (role_id) REFERENCES public.ab_role(id) ON DELETE CASCADE;


--
-- Name: dashboard_slices fk_dashboard_slices_dashboard_id_dashboards; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT fk_dashboard_slices_dashboard_id_dashboards FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id) ON DELETE CASCADE;


--
-- Name: dashboard_slices fk_dashboard_slices_slice_id_slices; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT fk_dashboard_slices_slice_id_slices FOREIGN KEY (slice_id) REFERENCES public.slices(id) ON DELETE CASCADE;


--
-- Name: dashboard_user fk_dashboard_user_dashboard_id_dashboards; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dashboard_user
    ADD CONSTRAINT fk_dashboard_user_dashboard_id_dashboards FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id) ON DELETE CASCADE;


--
-- Name: dashboard_user fk_dashboard_user_user_id_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dashboard_user
    ADD CONSTRAINT fk_dashboard_user_user_id_ab_user FOREIGN KEY (user_id) REFERENCES public.ab_user(id) ON DELETE CASCADE;


--
-- Name: dashboards fk_dashboards_theme_id_themes; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT fk_dashboards_theme_id_themes FOREIGN KEY (theme_id) REFERENCES public.themes(id);


--
-- Name: embedded_dashboards fk_embedded_dashboards_dashboard_id_dashboards; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.embedded_dashboards
    ADD CONSTRAINT fk_embedded_dashboards_dashboard_id_dashboards FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id) ON DELETE CASCADE;


--
-- Name: report_schedule_user fk_report_schedule_user_report_schedule_id_report_schedule; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.report_schedule_user
    ADD CONSTRAINT fk_report_schedule_user_report_schedule_id_report_schedule FOREIGN KEY (report_schedule_id) REFERENCES public.report_schedule(id) ON DELETE CASCADE;


--
-- Name: report_schedule_user fk_report_schedule_user_user_id_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.report_schedule_user
    ADD CONSTRAINT fk_report_schedule_user_user_id_ab_user FOREIGN KEY (user_id) REFERENCES public.ab_user(id) ON DELETE CASCADE;


--
-- Name: slice_user fk_slice_user_slice_id_slices; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slice_user
    ADD CONSTRAINT fk_slice_user_slice_id_slices FOREIGN KEY (slice_id) REFERENCES public.slices(id) ON DELETE CASCADE;


--
-- Name: slice_user fk_slice_user_user_id_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slice_user
    ADD CONSTRAINT fk_slice_user_user_id_ab_user FOREIGN KEY (user_id) REFERENCES public.ab_user(id) ON DELETE CASCADE;


--
-- Name: sql_metrics fk_sql_metrics_table_id_tables; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT fk_sql_metrics_table_id_tables FOREIGN KEY (table_id) REFERENCES public.tables(id) ON DELETE CASCADE;


--
-- Name: sqlatable_user fk_sqlatable_user_table_id_tables; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sqlatable_user
    ADD CONSTRAINT fk_sqlatable_user_table_id_tables FOREIGN KEY (table_id) REFERENCES public.tables(id) ON DELETE CASCADE;


--
-- Name: sqlatable_user fk_sqlatable_user_user_id_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sqlatable_user
    ADD CONSTRAINT fk_sqlatable_user_user_id_ab_user FOREIGN KEY (user_id) REFERENCES public.ab_user(id) ON DELETE CASCADE;


--
-- Name: table_columns fk_table_columns_table_id_tables; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT fk_table_columns_table_id_tables FOREIGN KEY (table_id) REFERENCES public.tables(id) ON DELETE CASCADE;


--
-- Name: themes fk_themes_changed_by_fk_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT fk_themes_changed_by_fk_ab_user FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: themes fk_themes_created_by_fk_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT fk_themes_created_by_fk_ab_user FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: key_value key_value_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.key_value
    ADD CONSTRAINT key_value_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: key_value key_value_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.key_value
    ADD CONSTRAINT key_value_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: logs logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: query query_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT query_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: query query_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT query_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: report_execution_log report_execution_log_report_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.report_execution_log
    ADD CONSTRAINT report_execution_log_report_schedule_id_fkey FOREIGN KEY (report_schedule_id) REFERENCES public.report_schedule(id);


--
-- Name: report_recipient report_recipient_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.report_recipient
    ADD CONSTRAINT report_recipient_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: report_recipient report_recipient_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.report_recipient
    ADD CONSTRAINT report_recipient_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: report_recipient report_recipient_report_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.report_recipient
    ADD CONSTRAINT report_recipient_report_schedule_id_fkey FOREIGN KEY (report_schedule_id) REFERENCES public.report_schedule(id);


--
-- Name: report_schedule report_schedule_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: report_schedule report_schedule_chart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_chart_id_fkey FOREIGN KEY (chart_id) REFERENCES public.slices(id);


--
-- Name: report_schedule report_schedule_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: report_schedule report_schedule_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_dashboard_id_fkey FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: report_schedule report_schedule_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: rls_filter_roles rls_filter_roles_rls_filter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rls_filter_roles
    ADD CONSTRAINT rls_filter_roles_rls_filter_id_fkey FOREIGN KEY (rls_filter_id) REFERENCES public.row_level_security_filters(id);


--
-- Name: rls_filter_roles rls_filter_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rls_filter_roles
    ADD CONSTRAINT rls_filter_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- Name: rls_filter_tables rls_filter_tables_rls_filter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rls_filter_tables
    ADD CONSTRAINT rls_filter_tables_rls_filter_id_fkey FOREIGN KEY (rls_filter_id) REFERENCES public.row_level_security_filters(id);


--
-- Name: rls_filter_tables rls_filter_tables_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rls_filter_tables
    ADD CONSTRAINT rls_filter_tables_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(id);


--
-- Name: row_level_security_filters row_level_security_filters_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.row_level_security_filters
    ADD CONSTRAINT row_level_security_filters_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: row_level_security_filters row_level_security_filters_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.row_level_security_filters
    ADD CONSTRAINT row_level_security_filters_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: saved_query saved_query_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: saved_query saved_query_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: saved_query saved_query_db_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_db_id_fkey FOREIGN KEY (db_id) REFERENCES public.dbs(id);


--
-- Name: tab_state saved_query_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT saved_query_id FOREIGN KEY (saved_query_id) REFERENCES public.saved_query(id) ON DELETE SET NULL;


--
-- Name: saved_query saved_query_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: slices slices_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: slices slices_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: slices slices_last_saved_by_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_last_saved_by_fk FOREIGN KEY (last_saved_by_fk) REFERENCES public.ab_user(id);


--
-- Name: slices slices_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(id);


--
-- Name: sql_metrics sql_metrics_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT sql_metrics_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: sql_metrics sql_metrics_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT sql_metrics_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: ssh_tunnels ssh_tunnels_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ssh_tunnels
    ADD CONSTRAINT ssh_tunnels_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: tab_state tab_state_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tab_state tab_state_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tab_state tab_state_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id) ON DELETE CASCADE;


--
-- Name: tab_state tab_state_latest_query_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_latest_query_id_fkey FOREIGN KEY (latest_query_id) REFERENCES public.query(client_id) ON DELETE SET NULL;


--
-- Name: tab_state tab_state_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: table_columns table_columns_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT table_columns_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: table_columns table_columns_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT table_columns_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: table_schema table_schema_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: table_schema table_schema_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: table_schema table_schema_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id) ON DELETE CASCADE;


--
-- Name: table_schema table_schema_tab_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_tab_state_id_fkey FOREIGN KEY (tab_state_id) REFERENCES public.tab_state(id) ON DELETE CASCADE;


--
-- Name: tables tables_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tables tables_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tables tables_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: tag tag_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tag tag_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tagged_object tagged_object_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT tagged_object_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tagged_object tagged_object_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT tagged_object_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tagged_object tagged_object_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT tagged_object_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tag(id);


--
-- Name: user_attribute user_attribute_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: user_attribute user_attribute_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: user_attribute user_attribute_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: user_attribute user_attribute_welcome_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_welcome_dashboard_id_fkey FOREIGN KEY (welcome_dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: user_favorite_tag user_favorite_tag_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_favorite_tag
    ADD CONSTRAINT user_favorite_tag_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tag(id);


--
-- Name: user_favorite_tag user_favorite_tag_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_favorite_tag
    ADD CONSTRAINT user_favorite_tag_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- PostgreSQL database dump complete
--

\unrestrict DrCbIeO3gf8gDrJbx8hde1o6HRPjbpkMYEz8bcl7S7PHvHra5kdbZzQj2vovrt2

