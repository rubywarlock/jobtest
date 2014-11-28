module ApplicationHelper

	def replacer(str)
		replacements = [['**[', '<b>'],[']**', '</b>'],['\\\\[','<i>'],[']\\\\','</i>'],]

		replacements.each do |replacement|
			str.gsub!(replacement[0], replacement[1])
		end

		str.scan(/\(\([[\w]+\/[\w]+\/[\w]+\[[\w\W\s]+\]]*\)\)/).each do |r|
			link_without_string = r.sub(/\[[\w\s\W]+\]/,'').scan(/\(\(([\w\W]*)\)\)/)[0][0]
			string = r.scan(/\[([\w\s\W]+)\]/)[0][0]
			str.gsub!(r,"<a href=\"#{link_without_string}\">#{string}</a>")
		end
		str
	end

end
