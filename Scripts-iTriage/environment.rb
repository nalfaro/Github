#This class is to capture and distribute the url the user entered
#Since test/unit manages console value as a file it is necessary to set ARGV[0] as nil


class Environment
	if ARGV[0] != nil
		URL = ARGV[0]
		ARGV[0] = nil
	else
		URL
			
	end
end
