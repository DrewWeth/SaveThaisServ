require 'nokogiri'


def correct_dir (dir)
  if dir != nil
    return "data/npc/scripts/" + dir.split("/").last
  else
    return "data/npc/scripts/default.lua"
  end
end

def fix_files
  files = Dir.entries(".")
  files_count = files.count

  files.each_with_index do |f_name, index|
    if f_name.include? ".xml"
      file = File.open(f_name)
      doc = Nokogiri::XML(File.open(file))
      npc = doc.at_css("npc")
      script_string = npc["script"]
      npc["script"] = correct_dir(script_string)

      File.write(f_name, doc.to_xml)
      puts "[#{index+1}/#{files_count}] #{npc["script"]} to #{f_name}"

      file.close
    end
  end
end


fix_files
