require 'spec_helper'

describe 'Login' do

  it 'should login with username and password and then logout' do
    #Login
    find_element(:id, 'tv.qubit.android.player:id/acceptButton').click
    find_element(:id, 'tv.qubit.android.player:id/menuBarMoreButton').click
    find_element(:name, 'Iniciar sesión').click
    find_element(:id, 'tv.qubit.android.player:id/userNameEditText').send_keys 'qa2'
    find_element(:id, 'tv.qubit.android.player:id/passwordEditText').send_keys '000000'
    find_element(:id, 'tv.qubit.android.player:id/loginButton').click
    sleep(5) #Reemplazar

    #Que Asserto realizar?
    find_element(:id, 'tv.qubit.android.player:id/menuBarMoreButton').click
    expect(find_elements(:name, 'Mi cuenta').size).to eq(1)
    Appium::TouchAction.new.tap(x: 1, y: 1).perform #Ocultar el menu haciendo clic en cualquier parte de la pantalla

    #Logout
    find_element(:id, 'tv.qubit.android.player:id/menuBarMoreButton').click
    find_element(:name, 'Cerrar sesión').click
    find_element(:id, 'tv.qubit.android.player:id/messageAcceptButton').click
    sleep(5) #Reemplazar

    #Que Asserto realizar?
    find_element(:id, 'tv.qubit.android.player:id/menuBarMoreButton').click
    expect(find_elements(:name, 'Iniciar sesión').size).to eq(1)
  end
end