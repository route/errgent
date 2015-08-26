namespace :errgent do
  desc 'regenerate error pages'
  task :generate => :environment do
    queue! %(
      echo '-----> regenerating error pages'
      RAILS_ENV=#{fetch(:rails_env)} bundle exec rake errgent
    )
  end
end
