-- ============================================================
-- Hotel Management System - Schema Setup
-- Run this FIRST before executing any Part A queries
-- ============================================================

DROP TABLE IF EXISTS booking_commercials;
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS users;

-- TABLES

CREATE TABLE users (
    user_id         VARCHAR(50) PRIMARY KEY,
    name            VARCHAR(100),
    phone_number    VARCHAR(15),
    mail_id         VARCHAR(100),
    billing_address TEXT
);

CREATE TABLE items (
    item_id     VARCHAR(50) PRIMARY KEY,
    item_name   VARCHAR(100),
    item_rate   DECIMAL(10,2)
);

CREATE TABLE bookings (
    booking_id   VARCHAR(50) PRIMARY KEY,
    booking_date DATETIME,
    room_no      VARCHAR(50),
    user_id      VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE booking_commercials (
    id            VARCHAR(50) PRIMARY KEY,
    booking_id    VARCHAR(50),
    bill_id       VARCHAR(50),
    bill_date     DATETIME,
    item_id       VARCHAR(50),
    item_quantity DECIMAL(10,2),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    FOREIGN KEY (item_id)    REFERENCES items(item_id)
);

-- SAMPLE DATA

INSERT INTO users VALUES
('user-001', 'John Doe',    '9700000001', 'john.doe@example.com',    '12, Street A, Mumbai'),
('user-002', 'Jane Smith',  '9700000002', 'jane.smith@example.com',  '34, Street B, Pune'),
('user-003', 'Bob Ray',     '9700000003', 'bob.ray@example.com',     '56, Street C, Delhi'),
('user-004', 'Alice Wong',  '9700000004', 'alice.wong@example.com',  '78, Street D, Bangalore'),
('21wrcxuy-67erfn', 'John Doe', '97XXXXXXXX', 'john.doe@example.com', 'XX, Street Y, ABC City');

INSERT INTO items VALUES
('itm-a9e8-q8fu',  'Tawa Paratha',         18.00),
('itm-a07vh-aer8', 'Mix Veg',              89.00),
('itm-w978-23u4',  'Masala Chai',          25.00),
('itm-b123-c456',  'Paneer Butter Masala', 180.00),
('itm-d789-e012',  'Dal Tadka',            120.00),
('itm-f345-g678',  'Veg Biryani',          150.00);

INSERT INTO bookings VALUES
('bk-09f3e-95hj', '2021-09-23 07:36:48', 'rm-bhf9-aerjn', '21wrcxuy-67erfn'),
('bk-b001',       '2021-10-05 10:00:00', 'rm-b001',       'user-001'),
('bk-b002',       '2021-10-18 14:30:00', 'rm-b002',       'user-002'),
('bk-b003',       '2021-11-02 09:00:00', 'rm-b003',       'user-003'),
('bk-b004',       '2021-11-15 11:00:00', 'rm-b004',       'user-004'),
('bk-b005',       '2021-11-28 16:00:00', 'rm-b005',       'user-001'),
('bk-q034-q4o',   '2021-09-23 07:40:00', 'rm-c001',       'user-002');

INSERT INTO booking_commercials VALUES
('bc-s01', 'bk-09f3e-95hj', 'bl-0a87y-q340', '2021-09-23 12:03:22', 'itm-a9e8-q8fu',  3),
('bc-s02', 'bk-09f3e-95hj', 'bl-0a87y-q340', '2021-09-23 12:03:22', 'itm-a07vh-aer8', 1),
('bc-s03', 'bk-q034-q4o',   'bl-34qhd-r7h8', '2021-09-23 12:05:37', 'itm-w978-23u4',  0.5),
('bc-o01', 'bk-b001',       'bl-oct-001',    '2021-10-05 13:00:00', 'itm-b123-c456',  3),
('bc-o02', 'bk-b001',       'bl-oct-001',    '2021-10-05 13:00:00', 'itm-d789-e012',  2),
('bc-o03', 'bk-b002',       'bl-oct-002',    '2021-10-18 15:00:00', 'itm-f345-g678',  5),
('bc-o04', 'bk-b002',       'bl-oct-002',    '2021-10-18 15:00:00', 'itm-a9e8-q8fu',  4),
('bc-n01', 'bk-b003',       'bl-nov-001',    '2021-11-02 10:00:00', 'itm-b123-c456',  2),
('bc-n02', 'bk-b003',       'bl-nov-001',    '2021-11-02 10:00:00', 'itm-f345-g678',  3),
('bc-n03', 'bk-b004',       'bl-nov-002',    '2021-11-15 12:00:00', 'itm-d789-e012',  4),
('bc-n04', 'bk-b004',       'bl-nov-002',    '2021-11-15 12:00:00', 'itm-a07vh-aer8', 2),
('bc-n05', 'bk-b005',       'bl-nov-003',    '2021-11-28 17:00:00', 'itm-w978-23u4',  6),
('bc-n06', 'bk-b005',       'bl-nov-003',    '2021-11-28 17:00:00', 'itm-b123-c456',  1);
