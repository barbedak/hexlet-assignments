# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

# Stack test class
class StackTest < Minitest::Test
  # BEGIN
  def setup
    @stack = Stack.new
  end

  def test_add_element_to_stack
    size_before_push = @stack.size
    @stack.push! 'elem'
    assert { size_before_push < @stack.size }
  end

  def test_remove_element_from_stack
    @stack.push! 'elem'
    size_before_remove = @stack.size
    @stack.pop!
    assert { size_before_remove > @stack.size }
  end

  def test_clear_stack
    @stack.push! 'elem'
    @stack.clear!
    size_empty_stack = 0
    assert { size_empty_stack == @stack.size }
  end

  def test_stack_is_empty
    @stack.clear!
    size_empty_stack = 0
    assert { size_empty_stack == @stack.size }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
