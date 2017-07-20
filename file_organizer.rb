present_directory=Dir.pwd
puts present_directory;
 dir=Dir.new(present_directory)
 puts dir;
 
puts "Enter file extension you need to organize i.e \"doc,pdf,mp3\" ";
take_input=gets.chomp();

file_type= take_input.split(",");
puts file_type

file_type.each do |type|


    puts "hello"
	if Dir.exist?(type)
	 Dir.mkdir("#{type.upcase}  files");
     end
end


puts "////////////////////////////////////////"


 dir.each do |file|
 puts file;
   if File.extname(file)==".rb"
     puts "#{file}"
   end
 end