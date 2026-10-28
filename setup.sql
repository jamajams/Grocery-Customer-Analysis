-- ============================================================
-- Grocery Customer Analysis
-- Data: "The Complete Journey" (84.51° / dunnhumby heritage)
-- One year (2017) of grocery shopping by 2,469 households
--
-- How to run (from inside this folder):
--   createdb grocery
--   psql -d grocery -f setup.sql
-- Loading 1.47 million transactions takes around a minute.
-- ============================================================

DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS demographics;

-- One row per household that filled in a demographic survey
-- Only 801 of the 2,469 shopping households did, so most
-- transactions have NO matching row here
CREATE TABLE demographics (
    household_id    BIGINT PRIMARY KEY,
    age             TEXT,   -- age band, e.g. '25-34', '65+'
    income          TEXT,   -- income band, e.g. '50-74K' (stored as text, so it won't sort in order on its own)
    home_ownership  TEXT,
    marital_status  TEXT,
    household_size  TEXT,   -- '1' to '5+'
    household_comp  TEXT,   -- e.g. '2 Adults Kids', '1 Adult No Kids'
    kids_count      TEXT    -- '0' to '3+'
);

-- One row per product the retailer sells
CREATE TABLE products (
    product_id        BIGINT PRIMARY KEY,
    manufacturer_id   BIGINT,
    department        TEXT,   -- broad area, e.g. 'GROCERY', 'PRODUCE', 'MEAT'
    brand             TEXT,   -- 'National' (big brands) or 'Private' (own label)
    product_category  TEXT,   -- e.g. 'BREAD', 'SOFT DRINKS'
    product_type      TEXT,   -- most detailed level
    package_size      TEXT
);

-- One row per product line in a basket
-- A basket = one shopping trip. Many rows share the same basket_id.
-- Money is in US dollars.
CREATE TABLE transactions (
    household_id           BIGINT NOT NULL,
    store_id               BIGINT NOT NULL,
    basket_id              BIGINT NOT NULL,
    product_id             BIGINT NOT NULL,
    quantity               NUMERIC,
    sales_value            NUMERIC,   -- amount the customer paid for this line
    retail_disc            NUMERIC,   -- discount from loyalty card prices
    coupon_disc            NUMERIC,   -- discount from manufacturer coupons
    coupon_match_disc      NUMERIC,   -- extra retailer discount matching a coupon
    week                   INTEGER,   -- 1 to 53
    transaction_timestamp  TIMESTAMP
);

\copy demographics FROM 'data/demographics.csv' WITH (FORMAT csv, HEADER true)
\copy products     FROM 'data/products.csv'     WITH (FORMAT csv, HEADER true)
\copy transactions FROM 'data/transactions.csv' WITH (FORMAT csv, HEADER true)

-- Indexes make joins on 1.47 million rows much faster
CREATE INDEX idx_tx_household ON transactions (household_id);
CREATE INDEX idx_tx_product   ON transactions (product_id);
CREATE INDEX idx_tx_basket    ON transactions (basket_id);

SELECT 'demographics' AS table_name, COUNT(*) AS row_count FROM demographics
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'transactions', COUNT(*) FROM transactions;
