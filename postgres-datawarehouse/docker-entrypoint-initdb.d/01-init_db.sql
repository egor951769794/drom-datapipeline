CREATE TABLE IF NOT EXISTS bulls_fact (
        event_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        time_received TIMESTAMP,
        bull_id TEXT NOT NULL,
        bull_hash BIGINT NOT NULL,
        mileage BIGINT,
        price_rub BIGINT,
        location TEXT,
        num_of_owners SMALLINT,
        num_of_previous_bulls SMALLINT,
        car_key BIGINT,
        date_key BIGINT,
        condition_key BIGINT,
                
        UNIQUE (bull_id, bull_hash)
    );

CREATE TABLE IF NOT EXISTS dim_car (
        car_key BIGINT PRIMARY KEY,
        manufacturer TEXT NOT NULL,
        model TEXT NOT NULL,
        year SMALLINT NOT NULL,
        engine_capacity NUMERIC(3,1),
        engine_power SMALLINT,
        engine_type TEXT,
        transmission_type TEXT,
        wheel_drive TEXT, 
        steering TEXT,
        color TEXT
    );

CREATE TABLE IF NOT EXISTS dim_date (
        date_key BIGINT PRIMARY KEY,
        date DATE,
        day_of_week SMALLINT,
        is_weekend BOOLEAN,
        month SMALLINT,
        year SMALLINT
    );

CREATE TABLE IF NOT EXISTS dim_condition (
        condition_key BIGINT PRIMARY KEY,
        by_order BOOLEAN,
        from_owner BOOLEAN,
        is_new BOOLEAN,
        no_mileage_in_russia BOOLEAN,
        is_broken BOOLEAN,
        no_docs BOOLEAN,
        passport_issues BOOLEAN,
        owned_by_company BOOLEAN,
        has_penalties BOOLEAN
    );

CREATE SCHEMA IF NOT EXISTS common_analytics;
