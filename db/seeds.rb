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

class IGDBclient
    IGDB_URL  = "https://api.igdb.com/v4"
    def initialize
        @client_id = File.read(ENV["TWITCH_CLIENT_ID"]).strip
        @access_token = File.read(ENV["TWITCH_ACCESS_TOKEN"]).strip
    end

    def get_games(limit, offset)
        body = "
            fields name,cover.url,summary,first_release_date,release_dates.date;
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
  self.table_name = "Games"
  self.primary_key = "game_id"
end



client = IGDBclient.new

batches = 1
limit = 500
offset = 0

while batches != 0
    games = client.get_games(limit, offset)
    offset += limit + 1
    games.each do |g|
        release = Time.at(0).to_datetime
        url = "NO COVER"
        if g.dig("cover", "url")
            url = "https:#{g["cover"]["url"]}"
        end

        if g["first_release_date"].present?
            release = Time.at(g["first_release_date"]).to_datetime
        elsif g["release_dates"].present? && g["release_dates"][0]["date"].present?
            release = Time.at(g["release_dates"][0]["date"]).to_datetime
        end

        Game.create!(
            title: g["name"],
            release_date: release,
            cover_url: url,
            summary: g["summary"]
        )
    end
    batches -= 1
end
