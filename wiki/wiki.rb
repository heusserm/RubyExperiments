require "sinatra"
require "uri"

#Accept requests from outside my computer
set :bind, "0.0.0.0"

def page_content(title)
  File.read("pages/#{title}.txt")
rescue Errno::ENOENT
  return new
end


def save_content(title, content)
  File.open("pages/#{title}.txt","w") do |file|
    file.print(content);
  end
end


def delete_content(title)
  File.delete("pages/#{title}.txt")
end

def h(string)
  Rack::Utils.escape_html(string)
end

get "/" do
  erb :welcome
end

post "/create" do
 save_content(params["title"], params["content"])
 redirect URI.escape("/#{params["title"]}")
end

delete "/:title" do
  delete_content(params["title"])
  redirect "/"
end

get "/new" do
  erb :new
end

put "/:title" do
  save_content(params["title"],params["content"])
  redirect URI.escape("/#{params["title"]}")  
end

get "/:title/edit" do
   @title = params[:title]
   @content = page_content(@title)
   erb :edit
end

get "/:title" do
   @title = params[:title]
   @content = page_content(@title)
   erb :show
end





