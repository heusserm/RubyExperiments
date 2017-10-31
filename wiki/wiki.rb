require "sinatra"

#Accept requests from outside my computer
set :bind, "0.0.0.0"

def page_content(title)
  File.read("pages/#{title}.txt")
rescue Errno::ENOENT
  return new
end

get "/" do
  erb :welcome
end

get "/test" do
  erb :test
end

get "/:title" do
  page_content(params[:title])
end




