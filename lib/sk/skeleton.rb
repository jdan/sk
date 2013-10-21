# -*- encoding: utf-8 -*-

require 'fileutils'

module Sk
  class Skeleton

    attr_accessor :name

    def initialize(name)
      @name = name

      # check if dir already exists!
      FileUtils.mkdir(@name)
      FileUtils.cd(@name)

      yield self

      # go back!
      FileUtils.cd('..')
    end

    def file(name, options={})
      FileUtils.touch name
    end

    alias :touch :file

    def dir(name)
      FileUtils.mkdir(name)
      FileUtils.cd(name)

      yield if block_given?

      FileUtils.cd('..')
    end

  end
end

# Sk::Skeleton.new 'test' do |sk|
#   sk.dir 'folder1' do
#     sk.dir 'folder2'
#     sk.touch 'level1'
#   end
#   sk.touch 'level0'
# end
