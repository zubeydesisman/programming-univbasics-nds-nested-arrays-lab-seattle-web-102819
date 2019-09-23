require 'spec_helper'

describe 'When a learning to build nested arrays,' do
  it 'the assembled_matrix method returns a nested array made from two constants' do
    expect(assembled_matrix).to eq([ENNET_HOUSE, ENFIELD_TENNIS_ACADEMY])
  end

  it 'the array_literal_matrix method returns a nested array made made from a literal with sorted elements' do
    expect(array_literal_matrix).to eq([ENNET_HOUSE.sort, ENFIELD_TENNIS_ACADEMY.sort])
  end
end

describe 'When a learning to perform lookups in nested arrays,' do
  describe 'when given a matrix, row, and column argument,' do
    it 'the matrix_lookup method returns the requested value' do
      expect(matrix_lookup(assembled_matrix, 1, 1)).to eq("Lyle")
    end 
  end 
end

describe 'When a learning to update cells in nested arrays,' do
  describe 'when given a matrix, row, column, and new_value argument,' do
    it 'the matrix_update method returns an updated matrix' do
      local_copy_of_matrix = assembled_matrix.dup
      result = matrix_update(local_copy_of_matrix, 0, 2, "Tiny Ewell")
      expect(result[0]).to eq(["Don Gately", "Joelle van Dyne", "Tiny Ewell", "Kate Gompert", "Bruce Green"])
    end
  end
end
