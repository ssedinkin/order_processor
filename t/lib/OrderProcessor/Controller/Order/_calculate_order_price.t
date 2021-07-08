=head1 NAME

t/lib/OrderProcessor/Controller/Order/_calculate_order_price.t

=head1 DESCRIPTION

UNIT-тесты метода OrderProcessor::Controller::Order::_calculate_order_price.

=cut

use lib::abs '../../../../../lib';

use Test::Exception;
use Test::More::UTF8;
use Test::Spec;

use OrderProcessor::Controller::Order;

describe 'Если в метод OrderProcessor::Controller::Order::_calculate_order_price передать "0",' => sub {
    it 'тогда он вернёт "0".' => sub {
        my $input  = 0;
        my $expect = 0;

        my $actual = OrderProcessor::Controller::Order::_calculate_order_price( $input );

        is $actual, $expect;
    };
};

describe 'Если в метод OrderProcessor::Controller::Order::_calculate_order_price передать "1000",' => sub {
    it 'тогда он вернёт "1050".' => sub {
        my $input  = 1000;
        my $expect = 1050;

        my $actual = OrderProcessor::Controller::Order::_calculate_order_price( $input );

        is $actual, $expect;
    };
};

describe 'Если в метод OrderProcessor::Controller::Order::_calculate_order_price передать "-777",' => sub {
    it 'тогда он вернёт "-815.85".' => sub {
        my $input  = -777;
        my $expect = -815.85;

        my $actual = OrderProcessor::Controller::Order::_calculate_order_price( $input );

        is $actual, $expect;
    };
};

runtests;
