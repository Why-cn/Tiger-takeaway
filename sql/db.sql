/*
Navicat MySQL4 Data Transfer

Source Server         : localhost
Source Server Version : 50728
Source Host           : localhost:3306
Source Database       : reggie

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2021-07-23 10:41:41
*/

DROP DATABASE IF EXISTS tiger_takeaway;
CREATE DATABASE tiger_takeaway;
USE tiger_takeaway;

SET
FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address_book
-- ----------------------------
DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book`
(
    `id`            bigint(20) NOT NULL COMMENT 'Primary Key',
    `user_id`       bigint(20) NOT NULL COMMENT 'User ID',
    `consignee`     varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'Consignee',
    `sex`           tinyint(4) NOT NULL COMMENT 'Gender 0 Female 1 Male',
    `phone`         varchar(11) COLLATE utf8_bin NOT NULL COMMENT 'Phone Number',
    `province_code` varchar(12) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT 'Province Code',
    `province_name` varchar(32) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT 'Province Name',
    `city_code`     varchar(12) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT 'City Code',
    `city_name`     varchar(32) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT 'City Name',
    `district_code` varchar(12) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT 'District Code',
    `district_name` varchar(32) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT 'District Name',
    `detail`        varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'Detailed Address',
    `label`         varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'Label',
    `is_default`    tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Default 0 No 1 Yes',
    `create_time`   datetime                     NOT NULL COMMENT 'Creation Time',
    `update_time`   datetime                     NOT NULL COMMENT 'Update Time',
    `create_user`   bigint(20) NOT NULL COMMENT 'Creator',
    `update_user`   bigint(20) NOT NULL COMMENT 'Modifier',
    `is_deleted`    int(11) NOT NULL DEFAULT '0' COMMENT 'Deleted',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Address Management';

-- ----------------------------
-- Records of address_book
-- ----------------------------
INSERT INTO `address_book`
VALUES ('1417414526093082626', '1417012167126876162', 'Xiao Ming', '1', '13812345678', null, null, null, null, null, null,
        'Changping District Jinyanlong Office Building', 'Company', '1', '2021-07-20 17:22:12', '2021-07-20 17:26:33', '1417012167126876162',
        '1417012167126876162', '0');
INSERT INTO `address_book`
VALUES ('1417414926166769666', '1417012167126876162', 'Xiao Li', '1', '13512345678', null, null, null, null, null, null,
        'Test', 'Home', '0', '2021-07-20 17:23:47', '2021-07-20 17:23:47', '1417012167126876162', '1417012167126876162',
        '0');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`
