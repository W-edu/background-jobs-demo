namespace :user do
  desc "Enriching all users with clearbit (async)"
  task update_all: :environment do
    users = User.all
    puts "Enqueing update of #{users.size} users..."
    users.each do |user|
      UpdateUserJob.perform_later(user)
    end
  end
  
  desc "Enriching a given user with Clearbit (sync)"
  task :update, [:user_id] => :environment do |t, args|
    user = User.find(args[:user_id])
    puts "Enriching #{user.email}..."
    UpdateUserJob.perform_now(user)
  end
end
