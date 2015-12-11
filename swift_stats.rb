require 'pry'


class SwiftStats

  attr_reader :swift_lyrics, :words

  def initialize
    @swift_lyrics = File.open('lyrics.txt','r')
    @words = Hash.new(0)
  end

  def clean_n_count
    swift_lyrics.each do |line|
      line.gsub(/[\"\.\?\:\,]/,"").gsub(/\n/," ").split.each do |word|
        words[word] += 1
      end
    end
    words.sort_by { |k,v| [-v,k] }
  end

end

p SwiftStats.new.clean_n_count[0..10]
