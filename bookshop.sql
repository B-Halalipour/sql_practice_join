-- books associated with the author
SELECT books.title, authors.author_name
FROM books
JOIN authors ON books.author_id = authors.author_id;

-- authors not associated with books

SELECT authors.author_name
FROM authors
LEFT JOIN books on books.author_id = authors.author_id
WHERE books.author_id IS NULL;

-- List all genres that a certain book belongs to

SELECT books.title, genres.genre
FROM books
JOIN book_genres ON book_genres.book_genre_id = books.book_id
JOIN genres ON book_genres.genre_id = genres.genre_id
WHERE books.title = 'Emma';
 
--  List all the books belonging to a certain genre

SELECT genres.genre, books.title
FROM genres
JOIN book_genres ON genres.genre_id = book_genres.genre_id
JOIN books ON book_genres.book_id = books.book_id
WHERE genres.genre = 'romance'