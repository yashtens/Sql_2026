CREATE DATABASE IF NOT EXISTS krishitrack_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
  USE krishitrack_db;
  
  CREATE TABLE IF NOT EXISTS crops (
    id                 INT AUTO_INCREMENT PRIMARY KEY,
    name               VARCHAR(120) NOT NULL,
    variety            VARCHAR(120),
    field_area         FLOAT        DEFAULT 0.0   COMMENT 'Area in acres',
    seeding_date       DATE         NOT NULL,
    expected_harvest   DATE,
    fertilizer_details TEXT,
    water_schedule     VARCHAR(255),
    status             VARCHAR(30)  DEFAULT 'Growing'   COMMENT 'Growing | Harvested',
    image_path         VARCHAR(255),
    notes              TEXT,
    created_at         DATETIME     DEFAULT CURRENT_TIMESTAMP,
    updated_at         DATETIME     DEFAULT CURRENT_TIMESTAMP
                                    ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS expenses (
    id               INT AUTO_INCREMENT PRIMARY KEY,
    crop_id          INT     NOT NULL,
    date             DATE    NOT NULL,
    seeds_cost       FLOAT   DEFAULT 0.0,
    fertilizer_cost  FLOAT   DEFAULT 0.0,
    equipment_cost   FLOAT   DEFAULT 0.0,
    labour_cost      FLOAT   DEFAULT 0.0,
    other_expenses   FLOAT   DEFAULT 0.0,
    notes            TEXT,
    created_at       DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_expenses_crop
        FOREIGN KEY (crop_id) REFERENCES crops(id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS labours (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    crop_id         INT          NOT NULL,
    name            VARCHAR(120) NOT NULL,
    work_type       VARCHAR(120),
    days_worked     FLOAT        DEFAULT 1.0,
    payment_per_day FLOAT        DEFAULT 0.0,
    date            DATE,
    notes           TEXT,
    created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_labours_crop
        FOREIGN KEY (crop_id) REFERENCES crops(id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS harvests (
    id               INT AUTO_INCREMENT PRIMARY KEY,
    crop_id          INT         NOT NULL,
    harvest_date     DATE        NOT NULL,
    total_production FLOAT       DEFAULT 0.0  COMMENT 'Quantity in kg/quintal',
    unit             VARCHAR(20) DEFAULT 'kg',
    selling_price    FLOAT       DEFAULT 0.0  COMMENT 'Price per unit',
    total_income     FLOAT       DEFAULT 0.0  COMMENT 'total_production × selling_price',
    notes            TEXT,
    created_at       DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_harvests_crop
        FOREIGN KEY (crop_id) REFERENCES crops(id)
        ON DELETE CASCADE
) ENGINE=InnoDB;
CREATE OR REPLACE VIEW v_crop_financials AS
SELECT
  c.id,
  c.name,
  c.variety,
  c.status,
  c.field_area,
  COALESCE(SUM(e.seeds_cost + e.fertilizer_cost + e.equipment_cost
               + e.labour_cost + e.other_expenses), 0) AS total_investment,
  COALESCE(SUM(h.total_income), 0)                     AS total_income,
  COALESCE(SUM(h.total_income), 0)
    - COALESCE(SUM(e.seeds_cost + e.fertilizer_cost + e.equipment_cost
                   + e.labour_cost + e.other_expenses), 0) AS profit_loss
FROM crops c
LEFT JOIN expenses e ON e.crop_id = c.id
LEFT JOIN harvests h ON h.crop_id = c.id
GROUP BY c.id, c.name, c.variety, c.status, c.field_area;

INSERT INTO crops (name, variety, field_area, seeding_date, expected_harvest,
                   fertilizer_details, water_schedule, status, notes)
VALUES
  ('Wheat',  'GW-322',     2.5, '2024-11-01', '2025-03-15',
   'DAP 50kg, Urea 30kg per acre',  'Every 10 days',          'Growing',
   'Rabi season crop'),
  ('Tomato', 'Hybrid-100', 1.0, '2024-09-10', '2024-12-20',
   'NPK 19-19-19 weekly', 'Daily drip irrigation', 'Harvested',
   'Vegetable crop for local market');
   INSERT INTO expenses (crop_id, date, seeds_cost, fertilizer_cost,
                      equipment_cost, labour_cost, other_expenses)
VALUES
  (1, '2024-11-01', 3500, 4200, 1500, 2000, 500),
  (2, '2024-09-10', 1800, 2500, 800,  3000, 300);


INSERT INTO labours (crop_id, name, work_type, days_worked, payment_per_day, date)
VALUES
  (1, 'Ramesh Kumar', 'Sowing',     3, 400, '2024-11-02'),
  (2, 'Suresh Yadav', 'Harvesting', 5, 450, '2024-12-18');
  
  INSERT INTO harvests (crop_id, harvest_date, total_production, unit,
                      selling_price, total_income)
VALUES
  (2, '2024-12-20', 2200, 'kg', 18, 39600);
