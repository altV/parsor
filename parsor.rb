require 'pry'

class Parsor
  def self.get *a, &b; parse(*a, &b).join end

  def self.parse input, &rules
    new(input).match(&rules)
  end

  def initialize input
    @input = input.split('')
    @result = []
    @ended = false
  end

  def match &rules
    instance_eval(&rules)
    @result
  end

  def char symbol
    return if @ended

    if @input[0] == symbol
      @result << (@input.shift)
    else
      @ended = true
      @result = []
    end
  end

  def string symbols_concatenated
    return if @ended

    symbols_concatenated.split('').each {|s| char s }
  end

  def many &rules
    return if @ended

    while( (sub_result = self.class.parse(@input.join, &rules)) != [] )
      @input.shift sub_result.size
      @result << sub_result
    end
  end

  def any_of &rules
    return if @ended

    while( (sub_result = self.class.parse(@input.join, &rules)) != [] )
      @input.shift sub_result.size
      @result << sub_result
    end
  end
end
