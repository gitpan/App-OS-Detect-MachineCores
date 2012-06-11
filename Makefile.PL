
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Detect how many cores your machine has (OS-independently)",
  "AUTHOR" => "Daniel B. <dbr\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Carp" => 0,
    "ExtUtils::MakeMaker" => 0,
    "File::Spec::Functions" => 0,
    "List::Util" => 0,
    "Module::Build" => "0.3601",
    "Scalar::Util" => 0,
    "Test::CheckDeps" => "0.002",
    "Test::More" => "0.94",
    "Test::UseAllModules" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "DISTNAME" => "App-OS-Detect-MachineCores",
  "EXE_FILES" => [
    "bin/mcores",
    "bin/mcores"
  ],
  "LICENSE" => "perl",
  "NAME" => "App::OS::Detect::MachineCores",
  "PREREQ_PM" => {
    "Any::Moose" => 0,
    "FindBin" => 0,
    "MooseX::Getopt" => 0,
    "MooseX::Getopt::Dashes" => 0,
    "MooseX::Traits" => 0,
    "MouseX::Getopt" => 0,
    "MouseX::Getopt::Dashes" => 0,
    "MouseX::Traits" => 0,
    "strict" => 0,
    "true" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.011",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);


