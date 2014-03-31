require 'open-uri'
task :batch_laps => :environment do 
  laps_file = ENV['file']
  begin
    # clean out data
    Profile.destroy_all
    Lap.destroy_all
    # Process laps
    laps = File.new(laps_file, 'r')
    laps.each_line("\n") do |lap_line|
      # profile_name, profile_duration, profile_intensity, lap_number, lap_duration, lap_intensity, lap_speech_text = lap_line.split(",")
      profile_name, profile_version_number, profile_duration, profile_intensity, lap_number, lap_duration, lap_intensity, lap_speech_text, lap_duration_seconds = lap_line.split(",")
    
      profile = Profile.where({ :name => profile_name }).first
      if !profile
        profile = Profile.new
        profile.name = profile_name
        profile.duration = profile_duration
        profile.intensity = profile_intensity
        profile.version_number = profile_version_number
        profile.save
      end

      lap = Lap.new
      lap.lap_number        = lap_number
      lap.lap_time          = lap_duration_seconds # lap_duration
      lap.lap_intensity     = lap_intensity.to_f
      lap.lap_speech_string = lap_speech_text
      
      puts "---------------------------------------------"
      puts "  #{lap_line.inspect}"
      # response = lap.create(profile.id)
      lap.profile = profile
      if lap.save
        puts "  Created Successfully" 
      else
        puts "  Failed to create lap" 
        puts "  #{response.inspect}"
      end
      puts "---------------------------------------------"
    end
  rescue Exception => e
    puts "An error has occured"
    puts e.message
  end
end