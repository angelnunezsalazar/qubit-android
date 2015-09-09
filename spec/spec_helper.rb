require 'rubygems'
require 'appium_lib'

desired_caps = {  
   :caps =>  {  
    :platformName => "Android",
    :platformVersion => '5.1',
    :deviceName => 'Android Emulator',
    :app => '/Users/snahider/Downloads/tv.qubit.android.player.apk',
    :appPackage => 'tv.qubit.android.player',
    #:appActivity => '.StartupActivity'
    :appActivity => '.Main'
  }  
} 


RSpec.configure do |config|

  config.before(:each) do
    @driver = Appium::Driver.new(desired_caps)
    Appium.promote_appium_methods Object 
    @driver.start_driver
    wait = Selenium::WebDriver::Wait.new(:timeout => 15)
    wait.until { find_element(:name,'TÉRMINOS Y CONDICIONES') }
  end

  config.after(:each) do
    @driver.driver_quit
  end

end