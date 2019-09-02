require "greeter"
require "filter_local_host"
require "upcase_all"

use Rack::Reloader, 0
use Rack::Auth::Basic do |username, password|
  password == "secret"
end

# Change how we handle a request.
# Uncomment out below to deny access to our content if the client is on port 127.0.01.
# use FilterLocalHost

run Rack::Cascade.new([Rack::File.new("public"), Greeter, UpcaseAll])
# $ rackup -Ilib to run server