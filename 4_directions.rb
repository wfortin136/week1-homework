# Require Ruby libraries
require 'open-uri'
require 'json'

origin = "5555 South Ellis Avenue, Chicago, Illinois, 60637"
destination = "United Center, Chicago, Illinois"

# Convert to an HTTP-compatible querystring parameters
origin = URI.escape(origin)
destination = URI.escape(destination)

# Send an HTTP request to the Google Directions API
url = "http://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{destination}&sensor=false"
puts url
json_data = open(url).read

# Parse the response string into a Ruby data structure
# (You will need to figure out what kind of structure it is)
data = JSON.parse(json_data)

######
# Parsed using key value pairs and array indexing.
# For the final key value pair, I chose to use the value over the text. This is just a preference
# of mine because it allows me to capture the proper data type of the value (numeric) and implement
# additional operations without having to parse and concatenate the string.

# 1. TO DO:
# Replace the following 0 with an expression that will retrieve the total travel time
# divide by 60.0 to go from seconds to minutes
total_time = data["routes"][0]["legs"][0]["duration"]["value"]/60.0

# Output the total drive time to the screen
puts "Total travel time driving: #{total_time.round(1)} mins"

# 2. TO DO:
# Replace the following 0 with an expression that will retrieve the total distance
# convert from meters to km
total_distance = data["routes"][0]["legs"][0]["distance"]["value"]/1000.0

# Output the total distance to the screen
# print both miles and km
puts "Total distance traveled: #{(total_distance/1.60934).round(2)} mi (#{total_distance.round(2)} km)"
