-- ============================================================
--  ShopCloud - AWS E-Commerce Project
--  MySQL Database Schema
--  Run this script on your RDS MySQL instance
--  Author: [Your Team Names]
--  Date: June 2025
-- ============================================================

CREATE DATABASE IF NOT EXISTS shopcloud;
USE shopcloud;

-- ---- Products Table ----
CREATE TABLE products (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  name        VARCHAR(255)    NOT NULL,
  category    VARCHAR(100),
  price       DECIMAL(10,2)  NOT NULL,
  old_price   DECIMAL(10,2)  DEFAULT NULL,
  emoji       VARCHAR(10),
  description TEXT,
  badge       VARCHAR(20)    DEFAULT '',
  rating      DECIMAL(3,1)   DEFAULT 4.0,
  reviews     INT            DEFAULT 0,
  in_stock    BOOLEAN        DEFAULT TRUE,
  created_at  TIMESTAMP      DEFAULT CURRENT_TIMESTAMP
);

-- ---- Categories Table ----
CREATE TABLE categories (
  id    INT AUTO_INCREMENT PRIMARY KEY,
  name  VARCHAR(100) NOT NULL,
  icon  VARCHAR(10)
);

-- ---- Orders Table ----
CREATE TABLE orders (
  id           INT AUTO_INCREMENT PRIMARY KEY,
  customer_name VARCHAR(255),
  email        VARCHAR(255),
  total        DECIMAL(10,2),
  status       ENUM('pending','paid','shipped','delivered') DEFAULT 'pending',
  created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ---- Order Items Table ----
CREATE TABLE order_items (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  order_id   INT,
  product_id INT,
  quantity   INT DEFAULT 1,
  price      DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
);

-- ============================================================
--  SEED DATA - Insert Sample Products
-- ============================================================

INSERT INTO categories (name, icon) VALUES
('Electronics', '📱'),
('Fashion',     '👗'),
('Home',        '🏠'),
('Books',       '📚'),
('Sports',      '⚽');

INSERT INTO products (name, category, price, old_price, emoji, description, badge, rating, reviews) VALUES
('Wireless Noise-Cancelling Headphones', 'Electronics', 189.00, 249.00, '🎧', 'Premium 40hr battery, active noise cancellation, Bluetooth 5.2. Perfect for work and travel.',         'sale', 4.8, 1243),
('Mechanical Gaming Keyboard',           'Electronics', 129.00, 159.00, '⌨️', 'RGB backlit, tactile blue switches, USB-C, N-key rollover. Ideal for gamers and typists.',             '',     4.6,  892),
('Running Shoes Pro X',                  'Sports',       99.00, 130.00, '👟', 'Lightweight carbon-fiber sole, breathable mesh upper, available in 6 colours.',                        'new',  4.7, 2134),
('Casual Linen Shirt',                   'Fashion',      45.00,  65.00, '👔', '100% linen, relaxed fit, machine washable. Sizes XS–3XL. Perfect for tropical weather.',               'sale', 4.5,  560),
('Python for Beginners',                 'Books',        35.00,   NULL, '📘', 'Learn Python from scratch with hands-on projects. Covers variables, loops, OOP, APIs and more.',       'new',  4.9, 3201),
('Smart LED Desk Lamp',                  'Home',         59.00,  79.00, '💡', '5 colour temperatures, touch dimmer, USB-A charging port, eye-care mode. Foldable design.',            '',     4.4,  441),
('Fitness Resistance Bands Set',         'Sports',       28.00,  39.00, '💪', '5-level resistance, latex-free, includes carry bag and workout guide.',                                'sale', 4.6,  987),
('Minimalist Leather Wallet',            'Fashion',      55.00,   NULL, '👛', 'Full-grain leather, 6 card slots, RFID blocking, slim profile.',                                      'new',  4.7,  312),
('Portable Bluetooth Speaker',           'Electronics',  75.00,  99.00, '🔊', '360° sound, IPX7 waterproof, 20hr battery, USB-C.',                                                   '',     4.5, 1678),
('Ceramic Plant Pot Set',                'Home',         38.00,  50.00, '🪴', 'Set of 3 handmade ceramic pots with bamboo tray.',                                                    'new',  4.8,  223),
('Design Thinking Handbook',             'Books',        42.00,   NULL, '📕', 'From IDEO practitioners – covers empathise, define, ideate, prototype, test.',                        '',     4.6,  788),
('Yoga Mat Premium',                     'Sports',       65.00,  89.00, '🧘', '6mm thick TPE foam, non-slip texture, alignment lines, carry strap. 183x61cm.',                      'sale', 4.9, 1120);

-- ---- Verify inserts ----
SELECT COUNT(*) AS total_products FROM products;
SELECT category, COUNT(*) AS count FROM products GROUP BY category;
