

use lib './lib';

use strict;
use warnings;

use Text::Optional;

my $ob = Text::Optional->new;

$ob->check('conf(igure) t(erminal)', 'conf z') ? return : die;
