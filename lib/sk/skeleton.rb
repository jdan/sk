# -*- encoding: utf-8 -*-

require 'fileutils'

module Sk
  class Skeleton

    attr_accessor :name

    def initialize(name, &block)
      @name = name

      # check if dir already exists!
      FileUtils.mkdir(@name)
      FileUtils.cd(@name)

      block.call self

      # go back!
      FileUtils.cd('..')
    end

    def file(name, options={})
      FileUtils.touch name
    end

    alias :touch :file

    def dir(name, &block)
      FileUtils.mkdir(name)
      FileUtils.cd(name)

      block.call if block

      FileUtils.cd('..')
    end

  end
end
