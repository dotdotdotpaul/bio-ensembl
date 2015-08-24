require 'net/http'
require 'uri'
require 'rubygems'
require 'json'
require 'yaml'
 
module Ensembl
  module API

    SERVER='http://grch37.rest.ensembl.org'

    # Call the Variant Effect Predictor.  Possible opts =
    # :species -> defaults to "homo_sapiens"
    # :hgvs -> 0/1 (default 0) include HGVS notation
    # :canonical -> 0/1 (default 0) include flag indicating the canonical 
    #               transcript.
    # See http://grch37.rest.ensembl.org/documentation/info/vep_region_post
    # for more details/options.
    def self.vep(variants, opts=nil)
      opts ||= { }
      opts[:species] ||= "homo_sapiens"
      opts[:variants] = Array.wrap(variants)
    
      path = "/vep/#{opts[:species]}/region"
     
      url = URI.parse(SERVER)
      http = Net::HTTP.new(url.host, url.port)
       
      request = Net::HTTP::Post.new(path, {'Content-Type' => 'application/json', 'Accept' => 'application/json'})
      request.body = opts.to_json
       
      response = http.request(request)
       
      if response.code != "200"
        raise RuntimeError.new("Invalid response #{response.code}: #{response.body}")
      end

      JSON.parse(response.body)
    end
  end
end

