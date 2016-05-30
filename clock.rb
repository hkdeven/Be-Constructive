include Clockwork

every(25.seconds, 'Dribbble Rake Task'){
    `rake dribbble:get_recent`
}

on(:after_tick) do
  puts "dribbble pulled"
  true
end
