class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  # Add routes
  get "/messages" do
    messages = Message.all.sort_by(&:created_at)
    messages.to_json
  end

  post "/messages" do
    message = Message.create(body: params[:body], username: params[:username])
    message.to_json
  end
end
