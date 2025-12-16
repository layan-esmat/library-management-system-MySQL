create database library;
use library;

-- BOOK TABLE
create table book (bookID int primary key, title varchar(50) not null, author varchar(20) not null,
publisher varchar(100), publicationYear int check(publicationYear between 1900 and 2025), 
category varchar(10) check(category in ('CS', 'AI', 'IS')) default 'CS', ISBN varchar(20) unique,
availabilityStatus varchar(20) default 'available');

-- MEMBER TABLE
create table member (memberID int primary key, fname varchar(20) not null, lname varchar(20) not null,
email varchar(60) unique, phone varchar(15), nationality varchar(20) default 'saudi', 
membershipDate date default(current_date), membershipType varchar(20) default 'student');

-- BORROWING TABLE
create table borrowing (borrowID int primary key, bookID int, memberID int, borrowDate date default(current_date),
dueDate date, returnDate date null, fineAmount decimal(6,2) default 0.00, 
constraint fk1 foreign key(bookID) references book(bookID), constraint fk2 foreign key(memberID) references member(memberID),
constraint ck_dueDate check(dueDate >= borrowDate));

-- DATA INSERTION

-- book
insert into book
values(1111, 'programming 101', 'charles boyle', 'jarir bookstore', 2011, 'CS', '0101010203', 'available'),
(2222, 'machine learning', 'raymond holt', 'stanford university', 2010, 'AI', '2321123560', 'available'),
(3333, 'calculus 101', 'amy santiago', 'jarir bookstore', 1998, 'IS', '1234567876', 'unavailable'),
(4444, 'data structures', 'hitchcock', 'MIT', 2013, 'CS', '2345432879', 'available');


-- member
insert into member 
values (1001, 'layan', 'esmat', 'layan@gmail.com', '0568532936', 'saudi', '2025-07-15', 'student'),
(1002, 'sarah', 'alharbi', 'sarah@gmail.com', '0987656722', 'saudi', '2024-07-13', 'student'), 
(1003, 'fetoon', 'alberekit', 'fetoon@gmail.com', '0555467898','jordanian', '2022-03-12','professor'),
(1004, 'layal', 'alhazmi', 'layal@g,ail.com', '0577679087', 'saudi', '2021-12-10', 'student');

-- borrowing
insert into borrowing
values ( 01, 1111, 1001, '2025-12-6', '2025-12-20', null, 0.00),
(02, 2222, 1002, '2024-12-23', '2025-01-08', '2024-12-29', 0.00),
(03, 3333, 1003, '2025-02-12', '2025-03-01', null, 35.50),
(04, 4444, 1004, '2025-09-01', '2025-10-26', '2025-10-06', 0.00);

-- QUERIES
select title, fname, lname, nationality
from book b inner join borrowing br on b.bookID = br.bookID
inner join member m on m.memberID = br.memberID
order by nationality desc;

select fname as first_name, lname as last_name, membershipDate
from book b join borrowing br on b.bookID = br.bookID join member m on m.memberID = br.memberID;

select title as book_title, author, publisher
from book 
where category in ('AI' , 'CS') 
group by title, author, publisher
having count(*) > 4;

select title as book_title
from book b join borrowing br on b.bookID = br.bookID
join member m on m.memberID = br.memberID
where m.nationality = 'saudi';

select fineAmount 
from member m inner join borrowing br on m.memberID = br.memberID
where returnDate is null;