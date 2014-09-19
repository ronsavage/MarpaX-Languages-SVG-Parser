package MarpaX::Languages::SVG::Parser::Filer;

use strict;
use utf8;
use warnings;
use warnings  qw(FATAL utf8);    # Fatalize encoding glitches.
use open      qw(:std :utf8);    # Undeclared streams in UTF-8.
use charnames qw(:full :short);  # Unneeded in v5.16.

use File::Basename; # For basename().
use File::Slurp;    # For read_file().

use Moo;

our $VERSION = '1.02';

# ------------------------------------------------

sub get_files
{
	my($self, $dir_name, $type) = @_;

	opendir(my $fh, $dir_name);
	my(@file) = sort grep{! /metag.bnf/} grep{/$type$/} readdir $fh;
	closedir $fh;

	my(%file);

	for my $file_name (@file)
	{
		$file{basename($file_name, ".$type")} = $file_name;
	}

	return %file;

} # End of get_files.

# -----------------------------------------------

1;

=pod

=head1 NAME

L<MarpaX::Languages::SVG::Parser::Filer> - Helps generate the demo page for MarpaX::Languages::SVG::Parser

=head1 Synopsis

This module is only for use by the author of C<MarpaX::Languages::SVG::Parser::Filer>.

See scripts/generate.demo.pl.

=head1 Description

C<MarpaX::Languages::SVG::Parser::Filer> helps generate the demo page for L<MarpaX::Languages::SVG::Parser>.

=head1 Constructor and Initialization

=head2 Calling new()

C<new()> is called as C<< my($obj) = MarpaX::Languages::SVG::Parser::Filer -> new() >>.

It returns a new object of type C<MarpaX::Languages::SVG::Parser::Filer>.

=head1 Methods

=head2 get_files($dir_name, $type)

Returns a hash (sic) of files from the given $dir_name, whose type (extension) matches $type.

The hash is keyed by the file's basename. See L<File::Basename>.

The file share/metag.bnf is omitted from the set returned.

=head1 Version Numbers

Version numbers < 1.00 represent development versions. From 1.00 up, they are production versions.

=head1 Machine-Readable Change Log

The file Changes was converted into Changelog.ini by L<Module::Metadata::Changes>.

=head1 Support

Email the author, or log a bug on RT:

L<https://rt.cpan.org/Public/Dist/Display.html?Name=MarpaX::Languages::SVG::Parser::Filer>.

=head1 Author

L<MarpaX::Languages::SVG::Parser> was written by Ron Savage I<E<lt>ron@savage.net.auE<gt>> in 2013.

Home page: L<http://savage.net.au/index.html>.

=head1 Copyright

Australian copyright (c) 2013, Ron Savage.

	All Programs of mine are 'OSI Certified Open Source Software';
	you can redistribute them and/or modify them under the terms of
	The Artistic License, a copy of which is available at:
	http://www.opensource.org/licenses/index.html

=cut
