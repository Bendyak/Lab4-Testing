-- Full Database Schema for Science-Life Assistant
-- Dialect: PostgreSQL

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    income_level VARCHAR(20),
    education VARCHAR(50),
    CONSTRAINT chk_users_name CHECK (username SIMILAR TO '[a-zA-Z0-9 ]{3,50}'),
    CONSTRAINT chk_users_income CHECK (income_level IN ('Low', 'Medium', 'High'))
);

CREATE TABLE providers (
    provider_id SERIAL PRIMARY KEY,
    provider_name VARCHAR(100) NOT NULL
);

CREATE TABLE housing (
    housing_id SERIAL PRIMARY KEY,
    provider_id INT NOT NULL,
    address VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    is_safe_area BOOLEAN DEFAULT FALSE,
    has_workspace BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_housing_provider FOREIGN KEY (provider_id) REFERENCES providers (provider_id),
    CONSTRAINT chk_housing_price CHECK (price > 0)
);

CREATE TABLE articles (
    article_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    doi VARCHAR(100) UNIQUE,
    publish_date DATE
);

CREATE TABLE summaries (
    summary_id SERIAL PRIMARY KEY,
    article_id INT NOT NULL UNIQUE,
    summary_text TEXT NOT NULL,
    generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    quality_score INT,
    CONSTRAINT fk_summaries_article FOREIGN KEY (article_id) REFERENCES articles (article_id),
    CONSTRAINT chk_summary_quality CHECK (quality_score BETWEEN 1 AND 5)
);

CREATE TABLE food_orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    status VARCHAR(20) DEFAULT 'Pending',
    total_amount DECIMAL(10, 2),
    CONSTRAINT fk_food_user FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE nutrition_items (
    item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    calories INT,
    CONSTRAINT fk_nutrition_order FOREIGN KEY (order_id) REFERENCES food_orders (order_id)
);
