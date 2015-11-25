#!/usr/local/bin/perl
use Bio::Perl;
use Bio::Seq;
use Bio::SeqIO;

$in = Bio::SeqIO->new(-file => "reynolds.gb", -format => 'Genbank');
$out = Bio::SeqIO->new(-file => ">reynolds.fas", -format => 'Fasta' );

while ( my $seq = $ in->next_seq() ) {$out->write_seq($seq); }
