;; ==========================================================
;; CHALLENGE 6: Movie Search Engine (MeTTa + Python)
;; ----------------------------------------------------------
;; TASK:
;; 1. Create a MeTTa file named 'database.metta'.
;; 2. Populate it with at least 5 movie facts using the format:
;;    (Movie <name> <year>)
;;    Example: (Movie Inception 2010)
;;
;; 3. Write a Python script that:
;;    - Loads 'database.metta' into a MeTTa space.
;;    - Prompts the user to type a year.
;;    - Queries the space and prints all movies released in that year.
;;
;; GOAL: 
;; Understand how to use MeTTa as a knowledge store for 
;; external applications.
from hyperon import MeTTa


metta = MeTTa()

# Load the MeTTa database
metta.run('''
    !(load-file! "database.metta")
''')


def search_movies(year):
    query = f'''
        !(match &self (Movie $movie {year}) $movie)
    '''

    results = metta.run(query)

    return [str(result) for result in results]


print("======================================")
print("       METTA MOVIE SEARCH ENGINE")
print("======================================")

year = input("Enter movie release year: ")

movies = search_movies(year)

if movies:
    print(f"\nMovies released in {year}:")
    print("--------------------------------------")

    for movie in movies:
        print(f"- {movie}")
else:
    print(f"\nNo movies found for {year}.")

print("\nSearch completed.")
