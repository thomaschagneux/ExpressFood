CREATE TABLE `bag` (
  `id` integer(8),
  `quantity` integer,
  `daily_meal_id` integer(8),
  `delivry_person_id` integer(8)
);

CREATE TABLE `chef` (
  `id` integer(8),
  `name` varchar(255)
);

CREATE TABLE `customer` (
  `id` integer(8),
  `first_name` varchar(255),
  `last_name` varchar(255),
  `birth_date` datetime,
  `address` varchar(255),
  `zip_code` integer(8),
  `city` varchar(255),
  `phone` varchar(255),
  `email` varchar(255),
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `daily_meal` (
  `id` integer(8),
  `date` datetime
);

CREATE TABLE `delivery_person` (
  `id` integer(8),
  `first_name` varchar(255),
  `last_name` varchar(255),
  `longitude` float,
  `lattitude` float,
  `status` ENUM ('availible', 'unavailible')
);

CREATE TABLE `meal` (
  `id` integer(8),
  `name` varchar(255),
  `type` ENUM ('plat', 'dessert'),
  `price` float,
  `description` text
);

CREATE TABLE `order` (
  `id` integer(8),
  `date` datetime,
  `vat` float,
  `total_price` float,
  `numero` integer(255),
  `delivered_at` datetime,
  `created_at` datetime,
  `updated_at` datetime,
  `status` ENUM ('created', 'in_progress', 'done')
);

CREATE TABLE `payment` (
  `id` integer(8),
  `stripe_id` integer(8),
  `customer_id` integer(8),
  `order_id` integer(8)
);

CREATE TABLE `picture` (
  `id` integer(8),
  `file_name` varchar(255),
  `file_path` varchar(255),
  `created_at` datetime,
  `updated_at` datetime
);

ALTER TABLE `bag` ADD FOREIGN KEY (`daily_meal_id`) REFERENCES `daily_meal` (`id`);

ALTER TABLE `bag` ADD FOREIGN KEY (`delivry_person_id`) REFERENCES `delivery_person` (`id`);

ALTER TABLE `payment` ADD FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

ALTER TABLE `payment` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

ALTER TABLE `picture` ADD FOREIGN KEY (`id`) REFERENCES `meal` (`id`);

ALTER TABLE `daily_meal` ADD FOREIGN KEY (`id`) REFERENCES `chef` (`id`);

ALTER TABLE `order` ADD FOREIGN KEY (`id`) REFERENCES `customer` (`id`);

ALTER TABLE `order` ADD FOREIGN KEY (`id`) REFERENCES `bag` (`id`);

CREATE TABLE `meal_daily_meal` (
  `meal_id` integer(8),
  `daily_meal_id` integer(8),
  PRIMARY KEY (`meal_id`, `daily_meal_id`)
);

ALTER TABLE `meal_daily_meal` ADD FOREIGN KEY (`meal_id`) REFERENCES `meal` (`id`);

ALTER TABLE `meal_daily_meal` ADD FOREIGN KEY (`daily_meal_id`) REFERENCES `daily_meal` (`id`);


CREATE TABLE `delivery_person_order` (
  `delivery_person_id` integer(8),
  `order_id` integer(8),
  PRIMARY KEY (`delivery_person_id`, `order_id`)
);

ALTER TABLE `delivery_person_order` ADD FOREIGN KEY (`delivery_person_id`) REFERENCES `delivery_person` (`id`);

ALTER TABLE `delivery_person_order` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

