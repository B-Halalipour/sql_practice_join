
\c my_bookshop
DROP TABLE IF EXISTS book_genres;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS authors;


CREATE TABLE  authors (
    author_id SERIAL PRIMARY KEY,
    author_name TEXT,
    fun_fact TEXT
);

INSERT INTO authors
(author_name, fun_fact)
VALUES
('Dan Brown', 'Favourite colour is not brown'),
('Antoine de Saint-Exupéry', 'He was a successful commercial pilot before World War II, working airmail routes in Europe, Africa, and South America.'),
('Douglas Adams', 'He made two appearances in Monty Python''s Flying Circus'),
('Stephen Hawking','Doctors told him he wouldn''t live past his early 20s' ),
('Eric Carle', 'When he was a young boy, Carle had a dream that he would build a bridge from Germany to America.'),
('J. D. Salinger', 'The Catcher in the Rye was the only novel that J.D. Salinger published during his lifetime, not bad for a first try!'),
('Beatrix Potter','Between 1881 and 1897 Potter kept a journal in which she jotted down her private thoughts in a secret code . This code was so fiendishly difficult it was not cracked and translated until 1958.'),
('C. S. Lewis', 'Lewis set up a charitable trust to give away whatever money he received from his books.'),
('Roald Dahl', 'During World War II he passed intelligence to MI6 from Washington.'),
('Frank Herbert', 'While conversing with fungi expert Paul Stamets, Herbert revealed that the world of Dune was influenced by the lifecycle of mushrooms, with his imagination being helped along by a more "magic" variety.'),
('Louis de Bernières', 'De Bernières is an avid musician who plays flute, mandolin, clarinet and guitar.'),
('H. G. Wells', 'In 1914 H.G. Wells published a novel titled The World Set Free. In this book he described a weapon that was eerily similar to the first atomic bomb unleashed on the Japanese cities of Hiroshima and Nagasaki in 1945.'),
('George Orwell', 'Orwell intentionally got himself arrested for being "drunk and incapable."'),
('Jane Austen', 'The author of her first novel, Sense and Sensibility was simply "A Lady," and her later works like Pride and Prejudice were credited to "the Author of Sense and Sensibility." She wasn''t named as the author of her novels until after her death!'),
('Margaret Atwood', 'Atwood was the first author to contribute to The Future Library Project, which will take one writer''s contribution each year for one hundred years to be printed in the year 2114.');


CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(200),
    price NUMERIC(7,2),
    quantity_in_stock INT,
    release_date DATE,
    is_fiction BOOLEAN,
    author_id INT REFERENCES authors(author_id)
);
    
INSERT INTO books 
(title, price, quantity_in_stock, release_date, is_fiction, author_id)
VALUES
('The Hitchhiker''s Guide to the Galaxy', 8.99, 560, '1997-10-12', TRUE, 3),
('The Little Prince', 6.99, 1020, '1943-04-06', TRUE, 2),
('The Tale of Peter Rabbit', 5.99, 1000, '1902-10-01', TRUE, 7),
('Emma', 5.22, 390, '1815,12,23', TRUE, 14), 
('Nineteen Eighty-Four: A Novel', 7.99, 420, '1949-06-08', TRUE, 13),
('The Handmaid''s Tale', 8.99, 10, '1985-08-01', TRUE, 15),
('The War of the Worlds', 2.50, 17, '1897-04-1', TRUE, 12),
('Captain Corelli''s Mandolin', 9.99, 0, '1995-08-29', TRUE, 11),
('A Brief History of Time', 8.25, 0, '1988-04-01', FALSE, 4),
('Pride and Prejudice', 6.99, 4, '1813-01-28', TRUE, 14);


CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    genre VARCHAR(100)
);

INSERT INTO genres 
(genre)
VALUES
('science fiction'),
('children''s'),
('romance'),
('fantasy'),
('dystopian'),
('science'),
('adventure'),
('classics');

CREATE TABLE book_genres (
    book_genre_id SERIAL PRIMARY KEY,
    book_id INT REFERENCES books(book_id),
    genre_id INT REFERENCES genres(genre_id)
);

INSERT INTO book_genres (
    book_id, genre_id
)
VALUES
(1, 1),  -- The Hitchhiker's Guide to the Galaxy - science fiction
(1, 4),  -- The Hitchhiker's Guide to the Galaxy - fantasy
(2, 2),  -- The Little Prince - children's
(2, 7),  -- The Little Prince - adventure
(5, 1),  -- Nineteen Eighty-Four - science fiction
(5, 5),  -- Nineteen Eighty-Four - dystopian
(6, 5),  -- The Handmaid's Tale - dystopian
(7, 1),  -- The War of the Worlds - science fiction
(7, 7),  -- The War of the Worlds - adventure
(10, 3), -- Pride and Prejudice - romance
(10, 8); -- Pride and Prejudice - classics