# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'httparty'
require 'countries'

class IGDBclient
    IGDB_URL  = "https://api.igdb.com/v4"
    def initialize
        @client_id = File.read(ENV["TWITCH_CLIENT_ID"]).strip
        @access_token = File.read(ENV["TWITCH_ACCESS_TOKEN"]).strip
    end

    def get_games(limit, offset)
        body = "
            fields name,cover.url,summary,first_release_date,release_dates.date,platforms.name,genres.name,involved_companies.publisher,involved_companies.developer,involved_companies.company.name,involved_companies.company.country,involved_companies.company.websites.url,themes.name;
            limit #{limit};
            offset #{offset};
        "

        response = HTTParty.post(
            "#{IGDB_URL}/games",
            headers: {
                "Client-ID" => @client_id,
                "Authorization" => "Bearer #{@access_token}"
            },
            body: body
        )
        if response.success?
            JSON.parse(response.body)
        else
            puts "IGDB API Error: #{response.code} - #{response.body}"
            []
        end
    end
end

class Game < ApplicationRecord
  self.primary_key = "game_id"
end

class Developer < ApplicationRecord
  self.primary_key = "developer_id"
end

class Publisher < ApplicationRecord
  self.primary_key = "publisher_id"
end

class Platform < ApplicationRecord
  self.primary_key = "platform_id"
end

class Genre < ApplicationRecord
  self.primary_key = "genre_id"
end

class GameDeveloper < ApplicationRecord
  self.primary_key = %w[game_id developer_id]
  belongs_to :game, foreign_key: "game_id"
  belongs_to :developer, foreign_key: "developer_id"
end

class GamePublisher < ApplicationRecord
  self.primary_key = %w[game_id publisher_id]
  belongs_to :game, foreign_key: "game_id"
  belongs_to :publisher, foreign_key: "publisher_id"
end

class GamePlatform < ApplicationRecord
  self.primary_key = %w[game_id platform_id]
  belongs_to :game, foreign_key: "game_id"
  belongs_to :platform, foreign_key: "platform_id"
end

class GameGenre < ApplicationRecord
  self.primary_key = %w[game_id genre_id]
  belongs_to :game, foreign_key: "game_id"
  belongs_to :genre, foreign_key: "genre_id"
end


client = IGDBclient.new

batches = 10
limit = 500
offset = 0

while batches != 0
    games = client.get_games(limit, offset)
    if games.empty?
        puts "No more games found. Stopping."
        break
    end
    offset += limit
    games.each do |g|
        if g["themes"].present?
            if g["themes"].any? { |t| t["name"] == "Erotica" }
                puts "Skipping Erotica title: #{g['name']}"
                next
            end
        end
        release = Time.at(0).to_datetime
        cover_url = "NO COVER"
        if g.dig("cover", "url")
            raw_url = "https:#{g['cover']['url']}"
            cover_url = raw_url.gsub("t_thumb", "t_cover_big")
        end

        if g["first_release_date"].present?
            release = Time.at(g["first_release_date"]).to_datetime
        elsif g["release_dates"].present? && g["release_dates"][0]["date"].present?
            release = Time.at(g["release_dates"][0]["date"]).to_datetime
        end

        game = Game.find_or_create_by!(title: g["name"]) do |new_game|
            new_game.release_date = release
            new_game.cover_url = cover_url
            new_game.summary = g["summary"]
        end

        (g["genres"] || []).each do |genre_data|
            genre = Genre.find_or_create_by!(name: genre_data["name"])
            GameGenre.find_or_create_by!(game: game, genre: genre)
        end

        (g["platforms"] || []).each do |platform_data|
            platform = Platform.find_or_create_by!(name: platform_data["name"])
            GamePlatform.find_or_create_by!(game: game, platform: platform)
        end

        (g["involved_companies"] || []).each do |involved_company|
            next unless involved_company["company"].present?

            company = involved_company["company"]
            website = company.dig("websites", 0, "url") || nil
            country_code = involved_company.dig("company", "country")

            country_name = nil

            if country_code.present?
                country = ISO3166::Country.find_country_by_number(country_code.to_s.rjust(3, '0'))

                # Get the common name, falling back to nil if not found
                country_name = country.present? ? country.common_name : nil
            end
            if involved_company["developer"]
                dev = Developer.find_or_create_by!(name: company["name"]) do |d|
                    d.website = website
                    d.country = country_name
                end
                GameDeveloper.find_or_create_by!(game: game, developer: dev)
            end

            if involved_company["publisher"]
                pub = Publisher.find_or_create_by!(name: company["name"]) do |p|
                    p.website = website
                    p.country = country_name
                end
                GamePublisher.find_or_create_by!(game: game, publisher: pub)
            end
        end
    end
    batches -= 1
end
