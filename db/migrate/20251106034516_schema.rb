class Schema < ActiveRecord::Migration[8.1]
    def change
    execute <<~SQL
        CREATE TABLE IF NOT EXISTS Games(
            game_id INT NOT NULL AUTO_INCREMENT,
            title VARCHAR(255),
            release_date DATETIME,
            summary TEXT,
            cover_url VARCHAR(255),
            PRIMARY KEY (game_id)
        );
    SQL

    execute <<~SQL
        CREATE TABLE IF NOT EXISTS Users(
            user_id INT NOT NULL AUTO_INCREMENT,
            username VARCHAR(50),
            email VARCHAR(100),
            password_hash VARCHAR(255),
            join_date DATETIME,
            bio VARCHAR(500),
            UNIQUE (username),
            UNIQUE (email),
            PRIMARY KEY (user_id)
        );
    SQL

    execute <<~SQL
        CREATE TABLE IF NOT EXISTS GameUsers(
            game_id INT,
            user_id INT,
            FOREIGN KEY (game_id) REFERENCES Games(game_id),
            FOREIGN KEY (user_id) REFERENCES Users(user_id),
            CONSTRAINT game_users PRIMARY KEY (game_id, user_id)
        );
    SQL

    execute <<~SQL
        CREATE TABLE IF NOT EXISTS Developers(
            developer_id INT NOT NULL AUTO_INCREMENT,
            name VARCHAR(100),
            country VARCHAR(100),
            website VARCHAR(100),
            PRIMARY KEY (developer_id)
        );
    SQL

    execute <<~SQL
        CREATE TABLE IF NOT EXISTS GameDevelopers(
            game_id INT,
            developer_id INT,
            FOREIGN KEY (game_id) REFERENCES Games(game_id),
            FOREIGN KEY (developer_id) REFERENCES Developers(developer_id),
            CONSTRAINT game_developers PRIMARY KEY (game_id, developer_id)
        );
    SQL

    execute <<~SQL
        CREATE TABLE IF NOT EXISTS Publishers(
            publisher_id INT NOT NULL AUTO_INCREMENT,
            name VARCHAR(100),
            country VARCHAR(100),
            website VARCHAR(100),
            PRIMARY KEY (publisher_id)
        );
    SQL

    execute <<~SQL
        CREATE TABLE IF NOT EXISTS GamePublishers(
            game_id INT,
            publisher_id INT,
            FOREIGN KEY (game_id) REFERENCES Games(game_id),
            FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id),
            CONSTRAINT game_publishers PRIMARY KEY (game_id, publisher_id)
        );
    SQL

    execute <<~SQL
        CREATE TABLE IF NOT EXISTS Genres(
            genre_id INT NOT NULL AUTO_INCREMENT,
            name VARCHAR(100),
            description VARCHAR(255),
            PRIMARY KEY (genre_id)
        );
    SQL

    execute <<~SQL
        CREATE TABLE IF NOT EXISTS GameGenres(
            game_id INT,
            genre_id INT,
            FOREIGN KEY (game_id) REFERENCES Games(game_id),
            FOREIGN KEY (genre_id) REFERENCES Genres(genre_id),
            CONSTRAINT game_genres PRIMARY KEY (game_id, genre_id)
        );
    SQL

    execute <<~SQL
        CREATE TABLE IF NOT EXISTS Lists(
            list_id INT NOT NULL AUTO_INCREMENT,
            user_id INT,
            title VARCHAR(150),
            description TEXT,
            is_public BOOLEAN,
            is_backlog BOOLEAN,
            created_at DATETIME,
            PRIMARY KEY (list_id),
            FOREIGN KEY (user_id) REFERENCES Users(user_id)
        );
    SQL

    execute <<~SQL
        CREATE TABLE IF NOT EXISTS ListEntries(
            list_id INT,
            game_id INT,
            sort_order INT,
            added_at DATETIME,
            FOREIGN KEY (list_id) REFERENCES Lists(list_id),
            FOREIGN KEY (game_id) REFERENCES Games(game_id),
            CONSTRAINT game_lists PRIMARY KEY (game_id, list_id)
        );
    SQL

    execute <<~SQL
        CREATE TABLE IF NOT EXISTS SocialGraph(
            follower_id INT NOT NULL,
            followed_id INT NOT NULL,
            created_at DATETIME,
            FOREIGN KEY (follower_id) REFERENCES Users(user_id),
            FOREIGN KEY (followed_id) REFERENCES Users(user_id),
            CONSTRAINT social PRIMARY KEY (follower_id, followed_id)
        );
    SQL

    execute <<~SQL
        CREATE TABLE IF NOT EXISTS Platforms(
            platform_id INT NOT NULL AUTO_INCREMENT,
            name VARCHAR(100),
            manufacturer VARCHAR(100),
            PRIMARY KEY (platform_id)
        );
    SQL

    execute <<~SQL
        CREATE TABLE IF NOT EXISTS GamePlatforms(
            game_id INT,
            platform_id INT,
            FOREIGN KEY (game_id) REFERENCES Games(game_id),
            FOREIGN KEY (platform_id) REFERENCES Platforms(platform_id),
            CONSTRAINT game_platforms PRIMARY KEY (game_id, platform_id)
        );
    SQL

    execute <<~SQL
        CREATE TABLE IF NOT EXISTS Logs(
            log_id INT NOT NULL AUTO_INCREMENT,
            user_id INT NOT NULL,
            game_id INT NOT NULL,
            play_date DATE,
            is_completed BOOLEAN,
            platform_played_id INT,
            FOREIGN KEY (user_id) REFERENCES Users(user_id),
            FOREIGN KEY (game_id) REFERENCES Games(game_id),
            FOREIGN KEY (platform_played_id) REFERENCES Platforms(platform_id),
            PRIMARY KEY (log_id)
        );
    SQL

    execute <<~SQL
        CREATE TABLE IF NOT EXISTS Reviews(
            review_id INT NOT NULL AUTO_INCREMENT,
            user_id INT NOT NULL,
            game_id INT NOT NULL,
            rating DECIMAL,
            review_text TEXT,
            review_date DATE,
            FOREIGN KEY (user_id) REFERENCES Users(user_id),
            FOREIGN KEY (game_id) REFERENCES Games(game_id),
            CONSTRAINT unique_review UNIQUE (user_id, game_id),
            PRIMARY KEY (review_id)
        );
    SQL
    end
end
