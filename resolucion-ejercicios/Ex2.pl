#!/usr/local/bin/perl
# http://bioperl.org/pipermail/bioperl-l/2009-March/029415.html
use Bio::Tools::Run::RemoteBlast;
use Bio::SearchIO;
use Data::Dumper;

# Seteamos los parametros para BLAST
$prog = "blastx";
$db = "swissprot";
$e_val = "1e-10";

my @params = ( '-prog' => $prog, '-data' => $db, '-expect' => $e_val, '-readmethod' => 'SearchIO' );

my $remoteBlast = Bio::Tools::Run::RemoteBlast->new(@params);

# Creamos el BLAST
$infile = 'reynolds.fas';
$r = $remoteBlast->submit_blast($infile);

my $v = 1;
print STDERR "Esperando" if( $v > 0 );
while ( my @rids = $remoteBlast->each_rid ) {
  foreach my $rid ( @rids ) {
    my $rc = $remoteBlast->retrieve_blast($rid);
    if( !ref($rc) ) {
      if( $rc < 0 ) {
        $remoteBlast->remove_rid($rid);
      }
      print STDERR "." if ( $v > 0 );
      sleep 5;
    } else {
      my $result = $rc->next_result();
      # Guardamos el resultado
      my $filename = "Ex2.out";
      $remoteBlast->save_output($filename);
      $remoteBlast->remove_rid($rid);
      print "\nQuery Name: ", $result->query_name(), "\n";
      while ( my $hit = $result->next_hit ) {
        next unless ( $v > 0);
        print "\thit name is ", $hit->name, "\n";
        while( my $hsp = $hit->next_hsp ) {
          print "\t\tscore is ", $hsp->score, "\n";
        }
      }
    }
  }
}
