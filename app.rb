require "sinatra"
require "sinatra/activerecord"
require "json"
require "./config/environments"
require "./app/models/item"
require "./app/models/ack"

before do
  content_type :json
  headers "Access-Control-Allow-Origin" => "*"
end

not_found do
  content_type :json
  { error: { message: "No resource could be found at the given URL (404)" } }.to_json
end

error do
  content_type :json
  { error: { message: env['sinatra.error'].message } }.to_json
end

get "/items/:id" do
  @item = Item.find_or_create_by_identifier!(Item.identifier_for(params[:id]))
  @item.to_json
end

post "/items/:id/acks" do
  @item = Item.find_or_create_by_identifier!(Item.identifier_for(params[:id]))
  @item.acks.create(ip_address: request.ip)
  @item.to_json
end
