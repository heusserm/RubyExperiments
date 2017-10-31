require "sinatra"

#Accept requests from outside my computer
set :bind, "0.0.0.0"

get "/" do
  erb :welcome
end



