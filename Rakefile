# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  require 'motion-cocoapods'
  require 'bubble-wrap/all'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'SmartWeather'
  app.detect_dependencies = false
  app.provisioning_profile = '/Users/nicolasrenard/Provision/SmartWeather.mobileprovision'
  app.codesign_certificate = 'iPhone Developer: Nicolas Renard (5VS3RL3UKS)'

  app.pods do
    pod 'FlurrySDK'
    pod 'Appirater'
    pod 'Harpy'
  end

  app.frameworks += [ 'CoreAnimation', 'CoreData', 'CoreMotion' ]
end