(
    `id`          bigint(20) NOT NULL COMMENT 'Primary Key',
    `type`        int(11) DEFAULT NULL COMMENT 'Type 1 Dish Category 2 Set Meal Category',
    `name`        varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'Category Name',
    `sort`        int(11) NOT NULL DEFAULT '0' COMMENT 'Order',
    `create_time` datetime                     NOT NULL COMMENT 'Creation Time',
    `update_time` datetime                     NOT NULL COMMENT 'Update Time',
    `create_user` bigint(20) NOT NULL COMMENT 'Creator',
    `update_user` bigint(20) NOT NULL COMMENT 'Modifier',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `idx_category_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT 'Dish and Set Meal Categories';


-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category`
VALUES ('1397844263642378242', '1', 'Hunan Cuisine', '1', '2021-05-27 09:16:58', '2021-07-15 20:25:23', '1', '1');
INSERT INTO `category`
VALUES ('1397844303408574465', '1', 'Sichuan Cuisine', '2', '2021-05-27 09:17:07', '2021-06-02 14:27:22', '1', '1');
INSERT INTO `category`
VALUES ('1397844391040167938', '1', 'Cantonese Cuisine', '3', '2021-05-27 09:17:28', '2021-07-09 14:37:13', '1', '1');
INSERT INTO `category`
VALUES ('1413341197421846529', '1', 'Beverages', '11', '2021-07-09 11:36:15', '2021-07-09 14:39:15', '1', '1');
INSERT INTO `category`
VALUES ('1413342269393674242', '2', 'Business Set Meals', '5', '2021-07-09 11:40:30', '2021-07-09 14:43:45', '1', '1');
INSERT INTO `category`
VALUES ('1413384954989060097', '1', 'Staple Food', '12', '2021-07-09 14:30:07', '2021-07-09 14:39:19', '1', '1');
INSERT INTO `category`
VALUES ('1413386191767674881', '2', 'Children Set Meals', '6', '2021-07-09 14:35:02', '2021-07-09 14:39:05', '1', '1');


-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish`
(
    `id`          bigint(20) NOT NULL COMMENT 'Primary Key',
    `name`        varchar(64) COLLATE utf8_bin  NOT NULL COMMENT 'Dish Name',
    `category_id` bigint(20) NOT NULL COMMENT 'Dish Category ID',
    `price`       decimal(10, 2)                DEFAULT NULL COMMENT 'Dish Price',
    `code`        varchar(64) COLLATE utf8_bin  NOT NULL COMMENT 'Product Code',
    `image`       varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'Image',
    `description` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT 'Description',
    `status`      int(11) NOT NULL DEFAULT '1' COMMENT '0 Discontinued 1 Available',
    `sort`        int(11) NOT NULL DEFAULT '0' COMMENT 'Order',
    `create_time` datetime                      NOT NULL COMMENT 'Creation Time',
    `update_time` datetime                      NOT NULL COMMENT 'Update Time',
    `create_user` bigint(20) NOT NULL COMMENT 'Creator',
    `update_user` bigint(20) NOT NULL COMMENT 'Modifier',
    `is_deleted`  int(11) NOT NULL DEFAULT '0' COMMENT 'Deleted',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `idx_dish_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT 'Dish Management';


-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish`
VALUES ('1397849739276890114', 'Spicy Chicken', '1397844263642378242', '7800.00', '222222222',
        'f966a38e-0780-40be-bb52-5699d13cb3d9.jpg', 'From tender and delicious chicken, worth a taste', '1', '0', '2021-05-27 09:38:43',
        '2021-05-27 09:38:43', '1', '1', '0');
INSERT INTO `dish`
VALUES ('1397850140982161409', 'Mao-style Braised Pork', '1397844263642378242', '6800.00', '123412341234',
        '0a3b3288-3446-4420-bbff-f263d0c02d8e.jpg', 'Mao-style Braised Pork, surely you will want a serving?', '1', '0', '2021-05-27 09:40:19','2021-05-27 09:40:19', '1', '1', '0');
INSERT INTO `dish`
VALUES ('1397850392090947585', 'Zu An Shark Fin', '1397844263642378242', '4800.00', '123412341234',
        '740c79ce-af29-41b8-b78d-5f49c96e38c4.jpg', 'Zu An Shark Fin, the appearance speaks volumes of its deliciousness', '1', '0', '2021-05-27 09:41:19',
        '2021-05-27 09:41:19', '1', '1', '0');
INSERT INTO `dish`
VALUES ('1397850851245600769', 'Farewell My Concubine', '1397844263642378242', '12800.00', '123412341234',
        '057dd338-e487-4bbc-a74c-0384c44a9ca3.jpg', 'What could be more delicious than Farewell My Concubine?', '1', '0', '2021-05-27 09:43:08',
        '2021-05-27 09:43:08', '1', '1', '0');

INSERT INTO `dish`
VALUES ('1397851099502260226', 'Family Blessing', '1397844263642378242', '11800.00', '23412341234',
        'a53a4e6a-3b83-4044-87f9-9d49b30a8fdc.jpg', 'Don’t just eat meat, try the Family Blessing for longevity and flavor', '1', '0', '2021-05-27 09:44:08',
        '2021-05-27 09:44:08', '1', '1', '0');
INSERT INTO `dish`
VALUES ('1397851370462687234', 'Shaoyang Blood Meatballs', '1397844263642378242', '13800.00', '1246812345678',
        '2a50628e-7758-4c51-9fbb-d37c61cdacad.jpg', 'Look, isn’t it delicious? Come on, this is a favorite', '1', '0', '2021-05-27 09:45:12',
        '2021-05-27 09:45:12', '1', '1', '0');
INSERT INTO `dish`
VALUES ('1397851668262465537', 'Flavorful Snake', '1397844263642378242', '16800.00', '1234567812345678',
        '0f4bd884-dc9c-4cf9-b59e-7d5958fec3dd.jpg', 'The champion of the crawling world, Dongxing-Flavorful Snake, irresistibly delicious', '1', '0', '2021-05-27 09:46:23',
        '2021-05-27 09:46:23', '1', '1', '0');
INSERT INTO `dish`
VALUES ('1397852391150759938', 'Spicy Diced Chicken', '1397844303408574465', '8800.00', '2346812468',
        'ef2b73f2-75d1-4d3a-beea-22da0e1421bd.jpg', 'Spicy Diced Chicken, a timeless soul', '1', '0', '2021-05-27 09:49:16',
        '2021-05-27 09:49:16', '1', '1', '0');

INSERT INTO `dish`
VALUES ('1397853183287013378', 'Spicy Rabbit Head', '1397844303408574465', '19800.00', '123456787654321',
        '2a2e9d66-b41d-4645-87bd-95f2cfeed218.jpg', 'Detailed preparation of Spicy Rabbit Head, hot and fragrant with a bright red color and a lasting aftertaste', '1', '0', '2021-05-27 09:52:24',
        '2021-05-27 09:52:24', '1', '1', '0');
INSERT INTO `dish`
VALUES ('1397853709101740034', 'Garlic Pork Slices', '1397844303408574465', '9800.00', '1234321234321',
        'd2f61d70-ac85-4529-9b74-6d9a2255c6d7.jpg', 'So appetizing!', '1', '0', '2021-05-27 09:54:30', '2021-05-27 09:54:30',
        '1', '1', '0');
INSERT INTO `dish`
VALUES ('1397853890262118402', 'Fish-Flavored Shredded Pork', '1397844303408574465', '3800.00', '1234212321234',
        '8dcfda14-5712-4d28-82f7-ae905b3c2308.jpg', 'Fish-Flavored Shredded Pork is a classic dish of our childhood memories, having it with rice while watching soap operas in the dorm, simply fantastic! A perfect replica of those school days.', '1', '0', '2021-05-27 09:55:13', '2021-05-27 09:55:13',
        '1', '1', '0');
INSERT INTO `dish`
VALUES ('1397854652581064706', 'Spicy Boiled Fish', '1397844303408574465', '14800.00', '2345312·345321',
        '1fdbfbf3-1d86-4b29-a3fc-46345852f2f8.jpg', 'The fish slices were pre-cut, a few shrimps added to enhance the flavor', '1', '0', '2021-05-27 09:58:15',
        '2021-05-27 09:58:15', '1', '1', '0');

INSERT INTO `dish`
VALUES ('1397854865672679425', 'Fish-Flavored Scrambled Eggs', '1397844303408574465', '2000.00', '23456431·23456',
        '0f252364-a561-4e8d-8065-9a6797a6b1d3.jpg', 'Fish-flavored dishes are a specialty of Sichuan cuisine. Despite containing no fish, they have a fish-like flavor.', '1', '0', '2021-05-27 09:59:06',
        '2021-05-27 09:59:06', '1', '1', '0');
INSERT INTO `dish`
VALUES ('1397860242057375745', 'Crispy Roast Goose', '1397844391040167938', '12800.00', '123456786543213456',
        'e476f679-5c15-436b-87fa-8c4e9644bf33.jpeg',
        '“Roast duck from Guangdong is famous and fragrant, but roast goose from Gu Gang (now Xinhui) surpasses it. Slim and plump each have their charm, do not just focus on the cheaper options”—thus roast goose and duck have long been famous in Cantonese cuisine. As the most common and popular roast meat in Guangzhou, its "golden-red color, crispy skin, tender meat, and delicious taste" can be seen in roast shops throughout the city.', 
        '1', '0', '2021-05-27 10:20:27', '2021-05-27 10:20:27', '1', '1', '0');
INSERT INTO `dish`
VALUES ('1397860578738352129', 'White Cut Chicken', '1397844391040167938', '6600.00', '12345678654',
        '9ec6fc2d-50d2-422e-b954-de87dcd04198.jpeg',
        'White cut chicken is a full-flavored traditional specialty dish, also known as boiled chicken, which is a type of chicken dish from the Cantonese cuisine, originating from the Qing dynasty folk cuisine. It usually uses fine-bone farm chicken with sand ginger and minced garlic, cooked slowly to achieve a refreshing and smooth skin and delicious taste. The famous Panxi Restaurant white cut chicken once won the Golden Cauldron Award from the Ministry of Commerce. Zhanjiang white cut chicken is well-known throughout Guangdong, Hong Kong, and Macau. In the realm of Cantonese cuisine, there are over 200 chicken dishes, with white cut chicken being the most commonly enjoyed and favored by gourmets.',
        '1', '0', '2021-05-27 10:21:48', '2021-05-27 10:21:48', '1', '1', '0');
INSERT INTO `dish`
VALUES ('1397860792492666881', 'Roasted Suckling Pig', '1397844391040167938', '38800.00', '213456432123456',
        '2e96a7e3-affb-438e-b7c3-e1430df425c9.jpeg',
        'White cut chicken is a full-flavored traditional specialty dish, also known as boiled chicken, which is a type of chicken dish from the Cantonese cuisine, originating from the Qing dynasty folk cuisine. It usually uses fine-bone farm chicken with sand ginger and minced garlic, cooked slowly to achieve a refreshing and smooth skin and delicious taste. The famous Panxi Restaurant white cut chicken once won the Golden Cauldron Award from the Ministry of Commerce. Zhanjiang white cut chicken is well-known throughout Guangdong, Hong Kong, and Macau. In the realm of Cantonese cuisine, there are over 200 chicken dishes, with white cut chicken being the most commonly enjoyed and favored by gourmets.',
        '1', '0', '2021-05-27 10:21:48', '2021-05-27 10:21:48', '1', '1', '0');

INSERT INTO `dish`
VALUES ('1397860963880316929', 'Crispy Pigeon', '1397844391040167938', '10800.00', '1234563212345',
        '3fabb83a-1c09-4fd9-892b-4ef7457daafa.jpeg',
        'Crispy Pigeon is a traditional Cantonese dish known for its crispy skin and tender meat, with a shiny red color and delicious flavor, which can strengthen the body and clear the lungs when consumed regularly. Over time, the cooking techniques have evolved to include deep-frying, raw-frying, and roasting. Regardless of the method, the pigeon is processed through a series of steps and dipped in crispy skin water to achieve the authentic Crispy Pigeon which is crispy, tender, and aromatic. These methods are not complicated, but achieving the ideal result is challenging.', 
        '1', '0', '2021-05-27 10:23:19', '2021-05-27 10:23:19', '1', '1', '0');
INSERT INTO `dish`
VALUES ('1397861683434139649', 'Steamed Fresh Seafood', '1397844391040167938', '38800.00', '1234567876543213456',
        '1405081e-f545-42e1-86a2-f7559ae2e276.jpeg',
        'Fresh seafood is best when steamed, to really taste the reason why it is called eafood. Steaming is the most classic cooking method in Guangzhou. Historically, due to the geographical barriers of the Lingnan area, which led to slow economic development, locals would simply boil freshly caught fish, discovering that this simple cooking method best preserved the sweet taste of the fish.',
        '1', '0', '2021-05-27 10:26:11', '2021-05-27 10:26:11', '1', '1', '0');
INSERT INTO `dish`
VALUES ('1397862198033297410', 'Cantonese Slow-cooked Soup', '1397844391040167938', '49800.00', '123456786532455',
        '583df4b7-a159-4cfc-9543-4f666120b25f.jpeg',
        'Also known as Guangfu soup, Cantonese Slow-cooked Soup is a culinary and medicinal tradition passed down for thousands of years in Guangdong. Cooked slowly over a low flame, the soup draws both medicinal benefits and delectable sweetness from its ingredients. There are many types of Cantonese slow-cooked soups, each using various ingredients and methods to create different flavors and health benefits.',
        '1', '0', '2021-05-27 10:28:14', '2021-05-27 10:28:14', '1', '1', '0');
INSERT INTO `dish`
VALUES ('1397862477831122945', 'Braised Lobster in Superior Soup', '1397844391040167938', '108800.00', '1234567865432',
        '5b8d2da3-3744-4bb3-acdc-329056b8259d.jpeg',
        'Braised Lobster in Superior Soup is a traditional and luxurious dish from the Cantonese cuisine. This dish features lobster cooked with a rich broth, resulting in seafood that is tender, white, and delicious, high in protein and low in fat, providing rich nutrition and a taste that is both delicious and fragrant.',
        '1', '0', '2021-05-27 10:29:20', '2021-05-27 10:29:20', '1', '1', '0');

INSERT INTO `dish`
VALUES ('1413342036832100354', 'Arctic Ocean Soda', '1413341197421846529', '500.00', '', 'c99e0aab-3cb7-4eaa-80fd-f47d4ffea694.png',
        '', '1', '0', '2021-07-09 11:39:35', '2021-07-09 15:12:18', '1', '1', '0');
INSERT INTO `dish`
VALUES ('1413384757047271425', 'Wang Lao Ji Herbal Tea', '1413341197421846529', '500.00', '', '00874a5e-0df2-446b-8f69-a30eb7d88ee8.png',
        '', '1', '0', '2021-07-09 14:29:20', '2021-07-12 09:09:16', '1', '1', '0');
INSERT INTO `dish`
VALUES ('1413385247889891330', 'Steamed Rice', '1413384954989060097', '200.00', '', 'ee04a05a-1230-46b6-8ad5-1a95b140fff3.png',
        '', '1', '0', '2021-07-09 14:31:17', '2021-07-11 16:35:26', '1', '1', '0');


-- ----------------------------
-- Table structure for dish_flavor
-- ----------------------------
DROP TABLE IF EXISTS `dish_flavor`;
CREATE TABLE `dish_flavor`
(
    `id`          bigint(20) NOT NULL COMMENT 'Primary Key',
    `dish_id`     bigint(20) NOT NULL COMMENT 'Dish ID',
    `name`        varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'Flavor Name',
    `value`       varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT 'Flavor Data List',
    `create_time` datetime                     NOT NULL COMMENT 'Creation Time',
    `update_time` datetime                     NOT NULL COMMENT 'Update Time',
    `create_user` bigint(20) NOT NULL COMMENT 'Creator',
    `update_user` bigint(20) NOT NULL COMMENT 'Modifier',
    `is_deleted`  int(11) NOT NULL DEFAULT '0' COMMENT 'Deleted',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT 'Dish Flavor Association Table';


-- ----------------------------
-- Records of dish_flavor
-- ----------------------------
INSERT INTO `dish_flavor`
VALUES ('1397849417888346113', '1397849417854791681', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-27 09:37:27',
        '2021-05-27 09:37:27', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397849739297861633', '1397849739276890114', 'Dietary Restrictions', '["No Onions", "No Garlic", "No Cilantro", "No Spicy"]', '2021-05-27 09:38:43',
        '2021-05-27 09:38:43', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397849739323027458', '1397849739276890114', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-27 09:38:43',
        '2021-05-27 09:38:43', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397849936421761025', '1397849936404983809', 'Dietary Restrictions', '["No Onions", "No Garlic", "No Cilantro", "No Spicy"]', '2021-05-27 09:39:30',
        '2021-05-27 09:39:30', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397849936438538241', '1397849936404983809', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-27 09:39:30',
        '2021-05-27 09:39:30', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397850141015715841', '1397850140982161409', 'Dietary Restrictions', '["No Onions", "No Garlic", "No Cilantro", "No Spicy"]', '2021-05-27 09:40:19',
        '2021-05-27 09:40:19', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397850141040881665', '1397850140982161409', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-27 09:40:19',
        '2021-05-27 09:40:19', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397850392120307713', '1397850392090947585', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-27 09:41:19',
        '2021-05-27 09:41:19', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397850392137084929', '1397850392090947585', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-27 09:41:19',
        '2021-05-27 09:41:19', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397850630734262274', '1397850630700707841', 'Dietary Restrictions', '["No Onions", "No Garlic", "No Cilantro", "No Spicy"]', '2021-05-27 09:42:16',
        '2021-05-27 09:42:16', '1', '1', '0');

INSERT INTO `dish_flavor`
VALUES ('1397850630755233794', '1397850630700707841', 'Spiciness', '["Mild", "Medium", "Hot"]', '2021-05-27 09:42:16',
        '2021-05-27 09:42:16', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397850851274960898', '1397850851245600769', 'Dietary Restrictions', '["No Garlic", "No Cilantro", "No Spicy"]', '2021-05-27 09:43:08',
        '2021-05-27 09:43:08', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397850851283349505', '1397850851245600769', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-27 09:43:08',
        '2021-05-27 09:43:08', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397851099523231745', '1397851099502260226', 'Dietary Restrictions', '["No Onions", "No Garlic", "No Cilantro", "No Spicy"]', '2021-05-27 09:44:08',
        '2021-05-27 09:44:08', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397851099527426050', '1397851099502260226', 'Spiciness', '["Not Spicy", "Mild", "Medium"]', '2021-05-27 09:44:08',
        '2021-05-27 09:44:08', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397851370483658754', '1397851370462687234', 'Temperature', '["Hot", "Room Temperature", "No Ice", "Less Ice", "Extra Ice"]',
        '2021-05-27 09:45:12', '2021-05-27 09:45:12', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397851370483658755', '1397851370462687234', 'Dietary Restrictions', '["No Onions", "No Garlic", "No Cilantro", "No Spicy"]', '2021-05-27 09:45:12',
        '2021-05-27 09:45:12', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397851370483658756', '1397851370462687234', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-27 09:45:12',
        '2021-05-27 09:45:12', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397851668283437058', '1397851668262465537', 'Temperature', '["Hot", "Room Temperature", "No Ice", "Less Ice", "Extra Ice"]',
        '2021-05-27 09:46:23', '2021-05-27 09:46:23', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397852391180120065', '1397852391150759938', 'Dietary Restrictions', '["No Onions", "No Cilantro", "No Spicy"]', '2021-05-27 09:49:16',
        '2021-05-27 09:49:16', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397852391196897281', '1397852391150759938', 'Spiciness', '["Not Spicy", "Mild", "Hot"]', '2021-05-27 09:49:16',
        '2021-05-27 09:49:16', '1', '1', '0');
				
INSERT INTO `dish_flavor`
VALUES ('1397853183307984898', '1397853183287013378', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-27 09:52:24',
        '2021-05-27 09:52:24', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397853423486414850', '1397853423461249026', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-27 09:53:22',
        '2021-05-27 09:53:22', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397853709126905857', '1397853709101740034', 'Dietary Restrictions', '["No Onions", "No Garlic", "No Cilantro", "No Spicy"]', '2021-05-27 09:54:30',
        '2021-05-27 09:54:30', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397853890283089922', '1397853890262118402', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-27 09:55:13',
        '2021-05-27 09:55:13', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397854133632413697', '1397854133603053569', 'Temperature', '["Hot", "Room Temperature", "No Ice", "Less Ice", "Extra Ice"]',
        '2021-05-27 09:56:11', '2021-05-27 09:56:11', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397854652623007745', '1397854652581064706', 'Dietary Restrictions', '["No Onions", "No Garlic", "No Cilantro", "No Spicy"]', '2021-05-27 09:58:15',
        '2021-05-27 09:58:15', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397854652635590658', '1397854652581064706', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-27 09:58:15',
        '2021-05-27 09:58:15', '1', '1', '0');

INSERT INTO `dish_flavor`
VALUES ('1397854865735593986', '1397854865672679425', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-27 09:59:06',
        '2021-05-27 09:59:06', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397855742303186946', '1397855742273826817', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-27 10:02:35',
        '2021-05-27 10:02:35', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397855906497605633', '1397855906468245506', 'Dietary Restrictions', '["No Onions", "No Garlic", "No Cilantro", "No Spicy"]', '2021-05-27 10:03:14',
        '2021-05-27 10:03:14', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397856190573621250', '1397856190540066818', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-27 10:04:21',
        '2021-05-27 10:04:21', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397859056709316609', '1397859056684150785', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-27 10:15:45',
        '2021-05-27 10:15:45', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397859277837217794', '1397859277812051969', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-27 10:16:37',
        '2021-05-27 10:16:37', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397859487502086146', '1397859487476920321', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-27 10:17:27',
        '2021-05-27 10:17:27', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397859757061615618', '1397859757036449794', 'Sweetness', '["No Sugar", "Less Sugar", "Half Sugar", "More Sugar", "Full Sugar"]',
        '2021-05-27 10:18:32', '2021-05-27 10:18:32', '1', '1', '0');

INSERT INTO `dish_flavor`
VALUES ('1397860242086735874', '1397860242057375745', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-27 10:20:27',
        '2021-05-27 10:20:27', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397860963918065665', '1397860963880316929', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-27 10:23:19',
        '2021-05-27 10:23:19', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397861135754506242', '1397861135733534722', 'Sweetness', '["No Sugar", "Less Sugar", "Half-sugar", "More Sugar", "Full Sugar"]',
        '2021-05-27 10:24:00', '2021-05-27 10:24:00', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397861370035744769', '1397861370010578945', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-27 10:24:56',
        '2021-05-27 10:24:56', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397861683459305474', '1397861683434139649', 'Dietary Restrictions', '["No Onions", "No Garlic", "No Cilantro", "No Spicy"]', '2021-05-27 10:26:11',
        '2021-05-27 10:26:11', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397861898467717121', '1397861898438356993', 'Dietary Restrictions', '["No Onions", "No Garlic", "No Cilantro", "No Spicy"]', '2021-05-27 10:27:02',
        '2021-05-27 10:27:02', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397862198054268929', '1397862198033297410', 'Dietary Restrictions', '["No Onions", "No Garlic", "No Cilantro", "No Spicy"]', '2021-05-27 10:28:14',
        '2021-05-27 10:28:14', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1397862477835317250', '1397862477831122945', 'Spiciness', '["Not Spicy", "Mild", "Medium"]', '2021-05-27 10:29:20',
        '2021-05-27 10:29:20', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1398089545865015297', '1398089545676271617', 'Temperature', '["Hot", "Room Temperature", "No Ice", "Less Ice", "Extra Ice"]',
        '2021-05-28 01:31:38', '2021-05-28 01:31:38', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1398089782323097601', '1398089782285348866', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-28 01:32:34',
        '2021-05-28 01:32:34', '1', '1', '0');

INSERT INTO `dish_flavor`
VALUES ('1398090003262255106', '1398090003228700673', 'Dietary Restrictions', '["No Onions", "No Garlic", "No Cilantro", "No Spicy"]', '2021-05-28 01:33:27',
        '2021-05-28 01:33:27', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1398090264554811394', '1398090264517062657', 'Dietary Restrictions', '["No Onions", "No Garlic", "No Cilantro", "No Spicy"]', '2021-05-28 01:34:29',
        '2021-05-28 01:34:29', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1398090455399837698', '1398090455324340225', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-28 01:35:14',
        '2021-05-28 01:35:14', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1398090685449023490', '1398090685419663362', 'Temperature', '["Hot", "Room Temperature", "No Ice", "Less Ice", "Extra Ice"]',
        '2021-05-28 01:36:09', '2021-05-28 01:36:09', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1398090825358422017', '1398090825329061889', 'Dietary Restrictions', '["No Onions", "No Garlic", "No Cilantro", "No Spicy"]', '2021-05-28 01:36:43',
        '2021-05-28 01:36:43', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1398091007051476993', '1398091007017922561', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-28 01:37:26',
        '2021-05-28 01:37:26', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1398091296164851713', '1398091296131297281', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-28 01:38:35',
        '2021-05-28 01:38:35', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1398091546531246081', '1398091546480914433', 'Dietary Restrictions', '["No Onions", "No Garlic", "No Cilantro", "No Spicy"]', '2021-05-28 01:39:35',
        '2021-05-28 01:39:35', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1398091729809747969', '1398091729788776450', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-28 01:40:18',
        '2021-05-28 01:40:18', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1398091889499484161', '1398091889449152513', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-28 01:40:56',
        '2021-05-28 01:40:56', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1398092095179763713', '1398092095142014978', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-28 01:41:45',
        '2021-05-28 01:41:45', '1', '1', '0');

INSERT INTO `dish_flavor`
VALUES ('1398092283877306370', '1398092283847946241', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-28 01:42:30',
        '2021-05-28 01:42:30', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1398094018939236354', '1398094018893099009', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-28 01:49:24',
        '2021-05-28 01:49:24', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1398094391494094850', '1398094391456346113', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-05-28 01:50:53',
        '2021-05-28 01:50:53', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1399574026165727233', '1399305325713600514', 'Spiciness', '["Not Spicy", "Mild", "Medium", "Hot"]', '2021-06-01 03:50:25',
        '2021-06-01 03:50:25', '1399309715396669441', '1399309715396669441', '0');
INSERT INTO `dish_flavor`
VALUES ('1413389540592263169', '1413384757047271425', 'Temperature', '["Room Temperature", "Refrigerated"]', '2021-07-12 09:09:16',
        '2021-07-12 09:09:16', '1', '1', '0');
INSERT INTO `dish_flavor`
VALUES ('1413389684020682754', '1413342036832100354', 'Temperature', '["Room Temperature", "Refrigerated"]', '2021-07-09 15:12:18',
        '2021-07-09 15:12:18', '1', '1', '0');


-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`
(
    `id`          bigint(20) NOT NULL COMMENT 'Primary Key',
    `name`        varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'Name',
    `username`    varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'Username',
    `password`    varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'Password',
    `phone`       varchar(11) COLLATE utf8_bin NOT NULL COMMENT 'Phone Number',
    `sex`         varchar(2) COLLATE utf8_bin  NOT NULL COMMENT 'Sex',
    `id_number`   varchar(18) COLLATE utf8_bin NOT NULL COMMENT 'ID Number',
    `status`      int(11) NOT NULL DEFAULT '1' COMMENT 'Status 0: Disabled, 1: Active',
    `create_time` datetime                     NOT NULL COMMENT 'Creation Time',
    `update_time` datetime                     NOT NULL COMMENT 'Update Time',
    `create_user` bigint(20) NOT NULL COMMENT 'Creator',
    `update_user` bigint(20) NOT NULL COMMENT 'Modifier',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT 'Employee Information';


-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee`
VALUES ('1', 'administrator', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13812312312', '1', '110101199001010047', '1',
        '2021-05-06 17:20:07', '2021-05-10 02:24:09', '1', '1');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`
(
    `id`              bigint(20) NOT NULL COMMENT 'Primary Key',
    `number`          varchar(50) COLLATE utf8_bin  DEFAULT NULL COMMENT 'Order Number',
    `status`          int(11) NOT NULL DEFAULT '1' COMMENT 'Order Status 1 Pending Payment, 2 Awaiting Delivery, 3 Delivered, 4 Completed, 5 Cancelled',
    `user_id`         bigint(20) NOT NULL COMMENT 'User ID',
    `address_book_id` bigint(20) NOT NULL COMMENT 'Address ID',
    `order_time`      datetime       NOT NULL COMMENT 'Order Time',
    `checkout_time`   datetime       NOT NULL COMMENT 'Checkout Time',
    `pay_method`      int(11) NOT NULL DEFAULT '1' COMMENT 'Payment Method 1 WeChat, 2 Alipay',
    `amount`          decimal(10, 2) NOT NULL COMMENT 'Amount Received',
    `remark`          varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'Remarks',
    `phone`           varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'Phone Number',
    `address`         varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'Address',
    `user_name`       varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'User Name',
    `consignee`       varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'Consignee',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT 'Orders Table';


-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`
(
    `id`          bigint(20) NOT NULL COMMENT 'Primary Key',
    `name`        varchar(50) COLLATE utf8_bin  DEFAULT NULL COMMENT 'Name',
    `image`       varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'Image',
    `order_id`    bigint(20) NOT NULL COMMENT 'Order ID',
    `dish_id`     bigint(20) DEFAULT NULL COMMENT 'Dish ID',
    `setmeal_id`  bigint(20) DEFAULT NULL COMMENT 'Set Meal ID',
    `dish_flavor` varchar(50) COLLATE utf8_bin  DEFAULT NULL COMMENT 'Flavor',
    `number`      int(11) NOT NULL DEFAULT '1' COMMENT 'Quantity',
    `amount`      decimal(10, 2) NOT NULL COMMENT 'Amount',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT 'Order Details Table';


-- ----------------------------
-- Records of order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for setmeal
-- ----------------------------
DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal`
(
    `id`          bigint(20) NOT NULL COMMENT 'Primary Key',
    `category_id` bigint(20) NOT NULL COMMENT 'Category ID',
    `name`        varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'Set Meal Name',
    `price`       decimal(10, 2)               NOT NULL COMMENT 'Set Meal Price',
    `status`      int(11) DEFAULT NULL COMMENT 'Status 0: Disabled, 1: Enabled',
    `code`        varchar(32) COLLATE utf8_bin  DEFAULT NULL COMMENT 'Code',
    `description` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT 'Description',
    `image`       varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'Image',
    `create_time` datetime                     NOT NULL COMMENT 'Creation Time',
    `update_time` datetime                     NOT NULL COMMENT 'Update Time',
    `create_user` bigint(20) NOT NULL COMMENT 'Creator',
    `update_user` bigint(20) NOT NULL COMMENT 'Modifier',
    `is_deleted`  int(11) NOT NULL DEFAULT '0' COMMENT 'Deleted',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `idx_setmeal_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT 'Set Meal Table';


-- ----------------------------
-- Records of setmeal
-- ----------------------------
INSERT INTO `setmeal`
VALUES ('1415580119015145474', '1413386191767674881', 'Kids Meal Plan A', '4000.00', '1', '', '',
        '61d20592-b37f-4d72-a864-07ad5bb8f3bb.jpg', '2021-07-15 15:52:55', '2021-07-15 15:52:55', '1415576781934608386',
        '1415576781934608386', '0');

-- ----------------------------
-- Table structure for setmeal_dish
-- ----------------------------
DROP TABLE IF EXISTS `setmeal_dish`;
CREATE TABLE `setmeal_dish`
(
    `id`          bigint(20) NOT NULL COMMENT 'Primary Key',
    `setmeal_id`  varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'Set Meal ID',
    `dish_id`     varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'Dish ID',
    `name`        varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'Dish Name (redundant field)',
    `price`       decimal(10, 2)               DEFAULT NULL COMMENT 'Original Dish Price (redundant field)',
    `copies`      int(11) NOT NULL COMMENT 'Number of Copies',
    `sort`        int(11) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
    `create_time` datetime                     NOT NULL COMMENT 'Creation Time',
    `update_time` datetime                     NOT NULL COMMENT 'Update Time',
    `create_user` bigint(20) NOT NULL COMMENT 'Creator',
    `update_user` bigint(20) NOT NULL COMMENT 'Modifier',
    `is_deleted`  int(11) NOT NULL DEFAULT '0' COMMENT 'Deleted',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT 'Set Meal to Dish Relationship Table';


-- ----------------------------
-- Records of setmeal_dish
-- ----------------------------
INSERT INTO `setmeal_dish`
VALUES ('1415580119052894209', '1415580119015145474', '1397862198033297410', 'Old fire soup', '49800.00', '1', '0',
        '2021-07-15 15:52:55', '2021-07-15 15:52:55', '1415576781934608386', '1415576781934608386', '0');
INSERT INTO `setmeal_dish`
VALUES ('1415580119061282817', '1415580119015145474', '1413342036832100354', 'The Arctic Ocean', '500.00', '1', '0',
        '2021-07-15 15:52:55', '2021-07-15 15:52:55', '1415576781934608386', '1415576781934608386', '0');
INSERT INTO `setmeal_dish`
VALUES ('1415580119069671426', '1415580119015145474', '1413385247889891330', 'Rice', '200.00', '1', '0',
        '2021-07-15 15:52:55', '2021-07-15 15:52:55', '1415576781934608386', '1415576781934608386', '0');

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`
(
    `id`          bigint(20) NOT NULL COMMENT 'Primary Key',
    `name`        varchar(50) COLLATE utf8_bin  DEFAULT NULL COMMENT 'Name',
    `image`       varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'Image',
    `user_id`     bigint(20) NOT NULL COMMENT 'User ID',
    `dish_id`     bigint(20) DEFAULT NULL COMMENT 'Dish ID',
    `setmeal_id`  bigint(20) DEFAULT NULL COMMENT 'Set Meal ID',
    `dish_flavor` varchar(50) COLLATE utf8_bin  DEFAULT NULL COMMENT 'Flavor',
    `number`      int(11) NOT NULL DEFAULT '1' COMMENT 'Quantity',
    `amount`      decimal(10, 2) NOT NULL COMMENT 'Amount',
    `create_time` datetime                      DEFAULT NULL COMMENT 'Creation Time',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT 'Shopping Cart';


-- ----------------------------
-- Records of shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `id`        bigint(20)                    NOT NULL COMMENT 'Primary Key',
    `name`      varchar(50) COLLATE utf8_bin  DEFAULT NULL COMMENT 'Name',
    `email`     varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'Email Address',
    `sex`       varchar(2) COLLATE utf8_bin   DEFAULT NULL COMMENT 'Sex',
    `id_number` varchar(18) COLLATE utf8_bin  DEFAULT NULL COMMENT 'ID Number',
    `avatar`    varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT 'Avatar',
    `status`    int(11)                       DEFAULT '0' COMMENT 'Status 0: Disabled, 1: Active',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT 'User Information';

