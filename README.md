# README

## Requirements

You should have already installed:

- Ruby from .ruby-version file
- sqlite3

## Local Installation

### 1. Clone Github repo and install Ruby gems

`bundle install`

### 2. Set up db

`rails db:migrate`

### 3. Launch server

`rails s`

### 4. Run the tests to know everthing is working fine:

`bundle exec rspec`

## To Play the game 

Send a post request to `http://localhost:3000/game_plays`. The body of the request should follow the following .json format:

{
"game_play": {
	"guest_player": "name",
	"guest_move": "rock"/"paper"/"scissor"
	}
}

## To see game histroy

Send a get request to `http://localhost:3000/game_plays`. Returns a list of players, moves played and who won. Plus total number of games played.

### Have fun!

