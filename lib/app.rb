require 'active_record'
require_relative 'models/products'
require 'pg'
require 'sinatra'
require 'yaml'

after do
  ActiveRecord::Base.connection.close
end

database_config = ENV['DATABASE_URL']
if database_config.blank?
  database_config = YAML::load(File.open('config/database.yml'))
end

ActiveRecord::Base.establish_connection(database_config)

get '/api/products/:name' do |name|
  product = Product.find_by(name: name)
  if product.nil?
    [404, 'No such product'.to_json]
  else
    product.to_json
  end
end

post '/api/products' do
  product = Product.create(name: params[:name], category: params[:category], price: params[:price]).to_json
end
