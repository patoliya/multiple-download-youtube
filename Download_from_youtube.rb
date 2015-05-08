require "video_info"  # This is for getting video information
require_relative  "automator"  # For running system command sequencially 



separator ="+"*80 



#opening file containing download link
	link_file = open "put_link_to_download_from_youtube.txt"


# Extracting all link from link file
	all_download_link = link_file.read.split(" ")

# Running download commands
	
	all_download_link.each do |link|
		puts
		puts 
		
		video = VideoInfo.new(link)
		
		if video.available? 
			puts "Downlaoding ==> "
			puts  "Title    :#{video.title}"

			puts separator
		    Automatic::Command.run("youtube-dl "+link)
	    	puts separator
	    else
	    	puts "#{video.title}==>Not available"
	    end
    end


puts
puts

puts "#{"="*40} Done...all download finished #{"="*40}"
	  