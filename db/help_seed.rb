#################################################################
### MANUALLY POPULATING DATA AFTER API TO HAVE PRELOADED DATA ###
#################################################################

def seed_manually
    create_users
    create_logs
    create_reviews
end

def create_users
    ############################################
    #############      USERS   #################
    ############################################
    User.find_or_create_by!(email: "admin@gmail.com") do |u|
        u.username="admin"
        u.password = "password123"
        u.password_confirmation = "password123"
        u.join_date = Time.current
    end

    User.find_or_create_by!(email: "emuri@uic.com") do |u|
        u.username = "emuri"
        u.password = "password123"
        u.password_confirmation = "password123"
        u.join_date = Time.current
    end

    User.find_or_create_by!(email: "emuri@gmail.com") do |u|
        u.username="emuri1"
        u.password = "password123"
        u.password_confirmation = "password123"
        u.join_date = Time.current
    end

    User.find_or_create_by!(email: "jpenn@gmail.com") do |u|
        u.username="jpenn"
        u.password = "password123"
        u.password_confirmation = "password123"
        u.join_date = Time.current
    end

    User.find_or_create_by!(email: "cvarn@gmail.com") do |u|
        u.username="cvarn"
        u.password = "password123"
        u.password_confirmation = "password123"
        u.join_date = Time.current
    end

    User.find_or_create_by!(email: "jgodf@gmail.com") do |u|
        u.username="jgodf"
        u.password = "password123"
        u.password_confirmation = "password123"
        u.join_date = Time.current
    end

    User.find_or_create_by!(email: "jbowma@gmail.com") do |u|
        u.username="jbowma"
        u.password = "password123"
        u.password_confirmation = "password123"
        u.join_date = Time.current
    end

    User.find_or_create_by!(email: "btion@gmail.com") do |u|
        u.username="btion"
        u.password = "password123"
        u.password_confirmation = "password123"
        u.join_date = Time.current
    end

    User.find_or_create_by!(email: "jcarm@gmail.com") do |u|
        u.username="jcarm"
        u.password = "password123"
        u.password_confirmation = "password123"
        u.join_date = Time.current
    end

end

def create_logs
    ############################################
    #############      LOGS    #################
    ############################################
    game = Game.where("title LIKE ?", "%Pokemon%").first
    user = User.where("username LIKE ?", "emuri").first
    user_id = user.user_id

    log_game = game.logs.create!(
        user_id: user_id,
        play_date: Date.new(2025, 11, 29),
        is_completed: true
    )

    game = Game.where("title LIKE ?", "%Sonic%").first
    user = User.where("username LIKE ?", "emuri").first
    user_id = user.user_id

    log_game = game.logs.create!(
        user_id: user_id,
        play_date: Date.new(2025, 11, 29),
        is_completed: true
    )

    game = Game.where("title LIKE ?", "%Antioma%").first
    user = User.where("username LIKE ?", "emuri").first
    log_game = game.logs.create!(
        user_id: user_id,
        play_date: Date.new(2025, 11, 29),
        is_completed: true
    )

    game = Game.where("title LIKE ?", "%Antioma%").first
    user = User.where("username LIKE ?", "emuri1").first
    log_game = game.logs.create!(
        user_id: user_id,
        play_date: Date.new(2025, 11, 29),
        is_completed: true
    )

    game = Game.where("title LIKE ?", "%Antioma%").first
    user = User.where("username LIKE ?", "jpenn").first
    log_game = game.logs.create!(
        user_id: user_id,
        play_date: Date.new(2025, 11, 29),
        is_completed: true
    )

    game = Game.where("title LIKE ?", "%Antioma%").first
    user = User.where("username LIKE ?", "btion").first
    log_game = game.logs.create!(
        user_id: user_id,
        play_date: Date.new(2025, 11, 29),
        is_completed: true
    )

    game = Game.where("title LIKE ?", "%mi%").first
    user = User.where("username LIKE ?", "btion").first
    log_game = game.logs.create!(
        user_id: user_id,
        play_date: Date.new(2024, 4, 1),
        is_completed: true
    )

    game = Game.where("title LIKE ?", "%%").first
    user = User.where("username LIKE ?", "btion").first
    log_game = game.logs.create!(
        user_id: user_id,
        play_date: Date.new(2024, 4, 1),
        is_completed: true
    )

