=head1 NAME

t/lib/OrderProcessor/Core/select.t

=head1 DESCRIPTION

UNIT-тесты метода OrderProcessor::Core::select.

=cut

use lib::abs '../../../../lib';

use Test::Exception;
use Test::More::UTF8;
use Test::Spec;

use OrderProcessor::Core;

describe 'Метод OrderProcessor::Core::select упадёт,' => sub {
    it 'потому что он не реализован' => sub {
        dies_ok sub { OrderProcessor::Core::select() };

        like $@, qr/not implemented/;
    };
};

runtests;
