`INSERT INTO HR.POST
(POST_ID, POST_TITLE, POST_CONTENT, POST_IMG_PATH, ATTRLOC1, ATTRLOC2, POST_THEME_ID, POST_DELFLAG, POST_REGDATE, POST_LIKE_COUNT, POST_VIEW_COUNT, ID, BOOKNO)
VALUES(5, 'POST_TEST', 'POST_TEST_CONTENT', 'https://openimage.interpark.com/dia/images/179/2/201109002/601ad3bbc7fb497a88c32726d16e4ebe.jpg', 1, 1, 2, 'N', SYSDATE, 0, 0, '3', 1);

UPDATE HR.POST
SET POST_IMG_PATH= 'https://openimage.interpark.com/dia/images/179/2/201109002/601ad3bbc7fb497a88c32726d16e4ebe.jpg'
WHERE POST_ID=1;



INSERT INTO HR."MEMBER"
(ID, PASSWORD, NAME, NICKNAME, PHONE, EMAIL, JOINDATE, DELFLAG, MANAGER, FINAL_LOGIN, PANALTY, PANALTY_TERM, SNSJOIN)
VALUES('3', '', '', '', '', '', '', 'N', '', '', '', '', '');


INSERT INTO HR.MYTOURBOOK
(BOOKNO, TITLE, AURTHOR, REGDATE, KEYWORD, DELFLAG)
VALUES(1, 'TEST', '1', SYSDATE, 'TEST', 'N');

INSERT INTO HR.THEME
(THEME_ID, THEME_NAME)
VALUES(1, 'TEST');


SELECT POST_ID, POST_TITLE, POST_CONTENT, POST_IMG_PATH, ATTRLOC1, ATTRLOC2, POST_THEME_ID, POST_DELFLAG, POST_REGDATE, POST_LIKE_COUNT, POST_VIEW_COUNT, ID, BOOKNO
FROM HR.POST;

INSERT INTO HR.USER_FOLLOW
(USER_FOLLOW_ID, FOLLOW_ID, FOLLOWING_ID)
VALUES(USER_FOLLOW_ID_SEQ.NEXTVAL, '1', '3');

CREATE SEQUENCE USER_FOLLOW_ID_SEQ 

SELECT POST_ID,
		POST_TITLE, POST_CONTENT, POST_IMG_PATH, 
		ATTRLOC1, ATTRLOC2, POST_THEME_ID, 
		POST_DELFLAG, POST_REGDATE, POST_LIKE_COUNT,
		POST_VIEW_COUNT, ID, BOOKNO
		FROM HR.POST p
		WHERE p.ID IN (SELECT FOLLOWING_ID FROM USER_FOLLOW WHERE FOLLOW_ID = '1')

INSERT INTO HR.THEME
(THEME_ID, THEME_NAME)
VALUES(2, 'TEST2');

		
SELECT THEME_ID, THEME_NAME
FROM HR.THEME;

INSERT INTO HR.THEME_FOLLOW
(THEME_FOLLOW_ID, THEME_FOLLOWING_ID, USERID)
	VALUES(THEME_FOLLOW_ID_SEQ.NEXTVAL, 1, '1')
SELECT * FROM THEME t 
	
SELECT * FROM "USER" u
SELECT * FROM "MEMBER" m 

CREATE SEQUENCE THEME_FOLLOW_ID_SEQ
DROP SEQUENCE THEME_FOLLOW_ID_SEQ

DELETE FROM THEME_FOLLOW tf WHERE THEME_FOLLOWING_ID = 2 AND USERID = 1

SELECT * FROM THEME_FOLLOW

DELETE FROM THEME_FOLLOW tf WHERE THEME_FOLLOW_ID = 3
		
SELECT POST_ID, POST_TITLE, POST_CONTENT, POST_IMG_PATH, ATTRLOC1, ATTRLOC2, POST_THEME_ID, POST_DELFLAG, POST_REGDATE, POST_LIKE_COUNT, POST_VIEW_COUNT, ID, BOOKNO
FROM HR.POST p
	WHERE p.POST_THEME_ID IN (SELECT THEME_FOLLOWING_ID FROM THEME_FOLLOW tf WHERE USERID = '1');

SELECT POST_ID, POST_TITLE, POST_CONTENT, POST_IMG_PATH, ATTRLOC1, ATTRLOC2, POST_THEME_ID, POST_DELFLAG, POST_REGDATE, POST_LIKE_COUNT, POST_VIEW_COUNT, ID, BOOKNO
FROM HR.POST p
	WHERE p.POST_ID = 1
	
DELETE FROM HR.USER_FOLLOW
	WHERE FOLLOW_ID =1 AND FOLLOWING_ID =3;


	
	
--테마 셀렉트
SELECT THEME_ID, THEME_NAME
FROM HR.THEME;

--댓글 입력
CREATE SEQUENCE COMMENT_ID_SEQ
INSERT INTO HR.POST_COMMENT
(COMMENT_ID, COMMENT_POST_ID, COMMENT_CONTENT, COMMENT_REGDATE, COMMENT_DELFLAG, ID)
	VALUES(COMMENT_ID_SEQ.NEXTVAL, 1, '댓글1', SYSDATE, 'N', '1');

--댓글 셀렉트
SELECT COMMENT_ID, COMMENT_POST_ID, COMMENT_CONTENT, COMMENT_REGDATE, COMMENT_DELFLAG, ID
FROM HR.POST_COMMENT
	WHERE COMMENT_POST_ID = 2;



SELECT POST_ID,
		POST_TITLE, POST_CONTENT, POST_IMG_PATH, 
		ATTRLOC1, ATTRLOC2, POST_THEME_ID, 
		POST_DELFLAG, POST_REGDATE, POST_LIKE_COUNT,
		POST_VIEW_COUNT, ID, BOOKNO
			FROM HR.POST p
				WHERE p.ID 
					IN (SELECT FOLLOWING_ID 
						FROM USER_FOLLOW 
							WHERE FOLLOW_ID = 3)

UPDATE POST SET POST_VIEW_COUNT = POST_VIEW_COUNT+1
	WHERE POST_ID = 1
	
SELECT POST_ID,
		POST_TITLE, POST_CONTENT, POST_IMG_PATH, 
		ATTRLOC1, ATTRLOC2, POST_THEME_ID,
		POST_DELFLAG, POST_REGDATE, POST_LIKE_COUNT,
		POST_VIEW_COUNT, ID, BOOKNO
			FROM HR.POST
			ORDER BY POST_REGDATE DESC


 


--alter table--------
ALTER TABLE "MEMBER" ADD PROFILE_IMG_PATH VARCHAR(500);
