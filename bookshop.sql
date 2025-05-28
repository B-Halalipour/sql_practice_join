-- books associated with the author
SELECT books.title, authors.author_name
FROM books
JOIN authors ON books.author_id = authors.author_id;

-- authors not associated with books

SELECT authors.author_name
FROM authors
LEFT JOIN books on books.author_id = authors.author_id
WHERE books.author_id IS NULL;
