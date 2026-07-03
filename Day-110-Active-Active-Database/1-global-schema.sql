CREATE DATABASE IF NOT EXISTS enterprise_bank;
USE enterprise_bank;

CREATE TABLE IF NOT EXISTS user_accounts (
    account_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username STRING,
    balance DECIMAL(10, 2),
    datacenter_origin STRING
);

INSERT INTO user_accounts (username, balance, datacenter_origin) VALUES 
('Architect', 10000000.00, 'us-east-1'),
('Agent-01', 50000.00, 'eu-central-1'),
('System', 999.99, 'ap-northeast-1');