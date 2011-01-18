#!/usr/bin/ruby

# Based on Perl API tutorial 
# http://www.ensembl.org/info/using/api/variation/variation_tutorial.html


require File.dirname(__FILE__) + '/../lib/ensembl.rb'
include Ensembl::Core
include Ensembl::Variation

Ensembl::Variation::DBConnection.connect('homo_sapiens',60)
# The connection with the Core database can be omitted. It is created automatically
# when needed, using Variation DB connection parameters. The database name is derived 
# from Variation DB name. If you are using non conventional DB names (i.e. for a local copy of Ensembl database)
# an exception will be raised. Otherwise, if a Core DB connection is already 
# present, that connection will be used by default, instead of creating a new one.

id = ['rs73514758','rs77811736']

id.each do |i|
  v = Variation.find_by_name(i)
  v.variation_features.each do |vf|
    
    up_seq,down_seq = vf.flanking_seq # retrieve upstream and downstream flanking sequences
    
    seq_region_name = vf.fetch_region.seq_region.name # fetch the genomic region of the Variation and get the region name.
                                                      # Automatically sets the connection with Core DB, if needed.
    
    puts "\n== VARIATION FEATURE =="
    print "NAME: #{vf.variation_name}\n ALLELE: #{vf.allele_string}\n UPSTREAM SEQ: #{up_seq.seq} \n DOWNSTREAM SEQ:  #{down_seq.seq}\n SEQ REGION NAME :#{seq_region_name}\n"
    vf.transcript_variations.each do |tv|
      t = tv.transcript # retrieve Ensembl::Core::Transcript from Core DB. Automatically sets the connection, if necessary. 
      puts "== TRANSCRIPT VARIATION =="
      print "ALLELE PEPTIDE STRING: #{tv.peptide_allele_string} TRANSCRIPT STABLE ID: #{t.stable_id} GENE STABLE ID: #{t.gene.stable_id}\n"
    end
  end
end

# Returns all Variations present on a gemomic region

puts "\n== SEARCHING FOR VARIATIONS ON CHR:1:50000:51000 =="

# Even in this case, Variation DB connection can be set automatically by specific Slice methods

s = Slice.fetch_by_region('chromosome',1,50000,51000) 
variation_features = s.get_variation_features # automatically sets the connection with Variation DB, if needed.
variation_features.each do |vf|
  print "NAME: #{vf.variation_name} ALLELE: #{vf.allele_string} SEQ REGION NAME: #{vf.seq_region.name}\n"
end

puts "\n== GENOTYPED VARIATIONS =="

genotyped_variation_features = s.get_genotyped_variation_features # automatically sets the connection with Variation DB, if needed.
genotyped_variation_features.each do |gvf|
  print "NAME: #{gvf.variation_name} ALLELE: #{gvf.allele_string} SEQ REGION NAME: #{gvf.seq_region.name}\n"
end

puts "\n== STRUCTURAL VARIATIONS ON CHR:11:60125:320837 =="
slice = Ensembl::Core::Slice.fetch_by_region('chromosome',11,60125,320837)
structural_variations = s.get_structural_variations
structural_variations.each do |sv|
  print "NAME: #{sv.variation_name} SEQ REGION NAME: #{sv.seq_region.name}\n"
end

puts "\n== What things are related to a 'variation' object? =="
puts 'Variation belong to: ' + Variation.reflect_on_all_associations(:belongs_to).collect{|a| a.name.to_s}.join(',')
puts 'Variation have many: ' + Variation.reflect_on_all_associations(:has_many).collect{|a| a.name.to_s}.join(',')
