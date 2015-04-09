require 'sinatra'
require 'data_mapper'
require 'rack-flash'

require_relative './controllers/link'
require_relative './controllers/tag'
require_relative './controllers/application'
require_relative './controllers/users'
require_relative './controllers/sessions'

require_relative './helpers/application'

require_relative './models/link'
require_relative './models/tag'
require_relative './models/user'

require_relative 'data_mapper_setup'

enable :sessions
use Rack::Flash
use Rack::MethodOverride
set :session_secret, 'super secret'