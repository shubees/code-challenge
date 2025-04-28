require "bundler/setup"
require "nokogiri"
require "json"



    # Grabs the html file from user supplied argument 
    file = ARGV[0] || "van-gogh-paintings.html"
    file_path = File.expand_path("../files/#{file}", __dir__)
    html = File.read(file_path)

    # Uses Nokogiri gem to parse the html
    output = Nokogiri::HTML(html)

    # Logic to extract what is needed for the output JSON file
    objs = output.css(".Cz5hV .iELo6")

    # Creates an array to hold parsed hashes
    array = []

    # Searches html file for data specified in the challenge
    objs.each do |obj|
        #name
        name  = obj.css(".KHK6lb .pgNMRc").text;
        #date
            date = obj.css(".KHK6lb .cxzHyb").text; 
        #link
            link = obj.css("a").first["href"]
            link = "https://www.google.com" + link
        #image
            image = obj.css("img.taFZJe").first["src"]    

        # Creates a "result" hash
        result = {
          "name" => name,
          "extensions" => [date],
          "link" => link,
          "image" => image
        }
    
        # Push the artwork hash into the artworks array
        array << result
    end

    # Grabs name of results and create a hash with the name as the key and the array of objects
    array_name = output.css(".sz3HNe.PJI6ge.adDDi .mgAbYb.OSrXXb.RES9jf.IFnjPb").text.downcase

    # Uses that name as the key
    output_data = { array_name => array }
    
    # Writes to a JSON file
    output_folder = "./solution"
    output_file = "output.json"
    output_path = File.join(output_folder, output_file)

    File.open(output_path, "w") do |f|
        f.write(JSON.pretty_generate(output_data))
    end

    puts "Parsing complete!"



