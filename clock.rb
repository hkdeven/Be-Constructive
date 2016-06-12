include Clockwork

every(20.seconds, 'Pulling Dribbble Rake Task'){
    `rake dribbble:get_recent`
}

on(:after_tick) do
  puts "tick, tock..."
  true
end
