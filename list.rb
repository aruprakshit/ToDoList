require_relative "./lib/converter/gist.rb"

class List
  attr_reader :lists

  def initialize(lists)
    @lists = lists
  end

  def to_gist
    result = Converter::Gist.new(lists).convert
    Gist.gist(result, filename: 'To Do List.md')
  end
end
