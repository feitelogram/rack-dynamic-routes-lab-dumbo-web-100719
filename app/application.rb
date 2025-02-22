class Application
 
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
   
      if req.path.match("/items/")
        items_title = req.path.split("/items/").last 
        item = @@items.find{|s| s.name == items_title}
    
        if item.nil?    
        resp.status = 400
        resp.write "Item not found"
        else
        resp.write item.price
        end

      else
        resp.write "Route not found"
        resp.status = 404
      end
   
      resp.finish
    end
  end