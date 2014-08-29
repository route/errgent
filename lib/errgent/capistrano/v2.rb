Capistrano::Configuration.instance.load do
  desc 'Generate error pages'
  task :errgent do
    run "cd #{latest_release} && RAILS_ENV=#{rails_env} bundle exec rake errgent"
  end

  after 'deploy:assets:precompile', 'errgent'
end
