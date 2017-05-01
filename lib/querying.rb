def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year FROM books
   JOIN character_books ON character_books.book_id = books.id
   JOIN characters ON character_books.character_id = authors.id
   JOIN authors ON characters.author_id = authors.id
   JOIN series ON series.author_id = authors.id
   GROUP BY books.year"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto FROM characters
   ORDER BY motto ASC LIMIT 1"
end

def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species) FROM characters
   GROUP BY species ORDER BY COUNT(species) DESC LIMIT 1"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name FROM authors
   JOIN series ON series.author_id = authors.id
   JOIN subgenres ON subgenres.id = series.subgenre_id
   GROUP BY authors.name"
end

def select_series_title_with_most_human_characters
  "SELECT series.title FROM series
   JOIN authors ON authors.id = series.author_id
   JOIN characters ON characters.author_id = authors.id
   GROUP BY characters.species
   ORDER BY COUNT(characters.species) LIMIT 1"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(book_id) AS number_of_books FROM characters
   JOIN character_books ON characters.id = character_books.character_id
   GROUP BY characters.name
   ORDER BY COUNT(book_id) DESC"
end
