require 'pathname'

module Support
  module File

    def file(name)
      Pathname(__FILE__) + '..' + 'files' + name
    end
  end
end

ActiveSupport::TestCase.send :include, Support::File
