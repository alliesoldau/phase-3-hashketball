# Write your code below game_hash
require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here

def all_players
  game_hash[:home][:players] + game_hash[:away][:players]
end

def selected_player teammate
  all_players.find do |player|
    player[:player_name] == teammate
  end
end

def num_points_scored teammate
  player = selected_player(teammate)
  player[:points]
end

def shoe_size teammate
  player = selected_player(teammate)
  player[:shoe]
end

def find_team team_name
  team_info = game_hash.find do |team, data|
    data[:team_name] == team_name
  end
  team_info[1]
end

def team_colors team_name
  our_team = find_team team_name
  our_team[:colors]
end

def team_names
  team_names_array = []
  team_info = game_hash.each do |team, data|
    team_names_array << data[:team_name]
  end
  team_names_array
end

def player_numbers team_name
  our_team = find_team team_name
  our_team[:players].map do |player|
    player[:number]
  end
end

def player_stats teammate
  selected_player teammate
end

def big_shoe_rebounds
  shoes_array = all_players.map do |player|
    player[:shoe]
  end
  biggest_shoe = shoes_array.max
  player_in_question = all_players.find do |player|
    player[:shoe] == biggest_shoe
  end
  player_in_question[:rebounds]
end

def most_points_max_by
  max_points = all_players.max_by do |player|
    player[:points]
  end
  max_points[:player_name]
end

def winning_team
  home_points = 0
  away_points = 0
  game_hash[:home][:players].each do |player|
    home_points += player[:points]
  end
  game_hash[:away][:players].each do |player|
    away_points += player[:points]
  end
  result = if home_points > away_points
    "Home team wins!"
  else
    "Away team wins!"
  end 
  result
end

def player_with_longest_name
  longest_name = all_players.max_by do |player|
    player[:player_name].length
  end
  longest_name[:player_name]
end

def long_name_steals_a_ton?
  longest_name_player = player_with_longest_name
  longest_name_steals = player_stats(longest_name_player)[:steals]
  most_steals_player = all_players.max_by do |player|
    player[:steals]
  end
  most_steals = most_steals_player[:steals]
  longest_name_steals == most_steals ? true: false
end

