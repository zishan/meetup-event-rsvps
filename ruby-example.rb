require 'rMeetup'

# in case you want to see the http request to the api
#require 'net-http-spy'
#Net::HTTP.http_logger_options = {:verbose => true}

# get your api key from https://secure.meetup.com/meetup_api/key/
api_key = ''

# Stamford Tech Meetup #43: http://www.meetup.com/The-Stamford-Tech-Meetup/events/162902062/
event_id = '162902062'

# configures client library
RMeetup::Client.api_key = api_key

# You are now free to move about the cabin.


rsvps = RMeetup::Client.fetch(:rsvps, {event_id: event_id})

# names for those who rsvp'd "yes"
names = rsvps.reject { |r| r.response.eql? 'no' }.collect { |r| r.member['name'] }

puts names.inspect

