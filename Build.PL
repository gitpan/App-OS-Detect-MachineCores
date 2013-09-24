
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Executable for App::OS::Detect::MachineCores",
  "dist_author" => [
    "Daniel B. <dbr\@cpan.org>"
  ],
  "dist_name" => "App-OS-Detect-MachineCores",
  "dist_version" => "1.0.0",
  "license" => "unrestricted",
  "module_name" => "App::OS::Detect::MachineCores",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Carp" => 0,
    "FindBin" => 0,
    "Moo" => 0,
    "MooX::Options" => 0,
    "lib" => 0,
    "perl" => "v5.10.0",
    "strict" => 0,
    "true" => 0,
    "warnings" => 0
  },
  "script_files" => [
    "bin/mcores",
    "bin/mcores"
  ],
  "test_requires" => {
    "ExtUtils::MakeMaker" => 0,
    "File::Spec::Functions" => 0,
    "List::Util" => 0,
    "Scalar::Util" => 0,
    "Test::CheckDeps" => "0.006",
    "Test::More" => "0.94",
    "Test::UseAllModules" => 0
  }
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  my $tr = delete $module_build_args{test_requires};
  my $br = $module_build_args{build_requires};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
