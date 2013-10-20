# -*- encoding: utf-8 -*-

require 'forwardable'

module Sk

  INDENT = 2

  class FileSystem

    attr_reader :root
    extend Forwardable

    def_delegators :root, :to_s

    def initialize(node)
      @root = node if node.instance_of? FSNode
    end

  end

  class FSNode

    attr_accessor :name, :children
    extend Forwardable

    def_delegators :children, :<<, :[]
    alias :add :<<

    def initialize(name)
      @name = name
      @children = []
    end

    def is_file
      children.empty?
    end

    def is_dir
      !children.empty?
    end

    def to_s(level=0)
      padding = ' ' * level
      decorator = is_dir ? "/" : ""
      opt_newline = is_dir ? "\n" : ""
      recurse = children.map { |child| child.to_s(level + INDENT) }.join("\n")

      "#{padding}#{@name}#{decorator}#{opt_newline}#{recurse}"
    end

  end
end
