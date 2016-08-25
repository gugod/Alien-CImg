use strict;
use warnings;

use Alien::Base::ModuleBuild '0.025';

my $builder = Alien::Base::ModuleBuild->new (
    module_name => 'Alien::CImg',
    license => 'mit',
    configure_requires => {
        'Alien::Base' => '0.025',
        'Module::Build' => '0.38',
        'Test::More' => 0,
    },
    requires => {
        'perl' => '5.8.1',
        'Alien::Base' => '0.025',
    },
    dist_author => 'Kang-min Liu <gugod@gugod.org>',
    alien_name => 'cimg',
    alien_repository => {
        protocol => 'http',
        host => 'cimg.eu',
        location => '/files/',
        exact_path  => 'CImg_latest.zip',
    }
);


$builder->create_build_script;
