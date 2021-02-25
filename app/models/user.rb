class User < ApplicationRecord
  require 'net/http'
  require 'uri'
  require 'json'

  has_many :campaigns
  has_many :profile_users
  has_many :profiles, through: :profile_users

  after_create :add_profile_scores

  def add_profile_scores
    uri = URI.parse("https://api.fullcontact.com/v3/person.enrich")
    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/json"
    request["Authorization"] = "Bearer TAvyCmqAGeFgyyBY8u9me5wb6SqZvYUq"
    request.body = JSON.dump({
                               "email" => self.email
                             })

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    parsed_data = JSON.parse(response.body)
    fb_profile = Profile.find_by(name: 'Facebook')
    linkedin_profile = Profile.find_by(name: 'Linkedin')
    twitter_profile = Profile.find_by(name: 'Twitter')
    parsed_data['facebook'] ? (ProfileUser.create(user_id: self.id, profile_id: fb_profile.id)) : false
    parsed_data['linkedin'] ? (ProfileUser.create(user_id: self.id, profile_id: linkedin_profile.id)) : false
    parsed_data['twitter'] ? (ProfileUser.create(user_id: self.id, profile_id: twitter_profile.id)) : false
  end

  def credibility_score
    t = 0
    self.profiles.map do |p|
      t += p.points
    end
    t
  end
end
