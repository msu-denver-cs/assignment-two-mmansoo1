# README

For assignment 2, the first step I had to take was fix my scaffolds from assignment 1. I had put my make as a field in the Car scaffold, as opposed to just creating its own scaffold. I ended up destroying my old project and rebuilding with the correct scaffolds and creating Make with country as its lone field.  

The first thing I implemented were my validations, and making sure that all the fields had a presence of true, the minimum length for country, make, model, and vin, and making sure that vin was only inputted as an integer. Afterwards, I implemented my search, which was surprisingly the easiest part. I tried to implement ajax dynamic searching, however as of now it is not working correctly, so I am still trying to figure it out. 

The thing that gave me the most trouble was running my unit tests. Originally, when I ran rails test it would give me an error saying "car was not a column in cars_parts". After I adjusted the .yml files accordingly, it gave me another error: NonNull constraint failed. I spent a few hours trying to figure out why it was not running properly. My solution for this was to change my CarsParts model and rename it to CarsPart, to follow rails convention. Luckily RubyMine replaced everything and did the correct migrations, and I was able to run my tests. What I learned (and rightly so) was that rails is very particular with its naming conventions, and sometimes the program won't run properly unless those conventions are followed.  
