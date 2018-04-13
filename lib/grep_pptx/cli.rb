require "thor"

module GrepPptx
  class CLI < Thor
    desc "grep [KEYWORD] [PATH]", "grep [KEYWORD] to [PATH]"
    def grep(keyword, path)
      grepper = Grepper.new(path, keyword)
      results = grepper.grep
      results.each do |result|
        puts result
      end
    end
  end
end
