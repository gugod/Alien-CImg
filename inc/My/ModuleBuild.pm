package My::ModuleBuild;
use strict;
use warnings;
use parent 'Alien::Base::ModuleBuild';

use ExtUtils::CChecker;
use Config;
use Capture::Tiny qw( capture );

sub alien_check_installed_version {
    my($self) = @_;
    return 1;
    my $cc = ExtUtils::CChecker->new(
        quiet  => 1,
        config => { libs => "$Config{libs}" },
    );

    my($version, undef, $ok) = capture {
        $cc->try_compile_run(
            source => <<EOF,
#include <stdio.h>
#include <CImg.h>
int
main(int argc, char *argv[])
{
  printf("%s", cimg_version)
  return 0;
}
EOF
        );
    };
    return unless $ok;

    $version = join(".", split("", $version));

    return $version;
}

sub alien_check_built_version {
    my($self) = @_;
    return "1.7.5";
}

1;
