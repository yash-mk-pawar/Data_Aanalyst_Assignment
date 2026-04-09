-- ============================================================
-- Clinic Management System - Schema Setup
-- Run this FIRST before executing any Part B queries
-- ============================================================

DROP TABLE IF EXISTS clinic_sales;
DROP TABLE IF EXISTS expenses;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS clinics;

-- TABLES

CREATE TABLE clinics (
    cid         VARCHAR(50) PRIMARY KEY,
    clinic_name VARCHAR(100),
    city        VARCHAR(100),
    state       VARCHAR(100),
    country     VARCHAR(100)
);

CREATE TABLE customer (
    uid    VARCHAR(50) PRIMARY KEY,
    name   VARCHAR(100),
    mobile VARCHAR(15)
);

CREATE TABLE clinic_sales (
    oid          VARCHAR(50) PRIMARY KEY,
    uid          VARCHAR(50),
    cid          VARCHAR(50),
    amount       DECIMAL(10,2),
    datetime     DATETIME,
    sales_channel VARCHAR(50),
    FOREIGN KEY (uid) REFERENCES customer(uid),
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);

CREATE TABLE expenses (
    eid         VARCHAR(50) PRIMARY KEY,
    cid         VARCHAR(50),
    description VARCHAR(200),
    amount      DECIMAL(10,2),
    datetime    DATETIME,
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);

-- SAMPLE DATA

INSERT INTO clinics VALUES
('cnc-0100001', 'HealthPlus Clinic', 'Mumbai',    'Maharashtra', 'India'),
('cnc-0100002', 'CarePlus Clinic',   'Pune',      'Maharashtra', 'India'),
('cnc-0100003', 'MediCare Clinic',   'Nagpur',    'Maharashtra', 'India'),
('cnc-0100004', 'WellCare Clinic',   'Bangalore', 'Karnataka',   'India'),
('cnc-0100005', 'CityHealth Clinic', 'Mysore',    'Karnataka',   'India');

INSERT INTO customer VALUES
('bk-09f3e-95hj', 'Jon Doe',     '97XXXXXXXX'),
('cust-002',      'Jane Smith',  '9700000002'),
('cust-003',      'Ravi Kumar',  '9700000003'),
('cust-004',      'Priya Patel', '9700000004'),
('cust-005',      'Anil Mehta',  '9700000005');

INSERT INTO clinic_sales VALUES
('ord-001', 'bk-09f3e-95hj', 'cnc-0100001', 24999, '2021-01-10 10:00:00', 'online'),
('ord-002', 'cust-002',      'cnc-0100001', 15000, '2021-01-15 11:00:00', 'walk-in'),
('ord-003', 'cust-003',      'cnc-0100002', 8000,  '2021-02-05 09:30:00', 'online'),
('ord-004', 'cust-004',      'cnc-0100002', 12000, '2021-02-20 14:00:00', 'referral'),
('ord-005', 'cust-005',      'cnc-0100003', 30000, '2021-03-01 16:00:00', 'walk-in'),
('ord-006', 'bk-09f3e-95hj', 'cnc-0100003', 5000,  '2021-03-18 10:30:00', 'online'),
('ord-007', 'cust-002',      'cnc-0100004', 18000, '2021-04-10 11:00:00', 'referral'),
('ord-008', 'cust-003',      'cnc-0100004', 22000, '2021-04-25 13:00:00', 'walk-in'),
('ord-009', 'cust-004',      'cnc-0100005', 9500,  '2021-05-05 09:00:00', 'online'),
('ord-010', 'cust-005',      'cnc-0100005', 7000,  '2021-05-20 15:00:00', 'referral'),
('ord-011', 'bk-09f3e-95hj', 'cnc-0100001', 16000, '2021-06-12 10:00:00', 'walk-in'),
('ord-012', 'cust-002',      'cnc-0100002', 11000, '2021-07-08 12:00:00', 'online'),
('ord-013', 'cust-003',      'cnc-0100003', 25000, '2021-08-15 14:00:00', 'referral'),
('ord-014', 'cust-004',      'cnc-0100004', 14000, '2021-09-22 10:00:00', 'walk-in'),
('ord-015', 'cust-005',      'cnc-0100005', 19000, '2021-10-30 11:00:00', 'online'),
('ord-016', 'bk-09f3e-95hj', 'cnc-0100001', 28000, '2021-11-05 09:00:00', 'referral'),
('ord-017', 'cust-002',      'cnc-0100002', 6000,  '2021-11-20 13:00:00', 'walk-in'),
('ord-018', 'cust-003',      'cnc-0100003', 32000, '2021-12-10 10:00:00', 'online'),
('ord-019', 'cust-004',      'cnc-0100004', 21000, '2021-12-25 11:00:00', 'referral'),
('ord-020', 'cust-005',      'cnc-0100005', 13000, '2021-09-23 12:03:22', 'sodat');

INSERT INTO expenses VALUES
('exp-001', 'cnc-0100001', 'first-aid supplies',    557,  '2021-01-05 07:36:48'),
('exp-002', 'cnc-0100001', 'staff salary',           8000, '2021-01-31 09:00:00'),
('exp-003', 'cnc-0100002', 'medicines',              4500, '2021-02-10 10:00:00'),
('exp-004', 'cnc-0100002', 'equipment maintenance',  3000, '2021-02-28 11:00:00'),
('exp-005', 'cnc-0100003', 'utilities',              2000, '2021-03-15 08:00:00'),
('exp-006', 'cnc-0100003', 'staff salary',           9000, '2021-03-31 09:00:00'),
('exp-007', 'cnc-0100004', 'first-aid supplies',     700,  '2021-04-05 07:00:00'),
('exp-008', 'cnc-0100004', 'medicines',              5500, '2021-04-20 10:00:00'),
('exp-009', 'cnc-0100005', 'utilities',              1800, '2021-05-10 08:00:00'),
('exp-010', 'cnc-0100005', 'equipment maintenance',  2500, '2021-05-25 11:00:00'),
('exp-011', 'cnc-0100001', 'medicines',              6000, '2021-06-15 10:00:00'),
('exp-012', 'cnc-0100002', 'staff salary',           7000, '2021-07-31 09:00:00'),
('exp-013', 'cnc-0100003', 'utilities',              2200, '2021-08-20 08:00:00'),
('exp-014', 'cnc-0100004', 'first-aid supplies',     800,  '2021-09-10 07:00:00'),
('exp-015', 'cnc-0100005', 'staff salary',           9500, '2021-10-31 09:00:00'),
('exp-016', 'cnc-0100001', 'equipment maintenance',  3500, '2021-11-15 11:00:00'),
('exp-017', 'cnc-0100002', 'medicines',              4000, '2021-11-25 10:00:00'),
('exp-018', 'cnc-0100003', 'staff salary',           10000,'2021-12-31 09:00:00'),
('exp-019', 'cnc-0100004', 'utilities',              2100, '2021-12-15 08:00:00'),
('exp-020', 'cnc-0100005', 'first-aid supplies',     600,  '2021-09-23 07:36:48');
