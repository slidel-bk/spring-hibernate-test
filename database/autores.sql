--create database autores

--use autores

CREATE TABLE authors
(
   au_id		  int identity(1,1) primary key,
   au_lname       varchar(40)       NOT NULL,
   au_fname       varchar(20)       NOT NULL,
   phone          char(12)          NOT NULL DEFAULT ('UNKNOWN'),
   address        varchar(40)           NULL,
   city           varchar(20)           NULL,
   state          char(2)               NULL,
   zip            char(5)               NULL,
   contract       bit               NOT NULL
)
GO

CREATE TABLE publishers
(
   pub_id         int identity(1,1) primary key,
   pub_name       varchar(40)           NULL,
   city           varchar(20)           NULL,
   state          char(2)               NULL,
   country        varchar(30)           NULL DEFAULT('USA')
)
GO


CREATE TABLE titles
(
   title_id    int identity(1,1) primary key,
   title       varchar(80)			NOT NULL,
   type           char(12)          NOT NULL DEFAULT ('UNDECIDED'),
   pub_id         int               NULL REFERENCES publishers(pub_id),
   price          money                 NULL,
   advance        money                 NULL,
   royalty        int                   NULL,
   ytd_sales      int                   NULL,
   notes          varchar(200)          NULL,
   pubdate        datetime          NOT NULL DEFAULT (getdate())
)

GO


CREATE TABLE titleauthor
(
   au_id          int REFERENCES authors(au_id),
   title_id       int REFERENCES titles(title_id),
   au_ord         tinyint               NULL,
   royaltyper     int                   NULL,
   CONSTRAINT UPKCL_taind PRIMARY KEY CLUSTERED(au_id, title_id)
)

GO

insert authors
   values( 'Bennet', 'Abraham', '415 658-9932',
   '6223 Bateman St.', 'Berkeley', 'CA', '94705', 1)
insert authors
   values( 'Green', 'Marjorie', '415 986-7020',
   '309 63rd St. #411', 'Oakland', 'CA', '94618', 1)
insert authors
   values( 'Carson', 'Cheryl', '415 548-7723',
   '589 Darwin Ln.', 'Berkeley', 'CA', '94705', 1)
insert authors
   values( 'Ringer', 'Albert', '801 826-0752',
   '67 Seventh Av.', 'Salt Lake City', 'UT', '84152', 1)
insert authors
   values( 'Ringer', 'Anne', '801 826-0752',
   '67 Seventh Av.', 'Salt Lake City', 'UT', '84152', 1)
insert authors
   values('DeFrance', 'Michel', '219 547-9982',
   '3 Balding Pl.', 'Gary', 'IN', '46403', 1)
insert authors
   values( 'Panteley', 'Sylvia', '301 946-8853',
   '1956 Arlington Pl.', 'Rockville', 'MD', '20853', 1)
insert authors
   values( 'McBadden', 'Heather',
   '707 448-4982', '301 Putnam', 'Vacaville', 'CA', '95688', 0)
insert authors
   values( 'Stringer', 'Dirk', '415 843-2991',
   '5420 Telegraph Av.', 'Oakland', 'CA', '94609', 0)
insert authors
   values('Straight', 'Dean', '415 834-2919',
   '5420 College Av.', 'Oakland', 'CA', '94609', 1)
insert authors
   values( 'Karsen', 'Livia', '415 534-9219',
   '5720 McAuley St.', 'Oakland', 'CA', '94609', 1)
insert authors
   values( 'MacFeather', 'Stearns', '415 354-7128',
   '44 Upland Hts.', 'Oakland', 'CA', '94612', 1)
insert authors
   values( 'Dull', 'Ann', '415 836-7128',
   '3410 Blonde St.', 'Palo Alto', 'CA', '94301', 1)
insert authors
   values( 'Yokomoto', 'Akiko', '415 935-4228',
   '3 Silver Ct.', 'Walnut Creek', 'CA', '94595', 1)
insert authors
   values( 'O''Leary', 'Michael', '408 286-2428',
   '22 Cleveland Av. #14', 'San Jose', 'CA', '95128', 1)
