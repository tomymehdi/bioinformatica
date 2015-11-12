#!/usr/bin/env ruby
require 'bio'
require 'debugger'
 
genbank_sequences = Bio::FlatFile.auto(ARGF)
 
genbank_sequences.each do |genbank|
   unless genbank.seq().empty?
      puts genbank.entry_id
      puts 'sequence'
      puts genbank.seq()
      puts 'translations'
      frame_positions = [-3, -2, -1, 1, 2, 3]
      frame_positions.each do |frame_position|
         puts genbank.seq().translate(frame_position).to_fasta
      end
      puts 'end'
   end
end
