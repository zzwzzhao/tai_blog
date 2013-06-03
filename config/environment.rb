# -*- encoding : utf-8 -*-
# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
TaiBlog::Application.initialize!

require 'magic_encoding'
AddMagicComment.process(['utf-8', Dir.pwd])
