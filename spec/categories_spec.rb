# encoding: UTF-8

require 'spec_helper'

describe 'Categories' do

  it 'should find movies by category' do
    
    swipe_right

    #Lista de Categorias
    categories=find_elements(:id,'tv.qubit.android.player:id/mediaRowRelativeLayout')
    cine_argentino_category=categories[4].find_element(:id,'tv.qubit.android.player:id/criteriaRowTextView')
    cine_argentino_category.click
    sleep(7)

    #Lista de Películas
    videos= find_element(:class, 'android.widget.ListView').find_elements(:class, 'android.widget.LinearLayout')
    first_video=videos[0].find_element(:class, 'android.widget.RelativeLayout')
    name=first_video.find_element(:id,'tv.qubit.android.player:id/mediaRowTextView')
    price=first_video.find_element(:id,'tv.qubit.android.player:id/playLinearLayout').find_element(:id,'tv.qubit.android.player:id/mediaRowPlayButton')

    expect(name.text).to eq('Mundo Tributo')
    expect(price.text).to eq('$13')
  end

  def swipe_right()
    sleep(1) #En ocasiones la pantalla principal demora un poco en cargar y el swipe no se realiza sobre esta pantalla
    size = window_size
    start_x = size.width * 0.2; 
    end_x =  size.width * 0.8; 
    start_y = size.height / 2; 
    Appium::TouchAction.new.swipe(start_x:start_x, start_y:start_y, end_x:end_x, end_y:start_y, duration:1000).perform
  end
end