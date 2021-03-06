require "bundler"

Bundler.require(:default)
Bundler.require(Sinatra::Base.environment)

require 'will_paginate/data_mapper'

config_env = YAML.load(File.read(File.realdirpath("../database.yml", __dir__)))[ENV['RACK_ENV']]

username      = config_env['username']
password      = config_env['password']
database_name = config_env['database_name']
host          = config_env['host']

DATABASE_URL = case ENV['RACK_ENV']
               when 'production'
                 ENV['DATABASE_URL']
               when 'test', 'development'
                 "postgres://#{username}:#{password}@#{host}/#{database_name}"
               end

DataMapper::Logger.new($stdout, :debug) if Sinatra::Base.environment == :development
DataMapper.setup(:default, DATABASE_URL)
DataMapper.finalize
