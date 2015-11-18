#!/usr/local/bin/perl
use Bio::SeqIO;
use Bio::Factory::EMBOSS;

$factory = new Bio::Factory::EMBOSS;
$app = $factory->program("getorf");
%input = ( -sequence => "raynolds.fas", -outseq =>"orf.fas" );
$app->run(\%input);
