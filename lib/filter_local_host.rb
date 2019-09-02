class FilterLocalHost
  def initialize(app)
    @app = app
  end

  def call(env)
    @request = Rack::Request.new(env)

    if @request.ip == "127.0.0.1" || @request.ip == "::1"
      [403, {}, "You cannot use port 127.0.0.1"]
    else
      @app.call(env)
    end
  end
end
