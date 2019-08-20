require 'pry'

class Application

  @@items = ["Apples","Carrots","Pears"]

@@cart = []

@@cart = ["added "]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
        @@cart << item
      end
    elsif @@cart == [] 
      resp.write "Your cart is empty"
    # elsif req.path.match(/add/)
    
    #   search_term = req.params["q"]
    #   resp.write handle_search(search_term)    
    else
      @@cart.each do|item|
      resp.write "#{item}\n"
      end
    end
  
    resp.finish
  end

  def handle_search(search_term)
  
    if @@items.include?(search_term)
      
    else
      @@cart << "We don't have that item"
    end
  end
end


