
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
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
  "configure_requires" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Executable for App::OS::Detect::MachineCores",
  "dist_author" => [
    "Daniel B. <dbr\@cpan.org>"
  ],
  "dist_name" => "App-OS-Detect-MachineCores",
  "dist_version" => "0.035",
  "license" => "unrestricted",
  "module_name" => "App::OS::Detect::MachineCores",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "FindBin" => 0,
    "Moo" => 0,
    "MooX::Options" => 0,
    "perl" => "5.010",
    "strict" => 0,
    "true" => 0,
    "warnings" => 0
  },
  "script_files" => [
    "bin/mcores",
    "bin/mcores"
  ]
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
