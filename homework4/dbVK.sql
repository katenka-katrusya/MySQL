-- 1. Подсчитать количество групп, в которые вступил каждый пользователь
SELECT 
	u.id AS user_ID, 
    u.firstname AS firstname,
    u.lastname AS lastname, 
	COUNT(community_id) AS group_count
FROM users_communities AS u_c
	RIGHT JOIN users AS u 
	ON u_c.user_id = u.id
GROUP BY u.id
ORDER BY u.id;

-- 2. Подсчитать количество пользователей в каждом сообществе
SELECT 
	c.name AS group_name,
	COUNT(user_id) AS user_count
FROM users_communities AS u_c
	JOIN communities AS c
	ON u_c.community_id = c.id
GROUP BY c.name
ORDER BY c.name;

/* 3. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
который больше всех общался с выбранным пользователем (написал ему сообщений). */
SELECT 
	from_user_id AS id, 
    u_sender.lastname AS sender, 
    to_user_id AS id, 
    u_reciever.lastname AS reciever, 
    COUNT(to_user_id) AS count_messages
FROM messages AS m
	INNER JOIN users AS u_sender 
	ON u_sender.id = m.from_user_id
    
	INNER JOIN users AS u_reciever 
	ON u_reciever.id = m.to_user_id
	WHERE to_user_id = 1
GROUP BY from_user_id
ORDER BY count_messages DESC
LIMIT 1;

-- 4. * Подсчитать общее количество лайков, которые получили пользователи младше 18 лет
SELECT 
	COUNT(likes.id) AS count_likes
FROM likes
	INNER JOIN media
    ON media.id = likes.media_id
    
	INNER JOIN profiles AS p 
    ON p.user_id = media.user_id
	WHERE (birthday + INTERVAL 18 YEAR) > NOW()  
ORDER BY media.user_id;

 -- 5. * Определить кто больше поставил лайков (всего): мужчины или женщины
SELECT 
	p.gender, 
	COUNT(p.gender) AS count_likes
FROM likes
	INNER JOIN profiles AS p 
    ON likes.user_id = p.user_id 
GROUP BY p.gender
ORDER BY count_likes DESC
LIMIT 1;