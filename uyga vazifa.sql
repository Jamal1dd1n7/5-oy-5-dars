CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 1-TOPSHIRIQ 
DROP TABLE IF EXISTS authors CASCADE;

CREATE TABLE IF NOT EXISTS authors (
    author_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    bio TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO authors (first_name, last_name, bio) VALUES 
('John', 'Doe', 'John is an experienced novelist and essayist.'),
('Jane', 'Smith', 'Jane is a renowned poet and short story writer.'),
('Emily', 'Johnson', 'Emily specializes in historical fiction.');
-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- 2-TOPSHIRIQ
DROP TABLE IF EXISTS books CASCADE;

CREATE TABLE IF NOT EXISTS books(
	book_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	summary TEXT,
	published_date DATE,
	metadata JSON,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO books (title, summary, published_date, metadata) VALUES 
('The Great Adventure', 
 'A thrilling adventure book set in the wilds of Alaska.', 
 '2020-05-15', 
 '{"genre": "Adventure", "format": "Hardcover"}'),

('Poetry of the Heart', 
 'A collection of heartfelt poems about love and life.', 
 '2018-09-20', 
 '{"genre": "Poetry", "format": "Paperback"}'),

('History Unveiled', 
 'An in-depth look into ancient civilizations and their cultures.', 
 '2021-03-10', 
 '{"genre": "History", "format": "Ebook"}');
-- ---------------------------------------------------------------------------------------------------------------------------------------------

-- 3-TOPSHIRIQ
DROP TABLE IF EXISTS publishers CASCADE;

CREATE TABLE IF NOT EXISTS publishers(
	publisher_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	country CHAR(2) NOT NULL,
	founded_year INTEGER,
	details JSON,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO publishers (name, country, founded_year, details) VALUES 
('Penguin Random House', 'US', 1927, '{"genres": ["Fiction", "Non-Fiction", "Children"], "employees": 10000}'),
('HarperCollins', 'US', 1989, '{"genres": ["Fiction", "Fantasy", "Biographies"], "headquarters": "New York"}'),
('Oxford University Press', 'GB', 1586, '{"genres": ["Academic", "Education", "Reference"], "branches": ["UK", "US", "Canada"]}'),
('Shueisha', 'JP', 1925, '{"genres": ["Manga", "Literature"], "famous_works": ["Naruto", "One Piece"]}');
-- -------------------------------------------------------------------------------------------------------------------------------------------------

-- 4-TOPSHIRIQ
DROP TABLE IF EXISTS lib;

CREATE TABLE lib (
    library_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location TEXT NOT NULL,
    open_time TIME,
    close_time TIME,
    facilities JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO lib (name, location, open_time, close_time, facilities) VALUES 
('Central City Library', 
 '123 Main St, Metropolis', 
 '08:00', 
 '20:00', 
 '{"Wi-Fi": true, "study_room": true, "computer_access": true}'),
('Downtown Library', 
 '456 Elm St, Gotham', 
 '09:00', 
 '18:00', 
 '{"Wi-Fi": true, "study_room": false, "children_section": true}'),
('Community Library', 
 '789 Maple Ave, Smallville', 
 '10:00', 
 '17:00', 
 '{"Wi-Fi": false, "study_room": true, "event_space": true}');
-- -------------------------------------------------------------------------------------------------------------------------------------------------------

-- 5-TOPSHIRIQ
-- 1-topshiriq
DROP TABLE IF EXISTS author_book;

CREATE TABLE IF NOT EXISTS author_book (
    author_id UUID REFERENCES authors(author_id) ON DELETE CASCADE,
    book_id UUID REFERENCES books(book_id) ON DELETE CASCADE,
    PRIMARY KEY (author_id, book_id)  
);

SELECT * FROM author_book;

-- ---------------------------------------------------------------------------------

-- 2-topshiriq
DROP TABLE IF EXISTS book_publisher CASCADE;

CREATE TABLE IF NOT EXISTS book_publisher (
    book_id UUID REFERENCES books(book_id) ON DELETE CASCADE,
	publisher_id UUID REFERENCES publishers(publisher_id) ON DELETE CASCADE,
    PRIMARY KEY (book_id, publisher_id)
);

SELECT * FROM book_publisher;
-- ---------------------------------------------------------------------------------

-- 3-topshiriq
DROP TABLE IF EXISTS l_book CASCADE;

CREATE TABLE IF NOT EXISTS l_book (
    library_id UUID REFERENCES libraries(library_id) ON DELETE CASCADE,
	book_id UUID REFERENCES books(book_id)ON DELETE CASCADE,
    PRIMARY KEY ( library_id, book_id)
);

SELECT * FROM l_book;


































