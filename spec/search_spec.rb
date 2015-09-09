require 'spec_helper'

describe 'Search' do

  it 'should search movies' do
    find_element(:id, 'tv.qubit.android.player:id/acceptButton').click
    find_element(:id, 'tv.qubit.android.player:id/menuBarSearchButton').click
    find_element(:id, 'tv.qubit.android.player:id/menuBarSearchEditText').send_keys 'teoria del todo'
    find_element(:id, 'tv.qubit.android.player:id/menuBarSearchInnerButton').click
    sleep(8) #Reemplazar

    videos= find_element(:class, 'android.widget.ListView').find_elements(:class, 'android.widget.LinearLayout')
    first_video=videos[0].find_element(:class, 'android.widget.RelativeLayout')
    name=first_video.find_element(:id,'tv.qubit.android.player:id/mediaRowTextView')
    price=first_video.find_element(:id,'tv.qubit.android.player:id/playLinearLayout').find_element(:id,'tv.qubit.android.player:id/mediaRowPlayButton')

    expect(name.text).to eq('La teoría del todo')
    expect(price.text).to eq('$15')
  end
end