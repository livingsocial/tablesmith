require 'spec_helper'

include Tablesmith

describe Batch do
  it 'should subclass array' do
    b = Batch.new
    b.length.should == 0
    b << 1
    b << 'a'
    b[0].should == 1
    b[1].should == 'a'
    b.class.should == Batch
  end

  it 'should pass unmatched Array messages to all items' do
    b = Batch.new
    b.length.should == 0
    b << 1
    b << '2'
    b.to_i.should == [1, 2]
  end

  it 'should handle empty Array' do
    expected = <<-TEXT
+---------+
| (empty) |
+---------+
    TEXT
    [].to_batch.text_table.to_s.should == expected
  end

  it 'should handle a simple two row Array' do
    a = [%w(a b c), %w(d e f)]
    actual = a
    expected = <<-TABLE
+---+---+---+
| a | b | c |
+---+---+---+
| d | e | f |
+---+---+---+
    TABLE
    actual.to_batch.text_table.to_s.should == expected
  end
end
