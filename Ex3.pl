#!/usr/local/bin/perl
use Bio::SearchIO;
use Bio::SeqIO;
use Bio::Search::Result::BlastResult;

my $blast_report = new Bio::SearchIO('-format' => 'Blast', '-file' => 'Ex2.out');
my $result = $blast_report->next_result;
my $pattern = $ARGV[0];
open (my $out, '>', 'hits.txt');

while( my $hit = $result->next_hit()) {
  if ($hit->description =~ /$pattern/i ) {
    print $out "Name: ";
    print $out $hit->name;
    print $out "\n";
    print $out "Accession: ";
    print $out $hit->accession;
    print $out "\n";
    print $out "Description: ";
    print $out $hit->description;
    print $out "\n";
    print $out "\n";
  }
}
