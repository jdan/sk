# -*- encoding: utf-8 -*-

module Sk
  def self.parse(contents, isroot=true)
    lines = contents.split("\n")

    root = Sk::FSNode.new lines[0]
    blocks = self.subtrees(lines.drop(1).join("\n"))

    if blocks
      blocks.each do |block|
        node = self.parse(block, false)
        root << node
      end
    end

    if isroot
      FileSystem.new root
    else
      root
    end
  end

  # Displays contents and tests each line
  def self.test
  end

  private

  # Returns ready-to-parse subtrees from a given ascii representation of a tree
  def self.subtrees(contents)
    # Chop off INDENT spaces off the front for each line
    lines = contents.split("\n").map { |line| line.gsub(/^\s{#{INDENT}}/, '') }
    blocks = []
    current_block = []

    lines.each do |line|
      if line =~ /^\S/
        blocks << current_block.join("\n") unless current_block.empty?
        current_block = [line]
      else
        current_block << line
      end
    end

    blocks << current_block.join("\n") unless current_block.empty?
  end
end
