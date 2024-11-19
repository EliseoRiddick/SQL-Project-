#Create database
CREATE DATABASE instagram_workspace;

USE instagram_workspace;

#Create table for user profiles
CREATE TABLE User_Profile
	(UserID VARCHAR(30) PRIMARY KEY,
    Posts INT (5000),
    Bio VARCHAR (500));
    
#Create table for user stories
CREATE TABLE Stories
	(StoryID INTEGER PRIMARY KEY,
    Likes_S INT,
    ViewCount INT);
#Create table for user pictures    
CREATE TABLE Pictures
	(PictureID INTEGER PRIMARY KEY,
    Likes_P INT,
    Comments VARCHAR(2200));
#Create table for archived content
CREATE TABLE Content_Archive (
    ArchiveID INT PRIMARY KEY AUTO_INCREMENT,
    ContentID INT,
    UserID VARCHAR(30),
    DateArchived DATE,
    ContentType ENUM('Story', 'Picture'),
    FOREIGN KEY (UserID) REFERENCES User_Profile(UserID)
);
#Create table for notifications    
CREATE TABLE Notifcations
	(NotificationID INTEGER PRIMARY KEY,
    UserID VARCHAR(30),
    NotificationType CHAR(30),
    DateofNotification DATE,
    CONSTRAINT Notifications_FK FOREIGN KEY (UserID) REFERENCES User_Profile(UserID));

#Create table for messages
CREATE TABLE Messages
	(MessageID INTEGER PRIMARY KEY,
    UserID VARCHAR(30),
    DateOfMessage DATE,
    MessageStatus CHAR(9),
    CONSTRAINT Messages_FK FOREIGN KEY (UserID) REFERENCES User_Profile(UserID));

# Create Audit Log table to track changes    
CREATE TABLE Audit_Log (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    TableName VARCHAR(50),
    Action ENUM('INSERT', 'UPDATE', 'DELETE'),
    ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UserID VARCHAR(30),
    Details TEXT
);

#Adding timestaps to posts
ALTER TABLE User_Profile
ADD CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

#Insert data into User Profile table    
INSERT INTO User_Profile VALUES ('leslieisthename', '20', 'Life is short smile more'); 
INSERT INTO User_Profile VALUES ('jacobibewylin', '15', '|GSU|24|Fitness|');
INSERT INTO User_Profile VALUES ('mistertwotimes', '2', 'Actor/Rapper/Singer/Producer');
INSERT INTO User_Profile VALUES ('racecarjeff', '18', 'BMW M4');
INSERT INTO User_Profile VALUES ('wealthbuilder', '27', 'Invest more, spend less');
INSERT INTO User_Profile VALUES ('liluziburp', '82', 'main page @liluzivert');
INSERT INTO User_Profile VALUES ('sirsavagethe21st', '5', 'Be true to yourself.');
INSERT INTO User_Profile VALUES ('jerrydahmer', '54', 'Stop and smell the flowers.');
INSERT INTO User_Profile VALUES ('rich_ricardo', '4', 'Time is precious—waste it wisely.');
INSERT INTO User_Profile VALUES ('ryan.seagram', '0', 'Don’t be afraid to shine.');
INSERT INTO User_Profile VALUES ('elvisrodrig', '12', 'Not all those who wander are lost');
INSERT INTO User_Profile VALUES ('travissnott', '34', 'Be yourself fam');
INSERT INTO User_Profile VALUES ('jamesthekidd', '5', 'The name is james');
INSERT INTO User_Profile VALUES ('richard.benson15', '10', 'WHS 15 | Football WR');
INSERT INTO User_Profile VALUES ('sneakerplug404', '60', 'buy-sell-trade | Atlanta |Good prices| ');
INSERT INTO User_Profile VALUES ('rxchardwilson', '42', 'Making History.');
INSERT INTO User_Profile VALUES ('real.mayo', '11', 'It always seems impossible until it’s done.');
INSERT INTO User_Profile VALUES ('_josehernandez_', '4', 'ATL');
INSERT INTO User_Profile VALUES ('bryangarcia_', '5', 'Life is short smile more');
INSERT INTO User_Profile VALUES ('poblanopablo', '8', 'For the outdoor enthusiast, #getoutdoors');
INSERT INTO User_Profile VALUES ('balenciaga.benny', '19', 'Fashion | Lifestyle | Fitness');

