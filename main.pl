#!/usr/bin/perl

sub Read_log_file {

    my $log_file = $_[0]; 
    my @lines; 
    open(my $file, '<', $log_file) or die "Can't open file: $!";
    
    while (my $line = <$file>) {
        push(@lines, $line); 
    }

    close($file);

    return @lines;  
}


sub Main {

	
	my $out_file = $ARGV[1] or die "Usage $1 input_filename output_filename\n";	
	my $file = $ARGV[0] or die "Usage: $0 input_filename output_filename\n";
	my @log_array = Read_log_file($file);

	print("Provide a word you want to search => ");
	
	my $word = <STDIN>;
	chomp($word);
		
	my @filtered_array = grep { $_ =~ /\Q$word\E/i } @log_array;

	if (@filtered_array) {
		open(my $out, '>', $out_file) or die "Could not open file '$out_file' $!";
           	print $out @filtered_array;
           	close($out);
            	print "Results written to $out_file\n";
    	} else {
        	print "No matching lines found.\n";
    	}
		

}

Main();

# Created by spAce 09/27/2024

