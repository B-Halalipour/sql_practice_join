SELECT books.title, authors.author_name
FROM books
JOIN authors ON books.author_id = authors.author_id;
