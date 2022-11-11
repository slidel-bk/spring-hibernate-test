CREATE DATABASE SCAD
GO

USE SCAD
GO

CREATE TABLE authors
(
   au_id		  int identity(1,1)		PRIMARY KEY CLUSTERED,
   au_lname       varchar(30)       NOT NULL,
   au_fname       varchar(30)       NOT NULL,
   phone          char(12)          NOT NULL,
   address        varchar(40)           NULL,
   city           varchar(20)           NULL,
   state          char(2)               NULL,
   zip            char(5)               NULL,
   contract       bit               NOT NULL
)

GO


insert authors
   values('Bennet', 'Abraham', '415 658-9932',
   '6223 Bateman St.', 'Berkeley', 'CA', '94705', 1)
insert authors
   values( 'Green', 'Marjorie', '415 986-7020',
   '309 63rd St. #411', 'Oakland', 'CA', '94618', 1)
insert authors
   values( 'Carson', 'Cheryl', '415 548-7723',
   '589 Darwin Ln.', 'Berkeley', 'CA', '94705', 1)
insert authors
   values('Ringer', 'Albert', '801 826-0752',
   '67 Seventh Av.', 'Salt Lake City', 'UT', '84152', 1)
insert authors
   values('Ringer', 'Anne', '801 826-0752',
   '67 Seventh Av.', 'Salt Lake City', 'UT', '84152', 1)
insert authors
   values('DeFrance', 'Michel', '219 547-9982',
   '3 Balding Pl.', 'Gary', 'IN', '46403', 1)
insert authors
   values('Panteley', 'Sylvia', '301 946-8853',
   '1956 Arlington Pl.', 'Rockville', 'MD', '20853', 1)
insert authors
   values('McBadden', 'Heather',
   '707 448-4982', '301 Putnam', 'Vacaville', 'CA', '95688', 0)
insert authors
   values( 'Stringer', 'Dirk', '415 843-2991',
   '5420 Telegraph Av.', 'Oakland', 'CA', '94609', 0)
insert authors
   values( 'Straight', 'Dean', '415 834-2919',
   '5420 College Av.', 'Oakland', 'CA', '94609', 1)
insert authors
   values( 'Karsen', 'Livia', '415 534-9219',
   '5720 McAuley St.', 'Oakland', 'CA', '94609', 1)