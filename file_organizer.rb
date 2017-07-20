
require 'fileutils'

compressed=["RAR","JAR","ZIP","TAR","MAR","ISO","LZ","7ZIP","TGZ","GZ","BZ2"]
docs=["DOC","DOCX","PPT","PPTX","PAGES","PDF","ODT","ODP","XLSX","XLS","ODS","TXT","IN","OUT"]
code=["CPP","RB","PY","HTML","CSS","JS"]
system_files=["DEB","EXE","SH","BUNDLE"]
images=["JPG","JPEG","GIF","PNG","SVG"]
video=["FLV","WMV","MOV","MP4","MPEG","3GP","MKV"]
audio=["MP3","WAV","WMA","MKA","AAC","MID","RA","RAM","RM","OGG"]

##########################Create Functions#############################################

def create_folder(take_input)

    hash=Hash.new;
	take_input.each do |file_type|
		if !Dir.exist?("#{file_type.upcase} files")
			Dir.mkdir("#{file_type.upcase} files")
		end
		hash[file_type]=0;
	end
	return hash;
end

def organize_files(hash_files,selection,file_formats)
    
  hash=Hash.new
  hash["folder"]=0
  hash["unknown"]=0
  present_dir=Dir.pwd
  dir=Dir.new(present_dir)

  dir.each do |file|

  	if file!="file_organizer.rb"

  		if Dir.exist?(file)
  			hash["folder"]=hash["folder"]+1;
  		elsif File.file?(file)
  		   extension_name=File.extname(file)
  		   extension_name= extension_name.split(".")[1].to_s;
           
  		   if hash.has_key?(extension_name)
  		   	hash["extension_name"]=hash["extension_name"]+1;
  		    else
  		    hash["extension_name"]=1;
  		   end

  		   if selection
  		   	 
  		   	 if hash_files.has_key?(extension_name)
                hash_files[extension_name]=hash_files[ext_name]+1
                source=File.absolute_path(file)
                FileUtils.mv(present_dir+"/"+file, present_dir + "/#{extension_name.upcase} files/"+file)
             end

             else
        
                if file_formats.has_key?(extension_name.upcase)
                   if !Dir.exists?(file_formats[extension_name.upcase])
                   Dir.mkdir(file_formats[extension_name.upcase])
                end
                
                source=File.absolute_path(file)
                FileUtils.mv(present_dir+"/"+file, present_dir + "/#{file_formats[extension_name.upcase]}/"+file)
            
                else
                  if !Dir.exists?("#{extension_name.upcase} files")
                    Dir.mkdir("#{extension_name.upcase} files")
                  end  
                  source=File.absolute_path(file)
                  FileUtils.mv(present_dir+"/"+file, present_dir + "/#{extension_name.upcase} files/"+file)
                 end
            end

            else
              hash["unknown"]=hash["unknown"]+1
            end

  		   end
  		end


return hash
end


#################### Main Code Goes Here###############################################
puts "Hi, Thanks For Running File-organizer"
puts "Press 1 : For Manually Select File Extensions"
puts "press 2 : For Selecting All Files in Folder"

input=gets.chomp();
input=input.to_i;

file_format=Hash.new
docs.each do |format|
	file_format["format"]="Doc Files"
end

images.each do |format|
	file_format["format"]="Image Files"
end

audio.each do |format|
	file_format["format"]="Audio Files"
end

video.each do |format|
	file_format["format"]="Video Files"
end

code.each do |format|
	file_format["format"]="Code Files"
end

compressed.each do |format|
	file_format["format"]="Compressed Files"
end

system_files.each do |format|
	file_format["format"]="System Files"
end

if(input==1)
	puts "Enter file Extension Seperated With commas , "
	take_input=gets.chomp();
	take_input=take_input.split(",")
	hash_files=create_folder(take_input)
	analysis=organize_files(hash_files,true,file_format)
end

if(input==2)
	puts "just Have A Cup Of Tea"
	hash_files=Hash.new
	analysis=organize_files(hash_files,false,file_format);

end


puts "Your Folder contains: "
total=0
analysis.each do |key,value|
  total=total+value
  puts "#{key.upcase} files: #{value}"
end
  puts "Total files: #{total}"