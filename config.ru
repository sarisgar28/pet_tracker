require_relative './config/env'

use Rack::MethodOverride 
run ApplicationController
use SessionsController
use PetsController