# encoding: UTF-8
require 'spec_helper'

describe 'VideoPlayer' do

  it 'should watch movies on the video player' do
    #Login
    find_element(:id, 'tv.qubit.android.player:id/acceptButton').click
    find_element(:id, 'tv.qubit.android.player:id/menuBarMoreButton').click
    find_element(:name, 'Iniciar sesión').click
    find_element(:id, 'tv.qubit.android.player:id/userNameEditText').send_keys 'qa2'
    find_element(:id, 'tv.qubit.android.player:id/passwordEditText').send_keys '000000'
    find_element(:id, 'tv.qubit.android.player:id/loginButton').click
    sleep(5) #Reemplazar

    videos= find_element(:class, 'android.widget.ListView').find_elements(:class, 'android.widget.LinearLayout')
    first_video=videos[0].find_element(:class, 'android.widget.RelativeLayout')
    price=first_video.find_element(:id,'tv.qubit.android.player:id/playLinearLayout').find_element(:id,'tv.qubit.android.player:id/mediaRowPlayButton')
    price.click
  end
end