#Insert data into Stories
INSERT INTO Stories VALUES ('4081', '59', '20'); 
INSERT INTO Stories VALUES ('5494', '42', '34'); 
INSERT INTO Stories VALUES ('9108', '64', '500'); 
INSERT INTO Stories VALUES ('4238', '33', '675'); 
INSERT INTO Stories VALUES ('6772', '41', '574'); 
INSERT INTO Stories VALUES ('9437', '87', '22'); 
INSERT INTO Stories VALUES ('9520', '36', '89'); 
INSERT INTO Stories VALUES ('5030', '23', '72'); 
INSERT INTO Stories VALUES ('2557', '42', '35'); 
INSERT INTO Stories VALUES ('0739', '16', '85'); 
INSERT INTO Stories VALUES ('3434', '6', '48'); 
INSERT INTO Stories VALUES ('4666', '82', '96'); 
INSERT INTO Stories VALUES ('2802', '71', '89'); 
INSERT INTO Stories VALUES ('7538', '66', '100'); 
INSERT INTO Stories VALUES ('6106', '13', '20'); 
INSERT INTO Stories VALUES ('2381', '36', '50'); 
INSERT INTO Stories VALUES ('2326', '11', '70'); 
INSERT INTO Stories VALUES ('2327', '28', '235'); 
INSERT INTO Stories VALUES ('6723', '14', '68'); 
INSERT INTO Stories VALUES ('0938', '2', '97'); 
INSERT INTO Stories VALUES ('0932', '15', '54'); 

#Insert data into Content Archive table
INSERT INTO Content_Archive VALUES ('0265', '4081', 'leslieisthename','2017-05-05','Story');
INSERT INTO Content_Archive VALUES ('0284', '5494', 'jacobibewylin','2017-05-31','Story');
INSERT INTO Content_Archive VALUES ('1264', '4238', 'mistertwotimes','2017-06-14','Picture');
INSERT INTO Content_Archive VALUES ('2987', '6772', 'racecarjeff','2022-08-11','Story');
INSERT INTO Content_Archive VALUES ('5609', '9437', 'wealthbuilder','2018-04-06','Picture');
INSERT INTO Content_Archive VALUES ('7860', '9520', 'liluziburp','2021-04-26','Story');
INSERT INTO Content_Archive VALUES ('6745', '5030', 'sirsavagethe21st','2021-03-22','Story');
INSERT INTO Content_Archive VALUES ('7854', '2557', 'jerrydahmer','2021-07-26','Picture');
INSERT INTO Content_Archive VALUES ('8796', '0739', 'rich_ricardo','2017-08-02','Picture');
INSERT INTO Content_Archive VALUES ('5643', '3434', 'ryan.seagram','2020-02-11','Story');
INSERT INTO Content_Archive VALUES ('5634', '4666', 'elvisrodrig','2020-03-17','Picture');
INSERT INTO Content_Archive VALUES ('9806', '2802', 'travissnott','2021-08-05','Story');
INSERT INTO Content_Archive VALUES ('4508', '7538', 'jamesthekidd','2018-04-20','Story');
INSERT INTO Content_Archive VALUES ('2695', '6106', 'richard.benson15','2020-04-28','Picture');
INSERT INTO Content_Archive VALUES ('9845', '2381', 'sneakerplug404','2018-10-15','Picture');
INSERT INTO Content_Archive VALUES ('6721', '2381', 'rxchardwilson','2021-08-20','Picture');
INSERT INTO Content_Archive VALUES ('7834', '2327', 'real.mayo','2018-06-27','Story');
INSERT INTO Content_Archive VALUES ('3595', '6773', '_josehernandez_','2018-04-20','Story');
INSERT INTO Content_Archive VALUES ('6753', '6723', 'bryangarcia_','2022-08-11','Picture');
INSERT INTO Content_Archive VALUES ('7684', '0938', 'poblanopablo','2022-07-26','Story');
INSERT INTO Content_Archive VALUES ('7421', '0932', 'balenciaga.benny','2022-01-12','Story');

#Update user profile
UPDATE User_Profile
SET UserID = 'jose_p' WHERE UserID = '_josehernandez_';

#Users with the most posts
SELECT UserID, Posts 
FROM User_Profile 
ORDER BY Posts DESC 
LIMIT 1;

#Average likes per picture
SELECT AVG(Likes_P) AS AverageLikesPerPicture 
FROM Pictures;

#Delete user profile
DELETE FROM User_Profile
WHERE UserID = 'balecniaga.benny';

#Users with archived pictures and stories
SELECT u.UserID, 
       SUM(CASE WHEN ca.ContentType = 'Story' THEN 1 ELSE 0 END) AS ArchivedStories,
       SUM(CASE WHEN ca.ContentType = 'Picture' THEN 1 ELSE 0 END) AS ArchivedPictures
FROM User_Profile u
LEFT JOIN Content_Archive ca ON u.UserID = ca.UserID
GROUP BY u.UserID
HAVING ArchivedStories > 0 AND ArchivedPictures > 0;

#Messages sent per user
SELECT UserID, COUNT(*) AS MessagesSent
FROM Messages
GROUP BY UserID
ORDER BY MessagesSent DESC;
