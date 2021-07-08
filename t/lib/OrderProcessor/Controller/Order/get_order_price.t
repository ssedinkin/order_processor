=head1 NAME

t/lib/OrderProcessor/Controller/Order/get_order_price.t

=head1 DESCRIPTION

UNIT-тесты метода OrderProcessor::Controller::Order::get_order_price.

=cut

use lib::abs '../../../../../lib';

use Test::Exception;
use Test::More::UTF8;
use Test::Spec;

use OrderProcessor::Controller::Order;

describe 'Если в метод OrderProcessor::Controller::Order::get_order_price не передать json,' => sub {
    it 'тогда он вернёт ошибку "BAD_INPUT".' => sub {
        my $mojo                = mock();
        my $req                 = mock();
        my $json                = undef;
        my %render_input_expect = (
            json => {
                error => 'BAD_INPUT',
            },
        );

        $mojo->expects( 'req' )->returns( $req );
        $req->expects( 'json' )->returns( $json );
        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Order::get_order_price( $mojo );
    };
};

describe 'Если в метод OrderProcessor::Controller::Order::get_order_price передать пустой json,' => sub {
    it 'тогда он вернёт ошибку "BAD_INPUT".' => sub {
        my $mojo                = mock();
        my $req                 = mock();
        my $json                = {};
        my %render_input_expect = (
            json => {
                error => 'BAD_INPUT',
            },
        );

        $mojo->expects( 'req' )->returns( $req );
        $req->expects( 'json' )->returns( $json );
        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Order::get_order_price( $mojo );
    };
};

describe 'Если в метод OrderProcessor::Controller::Order::get_order_price передать json, где нет параметра "cost",' => sub {
    it 'тогда он вернёт ошибку "BAD_INPUT".' => sub {
        my $mojo                = mock();
        my $req                 = mock();
        my $json                = { any => 777 };
        my %render_input_expect = (
            json => {
                error => 'BAD_INPUT',
            },
        );

        $mojo->expects( 'req' )->returns( $req );
        $req->expects( 'json' )->returns( $json );
        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Order::get_order_price( $mojo );
    };
};

describe 'Если в метод OrderProcessor::Controller::Order::get_order_price передать json, где параметр "cost" строка,' => sub {
    it 'тогда он вернёт ошибку "BAD_INPUT".' => sub {
        my $mojo                = mock();
        my $req                 = mock();
        my $json                = { any => 777, cost => 'hundred' };
        my %render_input_expect = (
            json => {
                error => 'BAD_INPUT',
            },
        );

        $mojo->expects( 'req' )->returns( $req );
        $req->expects( 'json' )->returns( $json );
        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Order::get_order_price( $mojo );
    };
};

describe 'Если в метод OrderProcessor::Controller::Order::get_order_price передать json, где параметр "cost" отрицательное число,' => sub {
    it 'тогда он увеличит цену на 5 процентов и вернёт её.' => sub {
        my $mojo                = mock();
        my $req                 = mock();
        my $json                = { any => 777, cost => -100 };
        my %render_input_expect = (
            json => {
                error => 'BAD_INPUT',
            },
        );

        $mojo->expects( 'req' )->returns( $req );
        $req->expects( 'json' )->returns( $json );
        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Order::get_order_price( $mojo );
    };
};

describe 'Если в метод OrderProcessor::Controller::Order::get_order_price передать json, где параметр "cost" положительное число,' => sub {
    it 'тогда он увеличит цену на 5 процентов и вернёт её.' => sub {
        my $mojo                = mock();
        my $req                 = mock();
        my $json                = { any => 777, cost => 100 };
        my %render_input_expect = (
            json => {
                error => undef,
                price => 105,
            },
        );

        $mojo->expects( 'req' )->returns( $req );
        $req->expects( 'json' )->returns( $json );
        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Order::get_order_price( $mojo );
    };
};

runtests;
