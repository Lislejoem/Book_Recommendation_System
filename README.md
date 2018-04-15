# Simple Book Recommendation System
A [simple book recommendation system](https://lislejoem.shinyapps.io/Book_Recommender_System/) based on the [goodbooks-10k dataset from Zygmuntz](https://github.com/zygmuntz/goodbooks-10k).

# Purpose of Creating the App
- Most recommendation systems for books that I've seen require a lot of input (usually ratings). Though these systems are incredibly smart and usually employ ML algorithms, I wanted to create something simple that allows for maximum benefit from minimal data entry.
- I wanted to explore recommendation systems and building web applications.

# Using the App
There are two quick steps involved in using the application:
1. On the genres shelf, select a genre of books that you like and select a genre of books that you want to see.
2. On the filters shelf, filter the book recommendations based on number of ratings and publication year.

# How it Works
The app has a simple design -
- Three genres are assigned to each book (based on the most highly-used tags for a book in Goodreads) and three favorite genres are assigned to each user (based on the genres they rate the highest).
- An average rating for each book is calculated based on users' favorite genres. (i.e. The average rating of users whose favorite genre is Vampires is 3.47, while the average rating of users whose favorite genre is Historical Fiction is 3.98)
- A list of books appear in order of most highly-rated for users who like the genre you selected. Only the books whose genre is what you select will appear in the table.

# Creating the App
As this is a fairly simple recommendation system, there were only a few steps to get it up and running (after downloading the data).

### Cleaning the book tags:
1. Compile and clean the most popular book tags. I went through the most popular 300 book tags and cleaned them by hand, creating one tag for all similar tags (i.e. chick-lit, chick-literature, and chic-lit should all be the same tag). I also deleted tags such as "read", "to-read", "read-again", etc. as they did not need to exist in recommendation system.
2. Join the book tags back into the dataset and get rid of any books that don't have the new tags.
3. Limit the tags per book to only the top 3, to make the recommendations more accurate.

### Specifying Favorite Genres per User:
Given that this recommendation system bases recommendations of users who enjoy a particular genre, users must have favorite genres assigned to them. In my mind, there are two easy way to measure this:
- Favorite genres are based on quantitity of books read in those genres.
- Favorite genres are based on the quality of ratings of books read in those genres.

I chose to move forward with the second option, assigning favorite genres to each user based on the average rating of books in a particular genre. I assigned 3 favorite genres to users based on their average rating per genre, but only for genres in which they rated 10 or more books.

### Creating Filter Buckets:
As the filters that I used (publication year and number of ratings) could use a slider for selection, buckets work much better as sliding between hundreds of years and millions of ratings makes it difficult to filter exactly where one needs. The bucket parameters were arbitrarily selected, though I did try to ensure that they made sense to users and also had a similar number of books in each bucket.

### Creating a List of Average Book Ratings by Favorite Genre:
In order to make the app work more efficiently, and as there are only 10k books, I compiled a dataset of the average rating of books by users' favorite genres. The dataset simply contains each book and the average rating for each favorite user genre. 

# Further Improvement
I am no longer working on this project, as it was just a fun test to ease into recommendation systems and Shiny, but here are a list of potential ideas that could be used to make this recommendation system better:
- Clean up the genres! There are so many tags that users provide in Goodreads (thousands and thousands), but I only cleaned the top 300.
   
   Capitalizing the genres and adding spaces instead of -'s would be helpful for users.
   
   Another potential improvement could be separating out genres and subgenres. I set up the system so that the "Vampire" and "Fantasy" genres are equal, but the recommendation system might be more friendly for users if large book genres like fiction, fantasy, young adult, etc. are separated from the subgenres like "american", "vampire", or "BDSM". These could be made into subgenres, and could be applied as filters to the recommendations. This all being said, I am ignorant in the world of genres and subgenres.
- Select multiple genres on the genre shelf. Although this would have been easy to implement, it adds a level of complexity to using the recommendation system, and did not feel like committing the time to explaining it to users and getting it to work properly.
- Create a reverse look-up table, wherein a user could specify a book and information about it is provided. (I.e. the average user ratings by favorite user genres)
- Make the underlying recommendation system a bit more complex by employing ML. My idea here would be to allow users to provide their goodreads username, then a clustering algorithm takes the highest- and lowest-rated books and finds similar users. The algorithm would then spit out the highest-rated books based on similar users, and the app user could filter the results with existing and additional filters. I would add this as an option, but keep the recommendation system how it is now so that it's easy to use for users who don't have a Goodreads account.
- Link the data up to the Goodreads API. It would be wonderful if the datasource and code were refreshed once a week so that new books would appear and ratings would change over time. Some severe limitations would need to be placed on the number of books that are downloaded, but this would really increase the veracity of the recommendations.
