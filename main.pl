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
	
	my $output_file = "output.txt"; # Change this
	my @log_array = Read_log_file("test.log"); # Change this
	
	print("Provide a word you want to search => ");
	
	my $word = <>;
	chomp($word);
		
	my @filtered_array = grep { $_ =~ /\Q$word\E/i } @log_array;

	if (@filtered_array) {
		open(my $out, '>', $output_file) or die "Could not open file '$output_file' $!";
           	print $out @filtered_array;
           	close($out);
            	print "Results written to $output_file\n";
    	} else {
        	print "No matching lines found.\n";
    	}
		

}

Main();

# Created by spAce 09/27/2024

