require 'rexml/document'
require 'zip'

module GrepPptx
  class Grepper
    attr_reader :path, :keyword

    def initialize(path, keyword)
      @path = path
      @keyword = keyword
      raise InvalidPathError unless valid_path?
    end

    def valid_path?
      Dir.exist?(path) || File.exist?(path)
    end

    def grep
      results = []
      pptx_paths.each do |pptx_path|
        results << find_in_file(pptx_path)
      end
      results
    end

    def find_in_file(file_path)
      results = []
      Zip::File.open(file_path) do |zip_file|
        entries = zip_file.glob("ppt/slides/*.xml")
        entries.each do |entry|
          idx = entry.to_s.split("/").last.match(/slide([0-9]+).xml/)[1].to_i
          xml = entry.get_input_stream.read
          results << "find \"#{keyword}\" in #{file_path} at slide #{idx}" if keyword?(xml)
        end
      end
      # Sort array by index
      results.sort_by { |a| a.split.last.to_i }
    end

    def keyword?(xml)
      doc = REXML::Document.new(xml)
      n =  REXML::XPath.first(doc.root, '/p:sld/p:cSld')
      text = REXML::XPath.match(n, './/text()').join
      text.include?(keyword)
    end

    def pptx_paths
      if File.file? path
        [path]
      else
        Dir.glob("#{path}/**/*.pptx")
      end
    end
  end
end
