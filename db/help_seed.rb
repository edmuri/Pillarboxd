def seed_manually
    ##########################################################################################
    ### MANUALLY POPULATING DATA AFTER API TO HAVE PRELOADED DATA ###
    ##########################################################################################

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

    ############################################
    #############    REVIEWS   #################
    ############################################
    game = Game.where("title LIKE ?", "%Pokemon%").first
    user = User.where("username LIKE ?", "emuri").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 11, 29),
        rating: 5,
        review_text: "Totally awesome!",
    )

    game = Game.where("title LIKE ?", "%Antioma%").first
    user = User.where("username LIKE ?", "emuri").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 29),
        rating: 4,
        review_text: "Pretty Decent",
    )

    game = Game.where("title LIKE ?", "%Chi%").first
    user = User.where("username LIKE ?", "emuri").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 20),
        rating: 1,
        review_text: "Horrible!",
    )

        game = Game.where("title LIKE ?", "%Doofus%").first
    user = User.where("username LIKE ?", "emuri").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 25),
        rating: 2,
        review_text: "Suuuuper Boring",
    )

        game = Game.where("title LIKE ?", "%Cuckoo Castle%").first
    user = User.where("username LIKE ?", "emuri").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 31),
        rating: 4,
        review_text: "Pretty Decent",
    )

    game = Game.where("title LIKE ?", "%Duet%").first
    user = User.where("username LIKE ?", "emuri").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 29),
        rating: 4,
        review_text: "Pretty Decent",
    )

    game = Game.where("title LIKE ?", "%FarmingCat%").first
    user = User.where("username LIKE ?", "emuri").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 09, 29),
        rating: 5,
        review_text: "Love this game!",
    )

    game = Game.where("title LIKE ?", "%Gardener%").first
    user = User.where("username LIKE ?", "emuri").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 29),
        rating: 5,
        review_text: "Sooo good",
    )

    game = Game.where("title LIKE ?", "%Harmagedon%").first
    user = User.where("username LIKE ?", "emuri").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 10, 31),
        rating: 5,
        review_text: "So creepy!",
    )

    game = Game.where("title LIKE ?", "%Sonic%").first
    user = User.where("username LIKE ?", "emuri").first
    review = game.reviews.create!(
        user: user,
        review_date: Date.new(2025, 08, 29),
        rating: 2,
        review_text: "Meh",
    )
end