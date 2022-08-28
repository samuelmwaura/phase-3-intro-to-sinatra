require 'sinatra'

class App < Sinatra::Base  #our class inherits from Sinatra to extend common methods and properties
    set(:default_content_type, 'application/json')  #A method to set the default response type

    get("/hello") do #This is a method
     '<h2>Hello <em>World</em>!</h2>' #This html is implicitly returned
    end

    get("/potato") do #just introducing the brackets for readability
      "<p>Boil 'em, mash 'em, stick 'em in a stew</p>"
    end

    get '/dice' do
    dice = rand(1..6)
    #  "<h2>You rolled a #{dice}</h2>"
    {roll:dice}.to_json #Can also easily return Json
    end
    
    #dynamic routing
    get("/add/:num1/:num2")do  #the num1 and num2 are named parameters in the path and make it dynamic
      num1 = params[:num1].to_i  #params is the hash that carries all the appended params
      num2 = params[:num2].to_i  #these params come as strings and thus have to be converted to integers

      result =  num1 + num2
      {result: result}.to_json
    end
end

#Sintra is a lightweight web framework that just abstracts the common we server requirements such as sending the reponse code,explicitly declaring the datataype,etc
#Built on Rack to astract most of what rack does
#Sinatra abstracts routing into methods both instance and class and makes them available upon inheriting
#It further gives back cosy error messages
# Sinatra also Simplifies our server-side code  ability to easily send back a response in different formats
#Can allow dynamic routing in the routes passed
#All these make sinatra become a full blown web framework

run App
