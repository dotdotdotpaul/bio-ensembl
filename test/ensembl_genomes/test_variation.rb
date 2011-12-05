#
#
# Copyright::   Copyright (C) 2011
#               Francesco Strozzi <francesco.strozzi@gmail.com>
# License::     Ruby's
#
# $Id:

require File.expand_path File.join(File.dirname(__FILE__),"../helper.rb")

include Ensembl::Variation


class TestVariation < Test::Unit::TestCase
  
  def setup
    DBConnection.ensemblgenomes_connect('vitis_vinifera',8)
  end
  
  def teardown
    DBConnection.remove_connection
  end
  
  def test_fetch_region
    vf = Variation.find_by_name('ENSVVVI00603004').variation_features[0]
    assert_equal(8789,vf.seq_region_start)
    assert_equal(8789,vf.seq_region_end)
    assert_equal('INTRONIC',vf.consequence_type)
    assert_equal('T/A',vf.allele_string)
    tv = vf.transcript_variations
    t = tv[0].transcript
    assert_equal("GSVIVT01004799001",t.stable_id)
  end
  
  
  
  
end