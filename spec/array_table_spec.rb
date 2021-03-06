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
    [%w[a b c], %w[d e f]].to_table.to_s.should == expected
  end

  def do_just_works_test(meth_id)
    orig_stdout = $stdout
    sio = StringIO.new
    $stdout = sio
    send(meth_id, [%w[a b c], %w[d e f]].to_table)
    sio.string
  ensure
    $stdout = orig_stdout
  end

  def just_works(meth_id)
    expected = <<~TABLE
      +---+---+---+
      | a | b | c |
      +---+---+---+
      | d | e | f |
      +---+---+---+
    TABLE

    actual = do_just_works_test(meth_id)
    actual.should == expected
  end

  it 'just works with print' do
    just_works(:print)
  end

  it 'just works with puts' do
    just_works(:puts)
  end

  it 'just works with p' do
    expected = <<~TABLE
      +---+---+---+
      | a | b | c |
      +---+---+---+
      | d | e | f |
      +---+---+---+
    TABLE

    actual = do_just_works_test(:p)
    actual.should == "#{expected}\n"
  end

  it 'just works with inspect' do
    expected = <<~TABLE
      +---+---+---+
      | a | b | c |
      +---+---+---+
      | d | e | f |
      +---+---+---+
    TABLE
    [%w[a b c], %w[d e f]].to_table.inspect.should == expected
  end

  it 'just works with inspect two element integer array' do
    expected = <<~TABLE
      +---+
      | 1 |
      | 3 |
      +---+
    TABLE
    [1, 3].to_table.inspect.should == expected
  end
end
