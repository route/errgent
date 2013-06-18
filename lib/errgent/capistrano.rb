Capistrano::Configuration.instance.load do
  after 'deploy:assets:precompile', 'errgent'

  task :errgent do
    run "cd #{latest_release} && RAILS_ENV=#{rails_env} bundle exec rake errgent"
  end
end
