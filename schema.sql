-- Database schema for hostel_grievances
CREATE DATABASE IF NOT EXISTS hostel_grievances CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE hostel_grievances;

CREATE TABLE IF NOT EXISTS admins (
  admin_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS grievances (
  grievance_id INT AUTO_INCREMENT PRIMARY KEY,
  student_name VARCHAR(100) NOT NULL,
  roll_no VARCHAR(20),
  room_no VARCHAR(10),
  email VARCHAR(100),
  grievance_type VARCHAR(50) NOT NULL,
  description TEXT NOT NULL,
  status ENUM('Pending','In Progress','Resolved') DEFAULT 'Pending',
  lodged_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  resolved_at TIMESTAMP NULL
);

CREATE INDEX IF NOT EXISTS idx_grievances_status ON grievances(status);
CREATE INDEX IF NOT EXISTS idx_grievances_type ON grievances(grievance_type);
CREATE INDEX IF NOT EXISTS idx_grievances_date ON grievances(lodged_at);

-- Seed admin (bcrypt for "Admin@123") - change later!
INSERT INTO admins (username, password, email)
VALUES ('admin', '$2a$10$8S4k2iI4RiZ8sBy9CfbCdOT5zI8JXo0PzGz.K1y2J0I0o6z6m9nVe', 'admin@example.com')
ON DUPLICATE KEY UPDATE email=VALUES(email);