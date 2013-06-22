require 'rake'
require 'rake/tasklib'

require 'errgent/renderer'

module Rake
  class ErrgentTask < Rake::TaskLib
    attr_reader :name, :renderer
    attr_accessor :codes, :source, :destination

    def initialize(name = :errgent)
      @name = name
      @renderer = Errgent::Renderer.new

      @codes = [500, 403, 404, 422]
      @source = File.join('layouts', 'error_page')
      @destination = File.join('public', '%{code}.html')

      yield self if block_given?

      define
    end

    def define
      desc 'Generates error pages'
      task name => :environment do
        generate_error_pages
      end
    end

    private

    def generate_error_pages
      codes.each do |code|
        assigns = { :code => code }
        renderer.render(source, destination % assigns, assigns)
      end
    end
  end
end
