package App::OS::Detect::MachineCores;
BEGIN {
  $App::OS::Detect::MachineCores::AUTHORITY = 'cpan:DBR';
}
{
  $App::OS::Detect::MachineCores::VERSION = '0.020';
}

#  PODNAME: App::OS::Detect::MachineCores
# ABSTRACT: Detect how many cores your machine has (OS-independently)

use Any::Moose;
use 5.010;
use true;

do {
    with 'MooseX::Getopt';
    with 'MooseX::Getopt::Dashes';
} if Any::Moose::_is_moose_loaded();

do {
    with 'MouseX::Getopt';
    with 'MouseX::Getopt::Dashes';
} unless Any::Moose::_is_moose_loaded();


has cores => (
    is         => 'ro',
    isa        => 'Int',
    traits     => [ 'NoGetopt' ],
    lazy_build => 1,
);
has os => (
    is         => 'ro',
    isa        => 'Str',
    traits     => ['NoGetopt'],
    lazy_build => 1,
);

has add_one => (
    is            => 'ro',
    isa           => 'Bool',
    default       => 0,
    traits        => [ 'Getopt', 'Bool' ],
    cmd_aliases   => ['i'],
    documentation => q{add one to the number of cores (useful in scripts)},
);

sub _build_cores {
    my $self = shift;
    given ($self->os) {
        when ('darwin') { $_ = `sysctl hw.ncpu | awk '{print \$2}'`; chomp; $_ }
        when ('linux')  { $_ = `grep processor < /proc/cpuinfo | wc -l`; chomp; $_ }
    }
}

sub _build_os { $^O }

around 'cores' => sub {
    my ($orig, $self, $set) = @_;
    return $self->$orig() + 1 if $self->add_one and not defined $set;
    return $self->$orig(); # otherwise
};


no Any::Moose;

__PACKAGE__->meta->make_immutable();


__END__
=pod

=encoding utf-8

=head1 NAME

App::OS::Detect::MachineCores - Detect how many cores your machine has (OS-independently)

=head1 VERSION

version 0.020

=head1 SYNOPSIS

On different system, different approaches are needed to detect the number of cores for that machine.

This Module is a wrapper around these different approaches.

=head1 USAGE

This module will install one executable, C<<< mcores >>>, in your bin.

It is really simple and straightforward:

     usage: mcores [-?i] [long options...]
         -? --usage --help  Prints this usage information.
         -i --add-one       add one to the number of cores (useful in scripts)

=head1 SUPPORTED SYSTEMS

=over

=item *

darwin (OSX)

=item *

Linux

=back

=head1 MOTIVATION

During development of dotfiles for different platforms I was searching for some way to be able to
transparantly detect the number of available cores and couldn't find one.
Also it is quite handy to be able to increment the number by simply using a little switch C<<< -i >>>.

Example:

     export TEST_JOBS=`mcores -i`

=head1 WARNING

Some questions with Dist::Zilla are still open, and although this module attempts to load L<Mouse> instead of L<Moose>,
unfortuantely, however, B<both> modules are installed as prerequisites. This will change soon.

=cut

=head1 AUTHOR

Daniel B. <dbr@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Daniel B..

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

