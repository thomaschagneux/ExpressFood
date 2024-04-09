CREATE TABLE `bag` (
  `id` INTEGER PRIMARY KEY,
  `quantity` INTEGER,
  `daily_meal_id` INTEGER,
  `delivery_person_id` INTEGER
);

CREATE TABLE `chef` (
  `id` INTEGER PRIMARY KEY,
  `name` VARCHAR(255)
);

CREATE TABLE `customer` (
  `id` INTEGER PRIMARY KEY,
  `first_name` VARCHAR(255),
  `last_name` VARCHAR(255),
  `birth_date` DATETIME,
  `address` VARCHAR(255),
  `zip_code` INTEGER,
  `city` VARCHAR(255),
  `phone` VARCHAR(255),
  `email` VARCHAR(255),
  `created_at` DATETIME,
  `updated_at` DATETIME
);

CREATE TABLE `daily_meal` (
  `id` INTEGER PRIMARY KEY,
  `date` DATETIME
);

CREATE TABLE `delivery_person` (
  `id` INTEGER PRIMARY KEY,
  `first_name` VARCHAR(255),
  `last_name` VARCHAR(255),
  `longitude` FLOAT,
  `latitude` FLOAT,
  `status` ENUM ('available', 'unavailable')
);

CREATE TABLE `meal` (
  `id` INTEGER PRIMARY KEY,
  `name` VARCHAR(255),
  `type` ENUM ('plat', 'dessert'),
  `price` FLOAT,
  `description` TEXT
);

CREATE TABLE `order` (
  `id` INTEGER PRIMARY KEY,
  `date` DATETIME,
  `vat` FLOAT,
  `total_price` FLOAT,
  `numero` INTEGER,
  `delivered_at` DATETIME,
  `created_at` DATETIME,
  `updated_at` DATETIME,
  `status` ENUM ('created', 'in_progress', 'done')
);

CREATE TABLE `payment` (
  `id` INTEGER PRIMARY KEY,
  `stripe_id` INTEGER,
  `customer_id` INTEGER,
  `order_id` INTEGER
);

CREATE TABLE `picture` (
  `id` INTEGER PRIMARY KEY,
  `file_name` VARCHAR(255),
  `file_path` VARCHAR(255),
  `created_at` DATETIME,
  `updated_at` DATETIME
);

ALTER TABLE `bag` ADD FOREIGN KEY (`daily_meal_id`) REFERENCES `daily_meal` (`id`);

ALTER TABLE `bag` ADD FOREIGN KEY (`delivery_person_id`) REFERENCES `delivery_person` (`id`);

ALTER TABLE `payment` ADD FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

ALTER TABLE `payment` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

ALTER TABLE `picture` ADD FOREIGN KEY (`id`) REFERENCES `meal` (`id`);

ALTER TABLE `daily_meal` ADD FOREIGN KEY (`id`) REFERENCES `chef` (`id`);

ALTER TABLE `order` ADD FOREIGN KEY (`id`) REFERENCES `customer` (`id`);

ALTER TABLE `order` ADD FOREIGN KEY (`id`) REFERENCES `bag` (`id`);

CREATE TABLE `meal_daily_meal` (
  `meal_id` INTEGER,
  `daily_meal_id` INTEGER,
  PRIMARY KEY (`meal_id`, `daily_meal_id`)
);

ALTER TABLE `meal_daily_meal` ADD FOREIGN KEY (`meal_id`) REFERENCES `meal` (`id`);

ALTER TABLE `meal_daily_meal` ADD FOREIGN KEY (`daily_meal_id`) REFERENCES `daily_meal` (`id`);

CREATE TABLE `delivery_person_order` (
  `delivery_person_id` INTEGER,
  `order_id` INTEGER,
  PRIMARY KEY (`delivery_person_id`, `order_id`)
);

ALTER TABLE `delivery_person_order` ADD FOREIGN KEY (`delivery_person_id`) REFERENCES `delivery_person` (`id`);

ALTER TABLE `delivery_person_order` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);
