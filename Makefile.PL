package AppPollenMakeMaker;

use strict;
use warnings;
use ExtUtils::MakeMaker;

sub MY::postamble {
  return qq{

misc : readme distcheck manifest

release : test misc dist
\tcpan-upload \$(DISTVNAME).tar.gz

};
}

WriteMakefile(
  NAME             => 'App::Pollen',
  AUTHOR           => 'Jeff Ober <sysread@fastmail.fm>',
  VERSION_FROM     => "bin/pollen",
  ABSTRACT_FROM    => 'README.pod',
  LICENSE          => 'perl_5',
  MIN_PERL_VERSION => '5.010',
  PREREQ_PRINT     => 1,

  META_MERGE => {
    'meta-spec' => {
      version => 2,
    },

    resources => {
      homepage => "https://github.com/sysread/App-Pollen",

      bugtracker => {
        web => "https://github.com/sysread/App-Pollen/issues"
      },

      repository => {
        type => "git",
        url  => "https://github.com/sysread/App-Pollen.git",
        web  => "https://github.com/sysread/App-Pollen"
      }
    },
  },

  MAN3PODS => {
    'README.pod' => "blib/man3/App::Pollen.3",
  },

  EXE_FILES => ['bin/pollen'],

  test => {
    TESTS => 't/*',
  },

  clean => {
    FILES => "*.bak App-Pollen-*.tar.gz",
  },

  BUILD_REQUIRES => {
    'ExtUtils::MakeMaker' => '6.63_03',
  },

  TEST_REQUIRES => {
  },

  PREREQ_PM => {
    'JSON::XS' => 0,
  },
);

1;
