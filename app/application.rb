require 'pry'

class Application

  @@items = ["Apples","Carrots","Pears"]

@@cart = []



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
     elsif req.path.match(/add/)
         item = req.params["item"]
          if @@items.include?(item)
            @@cart << item
            resp.write "added #{item}"
          else
            @@cart << "We don't have that item"
          end  
          resp.write @@cart
        
    else
      @@cart.each do|item|
      resp.write "#{item}\n"
      end
    end
  
    resp.finish
  end


end


