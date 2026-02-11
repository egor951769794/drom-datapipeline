CREATE TABLE IF NOT EXISTS common_analytics.monitoring (
        window_start TIMESTAMP NOT NULL,
        window_end TIMESTAMP NOT NULL,
        manufacturer TEXT, 
        bulls_count INT,
        avg_price DECIMAL(10,2)
    );
