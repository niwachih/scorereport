#!usr/bin/perl
use strict;
use warnings;
use Cwd;
print "Remove invalid student record from score report...\n";
print "invalid: study time is 0.00 hour\n";
my $mypath = getcwd();
print "The current directory is: $mypath\n";
my $filename = 'H:\ubuntushare\apue-testprogram\score.txt';
my $outputfile = 'H:\ubuntushare\apue-testprogram\score-rmzero.txt';
open(SRC,'<',$filename) or die $!;
open(DES,'>',$outputfile) or die $!;
print "File $filename opened successfully!!\n";
my @idqueue = ();
while(<SRC>)
{
	my $id = ReadstudentID($_);
	my $studyhour = Xtracthour($_);
	if($studyhour eq "0.00")
	{
		print("STUDENT ID: ",$id," STUDY TIME: ",$studyhour,"\n");
		unshift(@idqueue,$id);
	}
	else
	{
		print DES $_;
	}
}
print "Finish writing new report to file $outputfile!!!\n";
close(SRC);
close(DES);

sub Xtracthour
{
	my $str = $_[0];
	#CHIH: get 1st item from function input array
	for(my $i=0;$i<2;$i++)
	{
		my $j = index($str,chr(9));
		$str = substr($str,$j+1,length($str)-$j);
	}
	#CHIH: shrink 2 tabs to find item
	$str = substr($str,0,4);
	return $str;
}
sub ReadstudentID
{
	my $str = $_[0];
	return substr($str,0,9);
}
#perl removeblank.pl
#Remove invalid student record from score report...
#invalid: study time is 0.00 hour
#The current directory is: H:/myperl
#File score.txt opened successfully!!
#STUDENT ID: 494415010 STUDY TIME: 0.00
#STUDENT ID: 494415024 STUDY TIME: 0.00
#STUDENT ID: 494415097 STUDY TIME: 0.00
#Finish writing new report to file score-rmzero.txt!!!
