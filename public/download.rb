#this is for download
require 'yaml'
require 'rest-client'
require 'curb'

settings = YAML.load_file('config.yml')
user = settings["ankoder"]["user"]
password = settings["ankoder"]["password"]
res = ""
ARGV.each do |url|
  res = `curl  --basic --user #{user}:#{password} -d  "url=#{url.split.first}"  http://api.ankoder.com/download`
  puts res
  puts "Uploading"
end