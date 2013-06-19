namespace :seed do
  desc "Creating roles, owner and client"
  task :create_roles => :environment do
    Role.delete_all
    Role.create([{name: 'owner'}, {name: 'client'}])
  end

end