insert authors
   values( 'Gringlesby', 'Burt', '707 938-6445',
   'PO Box 792', 'Covelo', 'CA', '95428', 3)
insert authors
   values( 'Greene', 'Morningstar', '615 297-2723',
   '22 Graybar House Rd.', 'Nashville', 'TN', '37215', 0)
insert authors
   values( 'White', 'Johnson', '408 496-7223',
   '10932 Bigge Rd.', 'Menlo Park', 'CA', '94025', 1)
insert authors
   values('del Castillo', 'Innes', '615 996-8275',
   '2286 Cram Pl. #86', 'Ann Arbor', 'MI', '48105', 1)
insert authors
   values( 'Hunter', 'Sheryl', '415 836-7128',
   '3410 Blonde St.', 'Palo Alto', 'CA', '94301', 1)
insert authors
   values( 'Locksley', 'Charlene', '415 585-4620',
   '18 Broadway Av.', 'San Francisco', 'CA', '94130', 1)
insert authors
   values('Blotchet-Halls', 'Reginald', '503 745-6402',
   '55 Hillsdale Bl.', 'Corvallis', 'OR', '97330', 1)
insert authors
   values( 'Smith', 'Meander', '913 843-0462',
   '10 Mississippi Dr.', 'Lawrence', 'KS', '66044', 0)

GO


insert publishers values( 'New Moon Books', 'Boston', 'MA', 'USA')
insert publishers values( 'Binnet & Hardley', 'Washington', 'DC', 'USA')
insert publishers values( 'Algodata Infosystems', 'Berkeley', 'CA', 'USA')
insert publishers values( 'Scootney Books', 'New York', 'NY', 'USA')
insert publishers values( 'Five Lakes Publishing', 'Chicago', 'IL', 'USA')
insert publishers values( 'Ramona Publishers', 'Dallas', 'TX', 'USA')
insert publishers values( 'GGG&G', 'M�nchen', NULL, 'Germany')
insert publishers values( 'Lucerne Publishing', 'Paris', NULL, 'France')

GO



select * from publishers

insert titles values ('Secrets of Silicon Valley', 'popular_comp', 3,
$20.00, $8000.00, 10, 4095,
'Muckraking reporting on the world''s largest computer hardware and software manufacturers.',
'06/12/94')

insert titles values ('The Busy Executive''s Database Guide', 'business',
3, $19.99, $5000.00, 10, 4095,
'An overview of available database systems with emphasis on common business applications. Illustrated.',
'06/12/91')

insert titles values ( 'Emotional Security: A New Algorithm', 'psychology',
1, $7.99, $4000.00, 10, 3336,
'Protecting yourself and your loved ones from undue emotional stress in the modern world. Use of computer and nutritional aids emphasized.',
'06/12/91')

insert titles values ( 'Prolonged Data Deprivation: Four Case Studies',
'psychology', 3, $19.99, $2000.00, 10, 4072,
'What happens when the data runs dry?  Searching evaluations of information-shortage effects.',
'06/12/91')

insert titles values ('Cooking with Computers: Surreptitious Balance Sheets',
'business', 3, $11.95, $5000.00, 10, 3876,
'Helpful hints on how to use your electronic resources to the best advantage.',
'06/09/91')

insert titles values ( 'Silicon Valley Gastronomic Treats', 'mod_cook', 2,
$19.99, $0.00, 12, 2032,
'Favorite recipes for quick, easy, and elegant meals.',
'06/09/91')

insert titles values ( 'Sushi, Anyone?', 'trad_cook', 2, $14.99, $8000.00,
10, 4095,
'Detailed instructions on how to make authentic Japanese sushi in your spare time.',
'06/12/91')

insert titles values ('Fifty Years in Buckingham Palace Kitchens', 'trad_cook',
2, $11.95, $4000.00, 14, 15096,
'More anecdotes from the Queen''s favorite cook describing life among English royalty. Recipes, techniques, tender vignettes.',
'06/12/91')