end

def create_reviews
    ############################################
    #############    REVIEWS   #################
    ############################################
    game = Game.where("title LIKE ?", "%Pokemon%").first
    user = User.where("username LIKE ?", "emuri").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 11, 29),
        rating: 5,
        review_text: "Totally awesome!"
    )

    game = Game.where("title LIKE ?", "%Antioma%").first
    user = User.where("username LIKE ?", "emuri").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 29),
        rating: 4,
        review_text: "Pretty Decent"
    )

    game = Game.where("title LIKE ?", "%Art Together%").first
    user = User.where("username LIKE ?", "emuri").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 20),
        rating: 1,
        review_text: "Horrible!"
    )

    game = Game.where("title LIKE ?", "%Doofas%").first
    user = User.where("username LIKE ?", "emuri").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 25),
        rating: 2,
        review_text: "Suuuuper Boring"
    )

    game = Game.where("title LIKE ?", "%Cuckoo Castle%").first
    user = User.where("username LIKE ?", "emuri").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 31),
        rating: 4,
        review_text: "Pretty Decent"
    )

    game = Game.where("title LIKE ?", "%Duet%").first
    user = User.where("username LIKE ?", "emuri").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 29),
        rating: 4,
        review_text: "Pretty Decent"
    )

    game = Game.where("title LIKE ?", "%FarmingCat%").first
    user = User.where("username LIKE ?", "emuri").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 9, 29),
        rating: 5,
        review_text: "Love this game!"
    )

    game = Game.where("title LIKE ?", "%Gardener%").first
    user = User.where("username LIKE ?", "emuri").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 29),
        rating: 5,
        review_text: "Sooo good"
    )

    game = Game.where("title LIKE ?", "%Harmagedon%").first
    user = User.where("username LIKE ?", "emuri").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 31),
        rating: 5,
        review_text: "So creepy!"
    )

    game = Game.where("title LIKE ?", "%Sonic%").first
    user = User.where("username LIKE ?", "emuri").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 8, 29),
        rating: 2,
        review_text: "Meh"
    )

    # Reviews for jpenn
    game = Game.where("title LIKE ?", "%Pokemon%").first
    user = User.where("username LIKE ?", "jpenn").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 11, 29),
        rating: 5,
        review_text: "Totally awesome!"
    )

    game = Game.where("title LIKE ?", "%Antioma%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 29),
        rating: 4,
        review_text: "Pretty Decent"
    )

    game = Game.where("title LIKE ?", "%Art Together%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 20),
        rating: 1,
        review_text: "Horrible!"
    )

    game = Game.where("title LIKE ?", "%Doofas%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 25),
        rating: 2,
        review_text: "Suuuuper Boring"
    )

    game = Game.where("title LIKE ?", "%Cuckoo Castle%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 31),
        rating: 4,
        review_text: "Pretty Decent"
    )

    game = Game.where("title LIKE ?", "%Duet%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 29),
        rating: 4,
        review_text: "Pretty Decent"
    )

    game = Game.where("title LIKE ?", "%FarmingCat%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 9, 29),
        rating: 5,
        review_text: "Love this game!"
    )

    game = Game.where("title LIKE ?", "%Gardener%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 29),
        rating: 5,
        review_text: "Sooo good"
    )

    game = Game.where("title LIKE ?", "%Harmagedon%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 31),
        rating: 5,
        review_text: "So creepy!"
    )

    game = Game.where("title LIKE ?", "%Sonic%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 8, 29),
        rating: 2,
        review_text: "Meh"
    )

    # Reviews for jcarm
    game = Game.where("title LIKE ?", "%Pokemon%").first
    user = User.where("username LIKE ?", "jcarm").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 11, 29),
        rating: 5,
        review_text: "Totally awesome!"
    )

    game = Game.where("title LIKE ?", "%Antioma%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 29),
        rating: 4,
        review_text: "Pretty Decent"
    )

    game = Game.where("title LIKE ?", "%Art Together%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 20),
        rating: 1,
        review_text: "Horrible!"
    )

    game = Game.where("title LIKE ?", "%Doofas%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 25),
        rating: 2,
        review_text: "Suuuuper Boring"
    )

    game = Game.where("title LIKE ?", "%Cuckoo Castle%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 31),
        rating: 4,
        review_text: "Pretty Decent"
    )

    game = Game.where("title LIKE ?", "%Duet%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 29),
        rating: 4,
        review_text: "Pretty Decent"
    )

    game = Game.where("title LIKE ?", "%FarmingCat%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 9, 29),
        rating: 5,
        review_text: "Love this game!"
    )

    game = Game.where("title LIKE ?", "%Gardener%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 29),
        rating: 5,
        review_text: "Sooo good"
    )

    game = Game.where("title LIKE ?", "%Harmagedon%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 31),
        rating: 5,
        review_text: "So creepy!"
    )

    game = Game.where("title LIKE ?", "%Sonic%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 8, 29),
        rating: 2,
        review_text: "Meh"
    )

    # Reviews for jbowma
    game = Game.where("title LIKE ?", "%Pokemon%").first
    user = User.where("username LIKE ?", "jbowma").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 11, 29),
        rating: 5,
        review_text: "Totally awesome!"
    )

    game = Game.where("title LIKE ?", "%Antioma%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 29),
        rating: 4,
        review_text: "Pretty Decent"
    )

    game = Game.where("title LIKE ?", "%Art Together%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 20),
        rating: 1,
        review_text: "Horrible!"
    )

    game = Game.where("title LIKE ?", "%Doofas%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 25),
        rating: 2,
        review_text: "Suuuuper Boring"
    )

    game = Game.where("title LIKE ?", "%Cuckoo Castle%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 31),
        rating: 4,
        review_text: "Pretty Decent"
    )

    game = Game.where("title LIKE ?", "%Duet%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 29),
        rating: 4,
        review_text: "Pretty Decent"
    )

    game = Game.where("title LIKE ?", "%FarmingCat%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 9, 29),
        rating: 5,
        review_text: "Love this game!"
    )

    game = Game.where("title LIKE ?", "%Gardener%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 29),
        rating: 5,
        review_text: "Sooo good"
    )

    game = Game.where("title LIKE ?", "%Harmagedon%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 31),
        rating: 5,
        review_text: "So creepy!"
    )

    game = Game.where("title LIKE ?", "%Sonic%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 8, 29),
        rating: 2,
        review_text: "Meh"
    )

    # Reviews for cvarn
    game = Game.where("title LIKE ?", "%Pokemon%").first
    user = User.where("username LIKE ?", "cvarn").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 11, 29),
        rating: 5,
        review_text: "Totally awesome!"
    )

    game = Game.where("title LIKE ?", "%Antioma%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 29),
        rating: 4,
        review_text: "Pretty Decent"
    )

    game = Game.where("title LIKE ?", "%Art Together%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 20),
        rating: 1,
        review_text: "Horrible!"
    )

    game = Game.where("title LIKE ?", "%Doofas%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 25),
        rating: 2,
        review_text: "Suuuuper Boring"
    )

    game = Game.where("title LIKE ?", "%Cuckoo Castle%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 31),
        rating: 4,
        review_text: "Pretty Decent"
    )

    game = Game.where("title LIKE ?", "%Duet%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 29),
        rating: 4,
        review_text: "Pretty Decent"
    )

    game = Game.where("title LIKE ?", "%FarmingCat%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 9, 29),
        rating: 5,
        review_text: "Love this game!"
    )

    game = Game.where("title LIKE ?", "%Gardener%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 29),
        rating: 5,
        review_text: "Sooo good"
    )

    game = Game.where("title LIKE ?", "%Harmagedon%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 31),
        rating: 5,
        review_text: "So creepy!"
    )

    game = Game.where("title LIKE ?", "%Sonic%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 8, 29),
        rating: 2,
        review_text: "Meh"
    )

    # Reviews for emuri1
    game = Game.where("title LIKE ?", "%Pokemon%").first
    user = User.where("username LIKE ?", "emuri1").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 11, 29),
        rating: 5,
        review_text: "Totally awesome!"
    )

    game = Game.where("title LIKE ?", "%Antioma%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 29),
        rating: 4,
        review_text: "Pretty Decent"
    )

    game = Game.where("title LIKE ?", "%Art Together%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 20),
        rating: 1,
        review_text: "Horrible!"
    )

    game = Game.where("title LIKE ?", "%Doofas%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 25),
        rating: 2,
        review_text: "Suuuuper Boring"
    )

    game = Game.where("title LIKE ?", "%Cuckoo Castle%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 31),
        rating: 4,
        review_text: "Pretty Decent"
    )

    game = Game.where("title LIKE ?", "%Duet%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 29),
        rating: 4,
        review_text: "Pretty Decent"
    )

    game = Game.where("title LIKE ?", "%FarmingCat%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 9, 29),
        rating: 5,
        review_text: "Love this game!"
    )

    game = Game.where("title LIKE ?", "%Gardener%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 29),
        rating: 5,
        review_text: "Sooo good"
    )

    game = Game.where("title LIKE ?", "%Harmagedon%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 31),
        rating: 5,
        review_text: "So creepy!"
    )

    game = Game.where("title LIKE ?", "%Sonic%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 8, 29),
        rating: 2,
        review_text: "Meh"
    )

    game = Game.where("title LIKE ?", "%10 Games%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2022, 3, 29),
        rating: 4,
        review_text: "old-school and nostalgic"
    )

    game = Game.where("title LIKE ?", "%Aaero%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2022, 1, 7),
        rating: 4,
        review_text: "god this game looks visually amazing and the game is not easy lol"
    )

    game = Game.where("title LIKE ?", "%A Bright Light in the Middle of the Ocean%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2022, 3, 29),
        rating: 2,
        review_text: "yea it looks pretty, except the FOV is so low it made me nauseous. right now i feel like im gonna puke i think i need to go for a walk and rest my eyes i only played for like 5 minutes but yea. is the fov set to like 70 or something? i think it should be at least 90"
    )

    game = Game.where("title LIKE ?", "%100 Barcelona Cats%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2022, 9, 20),
        rating: 3,
        review_text: "missed opportunity to call it barcemeowna"
    )

    game = Game.where("title LIKE ?", "%1112: Episode 02%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2024, 8, 29),
        rating: 5,
        review_text: "soooo spooky"
    )

    game = Game.where("title LIKE ?", "%5-in-1 Pack: Monument Builders - Destination USA %").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2022, 3, 29),
        rating: 1,
        review_text: "The Dev's need to patch this game and fix the freezing issue during the game play Needed Attention and URGENT UPDATE not sit and eat donuts like homer simpson reading this and saying DOH with a crayon up your nose"
    )

    game = Game.where("title LIKE ?", "%A Gummy's Life%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 4, 12),
        rating: 5,
        review_text: "Make the game free and add Skins to pay (i wouldve pay and a lot of other players im sure)
if you do that, you will get so many players and so much more money etc."
    )

    game = Game.where("title LIKE ?", "%A Week of Garfield: Garfield no Isshukan%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2024, 4, 12),
        rating: 1,
        review_text: "There's absolutely no reason to play, or replay, A Week in Garfield. It is one of the worst video games I have ever played, which is an absolute shame, because the Garfield license should have been used a lot better."
    )

    game = Game.where("title LIKE ?", "%Abyssal Blade%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 11, 15),
        rating: 4,
        review_text: "It delivers what it promises and ups the difficulty by forcing you to master fights and deal damage more optimally rather than throw more at you."
    )

    game = Game.where("title LIKE ?", "%Ace wo Nerae!%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2024, 8, 29),
        rating: 3,
        review_text: "it's a very fun game"
    )

    game = Game.where("title LIKE ?", "%Admiral: Sea Battles%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2023, 8, 29),
        rating: 2,
        review_text: "Deadly slow pacing, overly difficult missions, no individual scenarios (you must play campaigns), mystifying approaches to victory, and frankly, lean gameplay (you do little more than click to move and click to fire) make this one a non-starter. "
    )

    game = Game.where("title LIKE ?", "%AI Shogi Selection%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2021, 5, 3),
        rating: 2,
        review_text: "it's aight"
    )

    game = Game.where("title LIKE ?", "%Ace wo Nerae!%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2024, 2, 23),
        rating: 1,
        review_text: "For all the sake of humanity, do not play Aidyn Chronicles."
    )

    game = Game.where("title LIKE ?", "%Alive 2 Survive%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2020, 8, 3),
        rating: 1,
        review_text: "Its terrible i have contacted developers with a problems and they didnt do anything. its just broken. the worst game ever"
    )

    game = Game.where("title LIKE ?", "%Another Way of Gettin' Paid%").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2021, 5, 3),
        rating: 2,
        review_text: "it's aight"
    )

end