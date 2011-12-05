#
# = test/unit/release_53/core/test_transform.rb - Unit test for Ensembl::Core
#
# Copyright::   Copyright (C) 2009
#               Jan Aerts <http://jandot.myopenid.com>
#               Francesco Strozzi <francesco.strozzi@gmail.com>
# License::     Ruby's
#
# $Id:

require File.expand_path File.join(File.dirname(__FILE__),"../../helper.rb")

include Ensembl::Core


# For all tests, the source (i.e. the seq_region that the feature is annotated
# on initially) remains forward.
#
# Same coordinate system: test names refer to direction of gene vs chromosome
class TransformOntoSameCoordinateSystem < Test::Unit::TestCase

  def setup
    DBConnection.connect('homo_sapiens', 60)
  end
  
  def teardown
    DBConnection.remove_connection
  end

  def test_fw
    source_gene = Gene.find_by_stable_id("ENSG00000242450")
    target_gene = source_gene.transform('chromosome')

    assert_equal('22', source_gene.seq_region.name)
    assert_equal(24349643, source_gene.seq_region_start)
    assert_equal(24349710, source_gene.seq_region_end)
    assert_equal(1, source_gene.seq_region_strand)
    assert_equal('22', target_gene.seq_region.name)
    assert_equal(24349643, target_gene.seq_region_start)
    assert_equal(24349710, target_gene.seq_region_end)
    assert_equal(1, target_gene.seq_region_strand)
  end

  def test_rev
    source_gene = Gene.find_by_stable_id("ENSG00000240339")
    target_gene = source_gene.transform('chromosome')
    assert_equal('22', source_gene.seq_region.name)
    assert_equal(24349560, source_gene.seq_region_start)
    assert_equal(24349631, source_gene.seq_region_end)
    assert_equal(-1, source_gene.seq_region_strand)
    assert_equal('22', target_gene.seq_region.name)
    assert_equal(24349560, target_gene.seq_region_start)
    assert_equal(24349631, target_gene.seq_region_end)
    assert_equal(-1, target_gene.seq_region_strand)
  end

end