insert titles values ('But Is It User Friendly?', 'popular_comp', 3,
$22.95, $7000.00, 16, 8780,
'A survey of software for the naive user, focusing on the ''friendliness'' of each.',
'06/30/91')

insert titles values('You Can Combat Computer Stress!', 'business', 1,
$2.99, $10125.00, 24, 18722,
'The latest medical and psychological techniques for living with the electronic office. Easy-to-understand explanations.',
'06/30/91')

insert titles values('Is Anger the Enemy?', 'psychology', 1, $10.95,
$2275.00, 12, 2045,
'Carefully researched study of the effects of strong emotions on the body. Metabolic charts included.',
'06/15/91')

insert titles values( 'Life Without Fear', 'psychology', 1, $7.00, $6000.00,
10, 111,
'New exercise, meditation, and nutritional techniques that can reduce the shock of daily interactions. Popular audience. Sample menus included, exercise video available separately.',
'10/05/91')

insert titles values( 'The Gourmet Microwave', 'mod_cook', 2, $2.99,
$15000.00, 24, 22246,
'Traditional French gourmet recipes adapted for modern microwave cooking.',
'06/18/91')

insert titles values('Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean',
'trad_cook', 2, $20.95, $7000.00, 10, 375,
'Profusely illustrated in color, this makes a wonderful gift book for a cuisine-oriented friend.',
'10/21/91')

insert titles (title, pub_id) values(
'The Psychology of Computer Cooking', 2)

insert titles values ( 'Straight Talk About Computers', 'business', 3,
$19.99, $5000.00, 10, 4095,
'Annotated analysis of what computers can do for you: a no-hype guide for the critical user.',
'06/22/91')

insert titles values( 'Computer Phobic AND Non-Phobic Individuals: Behavior Variations',
'psychology', 2, $21.59, $7000.00, 10, 375,
'A must for the specialist, this book examines the difference between those who hate and fear computers and those who don''t.',
'10/21/91')

insert titles ( title, type, pub_id, notes) values('Net Etiquette',
'popular_comp', 3, 'A must-read for computer conferencing.')

GO

insert titleauthor values('409-56-7008', 'BU1032', 1, 60)
insert titleauthor values('486-29-1786', 'PS7777', 1, 100)
insert titleauthor values('486-29-1786', 'PC9999', 1, 100)
insert titleauthor values('712-45-1867', 'MC2222', 1, 100)
insert titleauthor values('172-32-1176', 'PS3333', 1, 100)
insert titleauthor values('213-46-8915', 'BU1032', 2, 40)
insert titleauthor values('238-95-7766', 'PC1035', 1, 100)
insert titleauthor values('213-46-8915', 'BU2075', 1, 100)
insert titleauthor values('998-72-3567', 'PS2091', 1, 50)
insert titleauthor values('899-46-2035', 'PS2091', 2, 50)
insert titleauthor values('998-72-3567', 'PS2106', 1, 100)
insert titleauthor values('722-51-5454', 'MC3021', 1, 75)
insert titleauthor values('899-46-2035', 'MC3021', 2, 25)
insert titleauthor values('807-91-6654', 'TC3218', 1, 100)
insert titleauthor values('274-80-9391', 'BU7832', 1, 100)
insert titleauthor values('427-17-2319', 'PC8888', 1, 50)
insert titleauthor values('846-92-7186', 'PC8888', 2, 50)
insert titleauthor values('756-30-7391', 'PS1372', 1, 75)
insert titleauthor values('724-80-9391', 'PS1372', 2, 25)
insert titleauthor values('724-80-9391', 'BU1111', 1, 60)
insert titleauthor values('267-41-2394', 'BU1111', 2, 40)
insert titleauthor values('672-71-3249', 'TC7777', 1, 40)
insert titleauthor values('267-41-2394', 'TC7777', 2, 30)
insert titleauthor values('472-27-2349', 'TC7777', 3, 30)
insert titleauthor values('648-92-1872', 'TC4203', 1, 100)

select * from authors

select * from titles