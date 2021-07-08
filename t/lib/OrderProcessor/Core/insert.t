=head1 NAME

t/lib/OrderProcessor/Core/insert.t

=head1 DESCRIPTION

UNIT-тесты метода OrderProcessor::Core::insert.

=cut

use lib::abs '../../../../lib';

use Test::Exception;
use Test::More::UTF8;
use Test::Spec;

use OrderProcessor::Core;

describe 'Метод OrderProcessor::Core::insert упадёт,' => sub {
    it 'потому что он не реализован' => sub {
        dies_ok sub { OrderProcessor::Core::insert() };

        like $@, qr/not implemented/;
    };
};

runtests;
