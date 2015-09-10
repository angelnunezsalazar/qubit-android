desc 'Run Android tests'
task :rspec, :location do |t, args|
  if args[:location] != 'sauce'
    ENV['SAUCE_USERNAME']=nil
    ENV['SAUCE_ACCESS_KEY'] = nil
  end
  exec 'rspec'
end