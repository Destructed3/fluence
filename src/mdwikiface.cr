require "markdown"
# require "option_parser"

require "kemal"
require "kilt/slang"
require "crystal-libgit2"

module Mdwikiface
  class Options
    getter basedir : String

    def initialize
      @basedir = File.expand_path "data", Dir.current
      Dir.mkdir_p(@basedir) rescue nil

      # OptionParser.parse! do |parser|
      #  parser.banner = "Usage: mdwikiface [arguments]"
      #  parser.on("-b=PATH", "--basedir=PATH", "Directory where the wiki must start (default: #{@basedir})") { |path| @basedir = path }
      #  parser.on("-h", "--help", "Show this help") { puts parser; exit }
      # end
    end
  end

  OPTIONS = Mdwikiface::Options.new
  # REPO    = Libgitit2.open_repository(OPTIONS.basedir)
end

require "./version"
require "./helpers"
require "./controllers"

puts "Wiki is written on #{Mdwikiface::OPTIONS.basedir}"
Kemal.run
