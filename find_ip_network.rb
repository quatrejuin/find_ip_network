#!/usr/bin/ruby -w
#v1.0
#April 25, 2016
#created by Jason Wu

require "ipaddr"
beginning_time = Time.now

dictionary_file = File.join(File.dirname(__FILE__),"/dictionary_network_ip.txt")
dictionary_array = []
File.open(dictionary_file, "r") do |infile|
    while (line = infile.gets)
        dictionary_array << (IPAddr.new line.strip)
    end
end

inquiry_ip_file = File.join(File.dirname(__FILE__),"inquiry_ip.txt")
inquiry_ip_array = []
File.open(inquiry_ip_file, "r") do |infile|
    while (line = infile.gets)
         inquiry_ip_array << (IPAddr.new line.strip)
    end
end


class IPAddr

  def to_cidr_s
    if @addr
      mask = @mask_addr.to_s(2).count('1')
      "#{to_s}/#{mask}"
    else
      nil
    end
  end

end
result_array = []
inquiry_ip_array.each do |ip|
	dictionary_array.each do |geo_ip|
		if gdictionary_ip === ip
			puts dictionary_ip.to_cidr_s
      result_array << dictionary_ip.to_cidr_s
		end
	end
end

result_file = File.join(File.dirname(__FILE__),"result.txt")
open(result_file, 'w') { |f|
  result_array.each {|r| f.puts r }
}

end_time = Time.now
puts "#{inquiry_ip_array.count} IPs Time elapsed #{(end_time - beginning_time)*1000} milliseconds"
