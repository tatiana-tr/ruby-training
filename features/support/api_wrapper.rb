# frozen_string_literal: true

require 'rest-client'

# This Module is responsible for API calls
module ApiWrapper
  def api_create_user(user)
    response = RestClient.post "#{BASE_URL}users.json",
                               {
                                 "user": {
                                   "login": user.username,
                                   "firstname": user.firstname,
                                   "lastname": user.lastname,
                                   "mail": user.email,
                                   "password": user.password
                                 }
                               }.to_json,
                               api_headers
    raise 'User was not created via API' unless response.code == 201
  end

  def api_get_users
     RestClient.get("#{BASE_URL}users.json", api_headers)
  end

  def api_get_projects(project_id)
    response = RestClient.get("#{BASE_URL}projects/#{project_id}.json", api_headers)

    response || (raise'Project was not created via API' unless response.code == 200)
  end

  def api_headers
    { content_type: :json, 'x-redmine-api-key': ENV['API_KEY'] }
  end
end

World(ApiWrapper)
