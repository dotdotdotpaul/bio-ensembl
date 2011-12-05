#
# = test/unit/release_56/variation/test_variation.tb - Unit test for Ensembl::Variation
#
# Copyright::   Copyright (C) 2009
#               Francesco Strozzi <francesco.strozzi@gmail.com>
# License::     Ruby's
#
require File.expand_path File.join(File.dirname(__FILE__),"../../helper.rb")

include Ensembl::Variation

class TestVariation < Test::Unit::TestCase
  
  def setup
    DBConnection.connect('homo_sapiens',56)
  end
  
  def teardown
    DBConnection.remove_connection
  end
  
  def test_calculations
    
  # INTERGENIC
    vf = VariationFeature.new(:seq_region_id => SeqRegion.find_by_name("X").seq_region_id, :seq_region_start => 23694, :seq_region_end => 23694, :seq_region_strand => 1, :allele_string => "A/T",:variation_name => "fake_SNP")
    tv = vf.transcript_variations
    assert_instance_of(TranscriptVariation,tv[0])
    assert_equal("INTERGENIC",tv[0].consequence_type)

  
  # 3PRIME_UTR
    vf = VariationFeature.new(:seq_region_id => 27506, :seq_region_start => 96810688, :seq_region_end => 96810688, :seq_region_strand => 1, :allele_string => "G/C", :variation_name => "rs16869283")
    tv = vf.transcript_variations
    assert_equal("3PRIME_UTR", tv[1].consequence_type) 
  
  # 5PRIME_UTR
    vf = VariationFeature.new(:seq_region_id => 27506, :seq_region_start => 158536411, :seq_region_end => 158536411, :seq_region_strand => 1, :allele_string => "T/C", :variation_name => "rs71547565")
    tv = vf.transcript_variations
    assert_equal("5PRIME_UTR", tv[3].consequence_type) 
  
  # UPSTREAM
    vf = VariationFeature.new(:seq_region_id => 27506, :seq_region_start => 96831018, :seq_region_end => 96831018, :seq_region_strand => 1, :allele_string => "G/T", :variation_name => "rs6975185")
    tv = vf.transcript_variations
    assert_equal("UPSTREAM",tv[0].consequence_type)
  
  # DOWNSTREAM  
    vf = VariationFeature.new(:seq_region_id => 27506, :seq_region_start => 105727321, :seq_region_end => 105727321, :seq_region_strand => 1, :allele_string => "G/T", :variation_name => "rs35113830")
    tv = vf.transcript_variations
    assert_equal("DOWNSTREAM",tv[0].consequence_type)
  
  # WITHIN_MATURE_miRNA
    vf = VariationFeature.new(:seq_region_id => 27518, :seq_region_start => 135895002, :seq_region_end => 135895002, :seq_region_strand => 1, :allele_string => "A/G", :variation_name => "rs11266800")
    tv = vf.transcript_variations
    assert_equal("WITHIN_MATURE_miRNA",tv[2].consequence_type)

  # WITHIN_NON_CODING_GENE
    vf = VariationFeature.new(:seq_region_id => 27506, :seq_region_start => 97601052, :seq_region_end => 97601052, :seq_region_strand => 1, :allele_string => "G/A", :variation_name => "rs13245475")
    tv = vf.transcript_variations
    assert_equal("WITHIN_NON_CODING_GENE",tv[1].consequence_type)

  # COMPLEX_INDEL  
    vf = VariationFeature.new(:seq_region_id => 27752, :seq_region_start => 37529, :seq_region_end => 37535, :seq_region_strand => 1, :allele_string => "CCACCCA/ACACCCG", :variation_name => "rs71228679")
    tv = vf.transcript_variations
    assert_equal("COMPLEX_INDEL",tv[0].consequence_type)  
  
  # ESSENTIAL_SPLICE_SITE
    vf = VariationFeature.new(:seq_region_id => 27511, :seq_region_start => 818059, :seq_region_end => 818059, :seq_region_strand => 1, :allele_string => "G/T", :variation_name => "rs3888067")
    tv = vf.transcript_variations
    assert_equal("ESSENTIAL_SPLICE_SITE",tv[0].consequence_type)  

  # SPLICE_SITE
    vf = VariationFeature.new(:seq_region_id => 27506, :seq_region_start => 102301587, :seq_region_end => 102301587, :seq_region_strand => 1, :allele_string => "A/G", :variation_name => "rs434833")
    tv = vf.transcript_variations
    assert_equal("SPLICE_SITE",tv[5].consequence_type)  

  # INTRONIC
    vf = VariationFeature.new(:seq_region_id => 27506, :seq_region_start => 101165365, :seq_region_end => 101165365, :seq_region_strand => 1, :allele_string => "T/C", :variation_name => "rs1859633")
    tv = vf.transcript_variations
    assert_equal("INTRONIC",tv[2].consequence_type)  
  
  # FRAMESHIFT
    vf = VariationFeature.new(:seq_region_id => 27511, :seq_region_start => 78958619, :seq_region_end => 78958618, :seq_region_strand => 1, :allele_string => "-/G", :variation_name => "rs35065683")
    tv = vf.transcript_variations
    assert_equal("FRAMESHIFT_CODING",tv[0].consequence_type)

  # STOP_GAINED
    vf = VariationFeature.new(:seq_region_id => 27516, :seq_region_start => 38262908, :seq_region_end => 38262908, :seq_region_strand => 1, :allele_string => "G/A", :variation_name => "rs72556299")
    tv = vf.transcript_variations
    assert_equal("STOP_GAINED",tv[-1].consequence_type)
    
  # STOP_LOST
    vf = VariationFeature.new(:seq_region_id => 27511, :seq_region_start => 152770613, :seq_region_end => 152770613, :seq_region_strand => 1, :allele_string => "T/G", :variation_name => "rs41268500")
    tv = vf.transcript_variations
    assert_equal("STOP_LOST",tv[0].consequence_type)
    
  # SYNONYMOUS_CODING
    vf = VariationFeature.new(:seq_region_id => 27506, :seq_region_start => 99688238, :seq_region_end => 99688238, :seq_region_strand => 1, :allele_string => "C/T", :variation_name => "rs11550651")
    tv = vf.transcript_variations
    assert_equal("SYNONYMOUS_CODING",tv[0].consequence_type)   

  # NON_SYNONYMOUS_CODING
    vf = VariationFeature.new(:seq_region_id => 27506, :seq_region_start => 99057720, :seq_region_end => 99057720, :seq_region_strand => 1, :allele_string => "G/A", :variation_name => "rs11545970")
    tv = vf.transcript_variations
    assert_equal("NON_SYNONYMOUS_CODING",tv[1].consequence_type)   
     
  end  
  
  # Checking CDNA coordinates calculation
  
  def test_genomic2cdna_fw # forward strand (variation rs67960011)
    t = Ensembl::Core::Transcript.find_by_stable_id("ENST00000039007")
    assert_equal(573,t.genomic2cdna(38260562))    
  end
  
  def test_cdna2genomic_fw # forward strand (variation rs67960011)
    t = Ensembl::Core::Transcript.find_by_stable_id("ENST00000039007")
    assert_equal(38260562,t.cdna2genomic(573))
  end
  
  def test_genomic2cdna_rev # reverse strand (variation rs11545970)
    t = Ensembl::Core::Transcript.find_by_stable_id("ENST00000422429")
    assert_equal(110,t.genomic2cdna(99057720))
  end
  
  def test_cdna2genomic_rev # reverse strand (variation rs11545970)
    t = Ensembl::Core::Transcript.find_by_stable_id("ENST00000422429")
    assert_equal(99057720,t.cdna2genomic(110))
  end


end
