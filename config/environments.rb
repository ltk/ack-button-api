configure :development do
 set :show_exceptions, false

 ActiveRecord::Base.establish_connection(
    adapter:  "sqlite3",
    database: "db/sinatra_application.sqlite3.db"
  )
end

configure :production do
 set :show_exceptions, false
 db = URI.parse(ENV['DATABASE_URL'])

 ActiveRecord::Base.establish_connection(
   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
   :host     => db.host,
   :username => db.user,
   :password => db.password,
   :database => db.path[1..-1],
   :encoding => 'utf8'
 )
end
