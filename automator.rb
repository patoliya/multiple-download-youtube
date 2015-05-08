require 'open4'

# A Ruby automation DSL
#
#
# =============================

module Automatic

  


  class Command
    # Recursively consume a channel until it becomes empty
    def self.consume(channel)
      result=""
      while(line=channel.gets)
        result += line
        puts result
      end 
    end


    # Runs a command and returns stdout and stderr
    #
    # @param command String
    # @param print Bool
    def self.run(command, print=true)
      puts "Running #{command}"
      Open4::popen4(command) do |pid, stdin, stdout, stderr|
        @pid=pid
        @stdin=command
        @stdout=consume(stdout)
        print @stdout
        
      end
    end
  end

end