class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find{|i| i.name == item_name}
      resp.write item.price 
      #resp.status = 400

    end
    else
      resp.status = 404
      resp.finish
  end
end
