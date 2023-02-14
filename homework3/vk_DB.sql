-- 1. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке. [ORDER BY]
SELECT DISTINCT firstname 
FROM users
ORDER BY firstname;

-- 2. Выведите количество мужчин старше 35 лет [COUNT]
SELECT birthday, COUNT(*) AS 'over_35_years' 
FROM profiles
WHERE gender = 'm' AND ADDDATE(birthday, INTERVAL 35 YEAR) < NOW()
GROUP BY birthday
ORDER BY birthday;

-- можно так
SELECT COUNT(*) AS 'over_35_years' 
FROM profiles
WHERE gender = 'm' AND (birthday + INTERVAL 35 YEAR) < NOW();

-- 3. Сколько заявок в друзья в каждом статусе? (таблица friend_requests) [GROUP BY]
SELECT status, COUNT(*) AS 'request_count'
FROM friend_requests
GROUP BY status;

-- 4. Выведите номер пользователя, который отправил больше всех заявок в друзья (таблица friend_requests) [LIMIT]
SELECT initiator_user_id, COUNT(*) AS 'request_count'
FROM friend_requests
GROUP BY initiator_user_id
LIMIT 1;

-- 5. * Выведите названия и номера групп, имена которых состоят из 5 символов [LIKE]
-- используем подчеркивание (в данном случае 5) 
SELECT 
	id AS '№_group', 
    name AS 'name_group'
FROM communities
WHERE name LIKE '_____';