#!/usr/bin/env puma
# START LIKE
# rails s -b 0.0.0.0
#
# ps -e | grep ruby
# kill pid
workers Integer(ENV['WEB_CONCURRENCY'] || 1)
threads_count = Integer(ENV['MAX_THREADS'] || 1)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3001
directory File.expand_path('../../', __FILE__)

daemonize if Rails.env.production?
plugin :tmp_restart if Rails.env.development?
worker_timeout 600 if Rails.env.development?
