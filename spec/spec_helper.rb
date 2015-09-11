require 'rubygems'
require 'appium_lib'
require 'sauce_whisk'

def setup_driver
  return if $driver
  @caps = Appium.load_appium_txt file: File.join(Dir.pwd, 'appium.txt')
  if using_sauce
    upload_app
  end
  $driver=Appium::Driver.new(@caps)
end

def using_sauce
  user = ENV['SAUCE_USERNAME']
  key  = ENV['SAUCE_ACCESS_KEY']
  return user && key
end

def upload_app
  storage = SauceWhisk::Storage.new debug: true
  app = @caps[:caps][:app]
  storage.upload app
  @caps[:caps][:app] = "sauce-storage:#{File.basename(app)}"
end

def promote_methods
  Appium.promote_appium_methods Object
end

setup_driver
promote_methods

RSpec.configure do |config|

  config.before(:each) do
    $driver.start_driver
    set_wait(5) #Implicit Wait
    wait = Selenium::WebDriver::Wait.new(:timeout => 20)
    wait.until { find_element(:name,'TÉRMINOS Y CONDICIONES') }
  end

  config.after(:each) do
    $driver.driver_quit
  end

end