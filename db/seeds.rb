# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

dramas = [
    {name: "Goblin", genre: "Comedy, Romance, Fantasy, Melodrama, Supernatural"},
    {name: "Its Okay, thats Love", genre: "Friendship, Psychological, Comedy, Romance, Drama"},
    {name: "Its Okay to Not be Okay", genre: "Psychological, Comedy, Romance, Drama, Family"},
    {name: "Start-Up", genre: "Business, Comedy, Romance, Youth, Drama"},
    {name: "Secret", genre: "Romance, Drama, Melodrama"},
    {name: "Secret Garden", genre: "Comedy, Romance, Drama, Melodrama, Supernatural"},
    {name: "Flower of Evil", genre: "Thriller, Mystery, Psychological, Romance, Crime, Melodrama"},
    {name: "Strong Woman Do Bong Soon", genre: "Action, Thriller, Comedy, Romance, Drama, Supernatural"},
    {name: "W", genre: "Action, Suspense, Thriller, Comedy, Romance, Drama, Fantasy, Melodrama"},
    {name: "Pinocchio", genre: "Thriller, Mystery, Comedy, Romance, Melodrama"},
    {name: "Healer", genre: "Action, Thriller, Mystery, Comedy, Romance, Drama"},
    {name: "While You were Sleeping", genre: "Thriller, Mystery, Comedy, Romance, Drama, Fantasy"},
    {name: "The Smile has Left your Eye", genre: "Thriller, Mystery, Romance, Drama"},
    {name: "Kill me, Heal me", genre: "Psychological, Comedy, Romance, Drama"},
    {name: "I'm not a robot", genre: "Friendship, Comedy, Romance, Drama, Sci-Fi"},
    {name: "The Beauty inside", genre: "Comedy, Romance, Family, Melodrama, Supernatural"},
    {name: "Angel's last mission: Love", genre: "Comedy, Romance, Drama, Fantasy"},
    {name: "King: Eternal Monarch", genre:  "Mystery, Romance, Drama, Fantasy"},
    {name: "My Girlfriend is a Gumhiho", genre: "Comedy, Romance, Drama, Fantasy, Supernatural"},
    {name: "Tale of the Nine-Tailed", genre: "Action, Suspense, Thriller, Horror, Romance, Fantasy"},
    {name: "Weightlifting Fairy Kim Bok Joo", genre: "Friendship, Comedy, Romance, School, Youth, Sports"},
    {name: "Boys over Flowers", genre: "Friendship, Comedy, Romance, School, Youth, Drama"},
    {name: "What's Wrong with Secretary Kim", genre: "Friendship, Business, Comedy, Romance"},
    {name: "Cheese in the Trap", genre: "Friendship, Psychological, Romance, Life, Drama"},
    {name: "Dream High", genre: "Friendship, Music, Comedy, Romance, School, Drama"},
    {name: "Oh My Venus", genre: "Friendship, Comedy, Law, Romance, Life, Drama, Sports"}
 ]

dramas.each do |drama|
    Drama.create drama 
end
