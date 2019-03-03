# frozen_string_literal: true

require 'spec_helper'

describe 'Array Source' do
  it 'just works in a console' do
    expected = <<~TABLE
      +---+---+---+
      | a | b | c |
      +---+---+---+
      | d | e | f |
      +---+---+---+
    TABLE
    [%w[a b c], %w[d e f]].to_table.text_table.to_s.should == expected
  end
end
