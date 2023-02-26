-- Предыдущую задачу решить с помощью процедуры

USE vk;
DROP PROCEDURE IF EXISTS del_all_userinfo;

DELIMITER //
CREATE PROCEDURE del_all_userinfo(this_user_id BIGINT UNSIGNED)
	BEGIN
		DELETE FROM messages WHERE messages.from_user_id = this_user_id;                      
        DELETE FROM messages WHERE messages.to_user_id = this_user_id;                        
     
		DELETE FROM friend_requests WHERE friend_requests.initiator_user_id = this_user_id;   
		DELETE FROM friend_requests WHERE friend_requests.target_user_id = this_user_id;      
           
		DELETE FROM likes WHERE likes.user_id = this_user_id;                                 
		DELETE FROM media WHERE media.user_id = this_user_id;                                 
		DELETE FROM `profiles` WHERE `profiles`.user_id = this_user_id;                       
		DELETE FROM users_communities WHERE users_communities.user_id = this_user_id;         
		DELETE FROM `users` WHERE `users`.id = this_user_id;                                  

	END//
DELIMITER ;