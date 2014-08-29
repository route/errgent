desc 'Generate error pages'
task :errgent do
  on roles(:app) do
    within release_path do
      with rails_env: fetch(:rails_env) do
        execute :rake, :errgent
      end
    end
  end
end

after 'deploy:assets:precompile', 'errgent'
