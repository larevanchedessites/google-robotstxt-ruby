# frozen_string_literal: true

require 'mkmf'
require 'timeout'

$CXXFLAGS << " -std=c++11"

def sys(cmd)
  puts " -- #{cmd}"
  unless ret = xsystem(cmd)
    raise "ERROR: '#{cmd}' failed"
  end
  ret
end

# Thrown when we detect CMake is taking too long and we killed it
class CMakeTimeout < StandardError
end

def self.run_cmake(timeout, args)
  # Set to process group so we can kill it and its children
  pid = Process.spawn("cmake #{args}", pgroup: true)

  Timeout.timeout(timeout) do
    Process.waitpid(pid)
  end

rescue Timeout::Error
  # Kill it, #detach is essentially a background wait, since we don't actually
  # care about waiting for it now
  Process.kill(-9, pid)
  Process.detach(pid)
  raise CMakeTimeout.new("cmake has exceeded its timeout of #{timeout}s")
end

MAKE = if Gem.win_platform?
         # On Windows, Ruby-DevKit only has 'make'.
         find_executable('make')
       else
         find_executable('gmake') || find_executable('make')
       end

unless MAKE
  abort 'ERROR: GNU make is required to build Google Robotstxt Parser.'
end

CWD = __dir__
LIBROBOTSTXT_DIR = File.join(CWD, 'robotstxt')

LIBDIR = RbConfig::CONFIG['libdir']
INCLUDEDIR = RbConfig::CONFIG['includedir']

HEADER_DIRS = [
  LIBROBOTSTXT_DIR,
  "#{LIBROBOTSTXT_DIR}/c-build/libs/abseil-cpp-src"
]

LIB_DIRS = [
  "#{LIBROBOTSTXT_DIR}/c-build"
]

Dir.chdir(LIBROBOTSTXT_DIR) do
  Dir.mkdir('c-build') unless Dir.exist?('c-build')
  Dir.chdir('c-build') do
    puts 'Building Robotstxt library before creating Makefile...'
    run_cmake(5 * 60, '.. -DBUILD_SHARED_LIBS=OFF')
    sys(MAKE)
  end
end

# Link the dylib directly from the c-build directory
$LDFLAGS << " -Wl,-rpath,#{LIBROBOTSTXT_DIR}/c-build"

dir_config('robotstxt', HEADER_DIRS, LIB_DIRS)

unless have_library('robots')
  abort 'ERROR: Failed to build robots'
end

create_makefile('robotstxt')
