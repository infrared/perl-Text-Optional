use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Text::Optional',
    AUTHOR              => q{Michael Kroher <infrared@cpan.org>},
    VERSION_FROM        => 'lib/Text/Optional.pm',
    ABSTRACT_FROM       => 'lib/Text/Optional.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Text-Optional-*' },
);
