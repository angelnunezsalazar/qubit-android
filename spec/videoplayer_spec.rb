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
  end
end
