CONSUMER_BOOTSTRAP_SERVERS = ['kafka-1:9091', 'kafka-2:9091', 'kafka-3:9091']
TOPIC_FACTS = 'dwh.table.facts'
TOPIC_CAR = 'dwh.table.car'
TOPIC_CONDITION = 'dwh.table.condition'
TOPIC_DATE = 'dwh.table.date'

POSTGRES_CONFIG = {
    'host': 'postgres',
    'port': '5432',
    'dbname': 'dwh',
    'user': 'user',
    'password': 'pwd'
}

TOPIC_TABLE_SCHEMA = {
    TOPIC_FACTS: [
        "timeReceived",
        "bullId",
        "bullHash",
        "mileage",
        "priceRub",
        "location",
        "numOfOwners",
        "numOfPreviousBulls",
        "carKey",
        "dateKey",
        "conditionKey"
    ],
    TOPIC_CAR: [
        "carKey",
        "manufacturer",
        "model",
        "year",
        "engineCapacity",
        "enginePower",
        "engineType",
        "transmissionType",
        "wheelDrive",
        "steering",
        "color"
    ],
    TOPIC_CONDITION: [
        "conditionKey",
        "byOrder",
        "fromOwner",
        "isNew",
        "noMileageInRussia",
        "broken",
        "noDocs",
        "passportIssues",
        "ownedByCompany",
        "hasPenalties"
    ],
    TOPIC_DATE: [
        "dateKey",
        "date",
        "dayOfWeek",
        "isWeekend",
        "month",
        "year"
    ]
}

DB_INSERT_QUERIES = {
    TOPIC_FACTS: """
        INSERT INTO bulls_fact (
            time_received,
            bull_id,
            bull_hash,
            mileage,
            price_rub,
            location,
            num_of_owners,
            num_of_previous_bulls,
            car_key,
            date_key,
            condition_key
        ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        ON CONFLICT (bull_id, bull_hash) DO NOTHING;
    """,
    TOPIC_CAR: """
        INSERT INTO dim_car (
            car_key,
            manufacturer,
            model,
            year,
            engine_capacity,
            engine_power,
            engine_type,
            transmission_type,
            wheel_drive,
            steering,
            color
        ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        ON CONFLICT (car_key) DO NOTHING;
    """,
    TOPIC_CONDITION: """
        INSERT INTO dim_condition (
            condition_key,
            by_order,
            from_owner,
            is_new,
            no_mileage_in_russia,
            is_broken,
            no_docs,
            passport_issues,
            owned_by_company,
            has_penalties
        ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        ON CONFLICT (condition_key) DO NOTHING;
    """,
    TOPIC_DATE: """
        INSERT INTO dim_date (
            date_key,
            date,
            day_of_week,
            is_weekend,
            month,
            year
        ) VALUES (%s, %s, %s, %s, %s, %s)
        ON CONFLICT (date_key) DO NOTHING;
    """
}