class FakeJob < ApplicationJob
  queue_as :default

  def perform
    puts "I' starting the fake job"
    sleep 3
    puts "Ok, I am now done."
  end
end
