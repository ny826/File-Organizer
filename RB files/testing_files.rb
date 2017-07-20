file_types=
compressed=["RAR","JAR","ZIP","TAR","MAR","ISO","LZ","7ZIP","TGZ","GZ","BZ2","DOC",
	"DOCX","PPT","PPTX","PAGES","PDF","ODT","ODP","XLSX","XLS","ODS","TXT","IN","OUT","CPP","RB",
	"PY","HTML","CSS","JS","DEB","EXE","SH","BUNDLE","JPG","JPEG","GIF","PNG","SVG",
"FLV","WMV","MOV","MP4","MPEG","3GP","MKV","MP3","WAV","WMA","MKA","AAC","MID","RA","RAM",
"RM","OGG"]


#puts file_types
var =0;

random=Random.new;
puts random
file_types.each do |type|

	random.rand(5..15).times do
        puts "kitni bar ................"
		f=File.new("yoyo#{var}."+"#{type}","w")
		puts f;
		f.close;
		var+=1;
	end

	puts var;
end