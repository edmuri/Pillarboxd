# Dockerfile

# Use a recent official Ruby image with the necessary build tools
FROM ruby:3.4.7-slim-trixie

# Set environment variables for the application
ENV RAILS_ENV development
ENV BUNDLE_PATH /usr/local/bundle

# Install system dependencies needed for MySQL and NodeJS
RUN apt-get update -qq && \
    apt-get install -y \
    build-essential \
    libmariadb-dev \
    libyaml-dev \
    nodejs \
    npm \
    default-mysql-client \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock first to leverage Docker cache
COPY Gemfile Gemfile.lock ./

# Install required gems
RUN bundle install

# Copy the rest of the application code
COPY . .

# Expose the port where Rails will run
EXPOSE 3000

# Default command to run the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
