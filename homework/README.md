## Задание
1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Необходимые поля таблицы: product_name (название товара), manufacturer (производитель), product_count (количество), price (цена). Заполните БД произвольными данными.
2. Напишите SELECT-запрос, который выводит название товара, производителя и цену для товаров, количество которых превышает 2
3. Выведите SELECT-запросом весь ассортимент товаров марки “Samsung”
4. \* С помощью SELECT-запроса с оператором LIKE / REGEXP найти:

    4.1. \* Товары, в которых есть упоминание "Iphone"

    4.2. \* Товары, в которых есть упоминание "Samsung"

    4.3. \* Товары, в названии которых есть ЦИФРЫ

    4.4. \* Товары, в названии которых есть ЦИФРА "8"

<br/>

# Выполнение
## 1. Создание схемы
```
CREATE SCHEMA 'homework1';
```
## 2. Создание таблицы
```
CREATE TABLE mobile_phone
( 
	phone_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50),
    manufacturer VARCHAR(30),
    product_count INTEGER,
    price DECIMAL
);
```
## 3. Заполнение таблицы
```
INSERT INTO mobile_phone
	(product_name, manufacturer, product_count, price)
VALUES
	('Galaxy S23', 'Samsung', 8, 79999),
    ('50', 'Honor', 1, 26999),
    ('iPhone 13', 'Apple', 3, 64399),
    ('Redmi A1+', 'Xiaomi', 1, 4999),
    ('iPhone 14 Pro', 'Apple', 5, 125999),
    ('Redmi Note 10 Pro','Xiaomi', 4, 23999),
    ('Mate 50', 'HUAWEI', 7, 49999),
    ('nova 10', 'HUAWEI', 0, 31999),
    ('Galaxy S21', 'Samsung', 1, 65599),
    ('Master Edition', 'GT', 1, 25999);
```