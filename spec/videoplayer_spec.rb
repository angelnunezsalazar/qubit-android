# encoding: UTF-8
require 'spec_helper'

describe 'VideoPlayer' do

  it 'should play movies' do
    #Login
    find_element(:id, 'tv.qubit.android.player:id/menuBarMoreButton').click
    find_element(:name, 'Iniciar sesión').click
    find_element(:id, 'tv.qubit.android.player:id/userNameEditText').send_keys 'qa2'
    find_element(:id, 'tv.qubit.android.player:id/passwordEditText').send_keys '000000'
    find_element(:id, 'tv.qubit.android.player:id/loginButton').click
    sleep(5)

    #Lista de Películas
    videos= find_element(:class, 'android.widget.ListView').find_elements(:class, 'android.widget.LinearLayout')
    first_video=videos[0].find_element(:class, 'android.widget.RelativeLayout')
    show_button=first_video.find_element(:id,'tv.qubit.android.player:id/playLinearLayout').find_element(:id,'tv.qubit.android.player:id/mediaRowPlayButton')
    show_button.click
    sleep(10)

    #Popup ¿Deseas Reanudar?
    popup=find_elements(:id, 'tv.qubit.android.player:id/messageText')
    if popup.size > 0
        find_element(:id, 'tv.qubit.android.player:id/messageCancelButton').click
    end

    #Player
    wait = Selenium::WebDriver::Wait.new(:timeout => 120)
#    video_player=wait.until {find_element(:id,'tv.qubit.android.player:id/video')}
    video_player=wait.until {find_element(:class,'android.widget.MediaController')}
    expect(video_player).not_to be_nil
  end
end
