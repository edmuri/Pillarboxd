class Schema < ActiveRecord::Migration[8.1]
    def change
        create_table :games, primary_key: :game_id, id: :integer, if_not_exists: true do |t|
        t.string :title
        t.date :release_date
        t.text :summary
        t.string :cover_url
        end

        create_table :users, primary_key: :user_id, id: :integer, if_not_exists: true do |t|
        t.string :username, limit: 50
        t.string :email, limit: 100
        t.string :password_hash
        t.datetime :join_date
        t.string :bio, limit: 500

        t.index :username, unique: true
        t.index :email, unique: true
        end

        create_table :developers, primary_key: :developer_id, id: :integer, if_not_exists: true do |t|
        t.string :name, limit: 100
        t.string :country, limit: 100
        t.string :website, limit: 100
        end

        create_table :publishers, primary_key: :publisher_id, id: :integer, if_not_exists: true do |t|
        t.string :name, limit: 100
        t.string :country, limit: 100
        t.string :website, limit: 100
        end

        create_table :genres, primary_key: :genre_id, id: :integer, if_not_exists: true do |t|
        t.string :name, limit: 100
        t.string :description
        end

        create_table :platforms, primary_key: :platform_id, id: :integer, if_not_exists: true do |t|
        t.string :name, limit: 100
        t.string :manufacturer, limit: 100
        end

        # === User-Specific Tables ===

        create_table :lists, primary_key: :list_id, id: :integer, if_not_exists: true do |t|
        t.references :user, type: :integer, null: true, foreign_key: { to_table: :users, primary_key: :user_id }
        t.string :title, limit: 150
        t.text :description
        t.boolean :is_public
        t.boolean :is_backlog
        t.datetime :created_at
        end

        create_table :logs, primary_key: :log_id, id: :integer, if_not_exists: true do |t|
        t.references :user, type: :integer, null: false, foreign_key: { to_table: :users, primary_key: :user_id }
        t.references :game, type: :integer, null: false, foreign_key: { to_table: :games, primary_key: :game_id }
        t.date :play_date
        t.boolean :is_completed

        # For foreign key with a custom column name
        t.integer :platform_played_id
        t.foreign_key :platforms, column: :platform_played_id, primary_key: :platform_id
        end

        create_table :reviews, primary_key: :review_id, id: :integer, if_not_exists: true do |t|
        t.references :user, type: :integer, null: false, foreign_key: { to_table: :users, primary_key: :user_id }
        t.references :game, type: :integer, null: false, foreign_key: { to_table: :games, primary_key: :game_id }
        t.decimal :rating
        t.text :review_text
        t.date :review_date

        t.index [ :user_id, :game_id ], unique: true, name: 'unique_review'
        end

        create_table :follows, primary_key: [ :follower_id, :followed_id ], if_not_exists: true do |t|
        t.integer :follower_id, null: false
        t.integer :followed_id, null: false
        t.datetime :created_at

        # Add foreign keys for columns that don't follow convention
        t.foreign_key :users, column: :follower_id, primary_key: :user_id
        t.foreign_key :users, column: :followed_id, primary_key: :user_id
        end

        # === Join Tables (Many-to-Many) ===

        create_table :game_users, primary_key: [ :game_id, :user_id ], if_not_exists: true do |t|
        t.references :game, type: :integer, null: false, foreign_key: { to_table: :games, primary_key: :game_id }
        t.references :user, type: :integer, null: false, foreign_key: { to_table: :users, primary_key: :user_id }
        end

        create_table :game_developers, primary_key: [ :game_id, :developer_id ], if_not_exists: true do |t|
        t.references :game, type: :integer, null: false, foreign_key: { to_table: :games, primary_key: :game_id }
        t.references :developer, type: :integer, null: false, foreign_key: { to_table: :developers, primary_key: :developer_id }
        end

        create_table :game_publishers, primary_key: [ :game_id, :publisher_id ], if_not_exists: true do |t|
        t.references :game, type: :integer, null: false, foreign_key: { to_table: :games, primary_key: :game_id }
        t.references :publisher, type: :integer, null: false, foreign_key: { to_table: :publishers, primary_key: :publisher_id }
        end

        create_table :game_genres, primary_key: [ :game_id, :genre_id ], if_not_exists: true do |t|
        t.references :game, type: :integer, null: false, foreign_key: { to_table: :games, primary_key: :game_id }
        t.references :genre, type: :integer, null: false, foreign_key: { to_table: :genres, primary_key: :genre_id }
        end

        create_table :game_platforms, primary_key: [ :game_id, :platform_id ], if_not_exists: true do |t|
        t.references :game, type: :integer, null: false, foreign_key: { to_table: :games, primary_key: :game_id }
        t.references :platform, type: :integer, null: false, foreign_key: { to_table: :platforms, primary_key: :platform_id }
        end

        create_table :list_entries, primary_key: [ :game_id, :list_id ], if_not_exists: true do |t|
        t.references :list, type: :integer, null: false, foreign_key: { to_table: :lists, primary_key: :list_id }
        t.references :game, type: :integer, null: false, foreign_key: { to_table: :games, primary_key: :game_id }
        t.integer :sort_order
        t.datetime :added_at
        end
    end
end
