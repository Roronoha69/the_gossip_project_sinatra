require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)         # Le programme =) 

require 'controller'

run ApplicationController