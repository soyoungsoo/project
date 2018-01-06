SELECT * FROM Movie;

SELECT * FROM MEMBER;

SELECT * FROM user_type;

SELECT m.memno, m.id, m.pwd, m.name, m.birth, m.email, ut.id, ut.type
FROM member m,
	(SELECT user_info_type.memno, user_type.id, user_type.type
	FROM user_info_type, user_type
	WHERE user_type.id = user_info_type_id) ut
WHERE m.memno = ut.memno;

select * from user_type;

SELECT user_info_type.memno, user_type.id, user_type.type
	FROM user_info_type, user_type
	WHERE user_type.id = user_info_type_id;
	
	
		SELECT m.memno, m.id, m.pwd, m.name, m.birth, m.email, ut.id, ut.type
	FROM member m,
	(SELECT user_info_type.memno, user_type.id, user_type.type
	FROM user_info_type, user_type
	WHERE user_type.id = user_info_type_id) ut
	WHERE m.memno = ut.memno AND m.id = 'test';