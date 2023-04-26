require "json"
require "ostruct"

def write_file(obj, filename)
  # serialization : object to hash
  data = obj.map(&:to_h)
  # generate json from the hash
  data_json = JSON.generate(data)
  # write generated json data to file
  File.write(filename, data_json, mode: "w")
end

def read_file(filename)
  if File.exists?(filename) and File.size(filename) != 0
    # read the data from filename
    data = File.read(filename)
    # convert json to hash
    data_hash = JSON.parse(data)
    # deserialization: hash to object
    obj = data_hash.map { |item| OpenStruct.new(item) }
  else
    # Return empty array if filename does not exist
    []
  end
end
