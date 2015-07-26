source 'https://rubygems.org'

# Declare your gem's dependencies in media.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

group :test, :development do
  # as the name says... debug things
  gem 'debugger', :platforms => :mri_19
  # use byebug on new versions of ruby
  # and make sure bundler does not die if it does not know them yet.
  if Bundler.respond_to?(:current_ruby) &&
    Bundler.current_ruby.respond_to?(:mri_21?)
    gem 'byebug', :platforms => [:mri_20, :mri_21]
  end
end
