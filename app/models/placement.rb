# frozen-string-literal: true

class Placement
  VALID_AB = %w(a b).map(&:freeze).freeze

  def initialize(day, block, number, ab, event_slug: nil)
    @event_slug = event_slug
    @day = day.to_i
    @block = block.to_s.tr('ａ-ｚＡ-Ｚ０-９', 'a-zA-Z0-9').upcase
    @number = number.to_i
    @ab = ab.to_s.downcase
    raise ArgumentError, "number should be > 0" unless @number > 0
    raise ArgumentError, "day should be > 0" unless @day > 0
    raise ArgumentError, "ab should be 'a' or 'b'" unless VALID_AB.include?(@ab)
  end

  attr_reader :day, :block, :number, :ab

  def to_s
    "#{day}/#{area}#{block}-#{'%02d' % number}#{ab}"
  end

  def webcatalog_map_url
    hall_param = if hall == '東'
      "e#{hall_num > 3 ? '456' : '123'}"
    else
      "w12"
    end
    "https://webcatalog.circle.ms/Map/Hall?day=Day#{day}&hall=#{hall_param}##{block}#{'%02d' % number}#{ab}"
  end

  def area
    "#{hall}#{hall_num}"
  end

  def hall
    determine_hall
    @hall
  end

  def hall_num
    determine_hall
    @hall_num
  end
  
  def wall?
    determine_hall
    @wall || false
  end

  private

  def determine_hall
    return if @hall

    @hall, @hall_num = case @block
    when 'A'
      @wall = true
      num = case @number
            when 1..36; 1
            when 37..53; 2
            when 54..89; 3
            end
      ['東', num]
    when 'シ'
      @wall = true
      num = case @number
            when 1..36; 4
            when 37..53; 5
            when 54..89; 6
            end
      ['東', num]
    when 'あ'
      @wall = true
      ['西', 2]
    when 'れ'
      @wall = true
      ['西', 1]
    when 'B'..'M'
      ['東', 1]
    when 'N'..'Z'
      ['東', 2]
    when 'ア'..'サ'
      ['東', 3]
    when 'ス'..'ネ'
      ['東', 6]
    when 'ノ'..'マ'
      ['東', 5]
    when 'ミ'..'ロ'
      ['東', 4]
    when 'い'..'な'
      ['西', 2]
    when 'に'..'る'
      ['西', 1]
    end
  end
end
