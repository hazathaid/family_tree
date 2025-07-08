Dir[Rails.root.join('db/seeds/*.rb')].sort.each do |file|
  puts "Running seed: #{file}"
  require file
end
