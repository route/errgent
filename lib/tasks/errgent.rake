desc 'Generate error pages'
task errgent: :environment do
  Errgent::Renderer.new.render
end
