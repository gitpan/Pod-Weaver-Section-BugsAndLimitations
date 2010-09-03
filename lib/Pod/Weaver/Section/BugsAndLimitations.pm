use 5.008;
use strict;
use warnings;

package Pod::Weaver::Section::BugsAndLimitations;
BEGIN {
  $Pod::Weaver::Section::BugsAndLimitations::VERSION = '1.102460';
}

# ABSTRACT: Add a BUGS AND LIMITATIONS pod section
use Moose;
with 'Pod::Weaver::Role::Section';
use namespace::autoclean;
use Moose::Autobox;

sub weave_section {
    my ($self, $document, $input) = @_;
    my $bugtracker = $input->{zilla}->distmeta->{resources}{bugtracker}{url}
      || 'http://rt.cpan.org';
    $document->children->push(
        Pod::Elemental::Element::Nested->new(
            {   command  => 'head1',
                content  => 'BUGS AND LIMITATIONS',
                children => [
                    Pod::Elemental::Element::Pod5::Ordinary->new(
                        {   content => <<EOPOD,
No bugs have been reported.

Please report any bugs or feature requests through the web interface at
L<$bugtracker>.
EOPOD
                        }
                    ),
                ],
            }
        ),
    );
}
1;


__END__
=pod

=for test_synopsis 1;
__END__

=head1 NAME

Pod::Weaver::Section::BugsAndLimitations - Add a BUGS AND LIMITATIONS pod section

=head1 VERSION

version 1.102460

=head1 SYNOPSIS

In C<weaver.ini>:

    [BugsAndLimitations]

=head1 OVERVIEW

This section plugin will produce a hunk of Pod that refers to the bugtracker
URL.

You need to use L<Dist::Zilla::Plugin::Bugtracker> in your C<dist.ini> file,
because this plugin relies on information that other plugin generates.

=head1 FUNCTIONS

=head2 weave_section

adds the C<BUGS AND LIMITATIONS> section.

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests through the web interface at
L<http://rt.cpan.org>.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit L<http://www.perl.com/CPAN/> to find a CPAN
site near you, or see L<http://search.cpan.org/dist/Pod-Weaver-Section-BugsAndLimitations/>.

The development version lives at L<http://github.com/hanekomu/Pod-Weaver-Section-BugsAndLimitations>
and may be cloned from L<git://github.com/hanekomu/Pod-Weaver-Section-BugsAndLimitations>.
Instead of sending patches, please fork this project using the standard
git and github infrastructure.

=head1 AUTHOR

Marcel Gruenauer <marcel@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Marcel Gruenauer.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

