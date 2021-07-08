=head1 NAME

t/lib/OrderProcessor/Controller/Order/get_order_info.t

=head1 DESCRIPTION

UNIT-тесты метода OrderProcessor::Controller::Order::get_order_info.

=cut

use lib::abs '../../../../../lib';

use Test::Exception;
use Test::More::UTF8;
use Test::Spec;

use OrderProcessor::Controller::Order;

describe 'Если в метод OrderProcessor::Controller::Order::get_order_info не передать json,' => sub {
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
        OrderProcessor::Core->expects( 'select' )->never;
        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Order::get_order_info( $mojo );
    };
};

describe 'Если в метод OrderProcessor::Controller::Order::get_order_info передать пустой json,' => sub {
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
        OrderProcessor::Core->expects( 'select' )->never;
        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Order::get_order_info( $mojo );
    };
};

describe 'Если в метод OrderProcessor::Controller::Order::get_order_info передать json, где нет параметра "order_id",' => sub {
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
        OrderProcessor::Core->expects( 'select' )->never;
        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Order::get_order_info( $mojo );
    };
};

describe 'Если в метод OrderProcessor::Controller::Order::get_order_info передать json, где параметр "order_id" строка,' => sub {
    it 'тогда он вернёт ошибку "BAD_INPUT".' => sub {
        my $mojo                = mock();
        my $req                 = mock();
        my $json                = { any => 777, order_id => 'hundred' };
        my %render_input_expect = (
            json => {
                error => 'BAD_INPUT',
            },
        );

        $mojo->expects( 'req' )->returns( $req );
        $req->expects( 'json' )->returns( $json );
        OrderProcessor::Core->expects( 'select' )->never;
        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Order::get_order_info( $mojo );
    };
};

describe 'Если в метод OrderProcessor::Controller::Order::get_order_info передать json, где параметр "order_id" отрицательное число,' => sub {
    it 'тогда он вернёт ошибку "BAD_INPUT".' => sub {
        my $mojo                = mock();
        my $req                 = mock();
        my $json                = { any => 777, order_id => -100 };
        my %render_input_expect = (
            json => {
                error => 'BAD_INPUT',
            },
        );

        $mojo->expects( 'req' )->returns( $req );
        $req->expects( 'json' )->returns( $json );
        OrderProcessor::Core->expects( 'select' )->never;
        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Order::get_order_info( $mojo );
    };
};

describe 'Если в метод OrderProcessor::Controller::Order::get_order_info передать json, где параметр "order_id" "0",' => sub {
    it 'тогда он вернёт ошибку "BAD_INPUT".' => sub {
        my $mojo                = mock();
        my $req                 = mock();
        my $json                = { any => 777, order_id => 0 };
        my %render_input_expect = (
            json => {
                error => 'BAD_INPUT',
            },
        );

        $mojo->expects( 'req' )->returns( $req );
        $req->expects( 'json' )->returns( $json );
        OrderProcessor::Core->expects( 'select' )->never;
        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Order::get_order_info( $mojo );
    };
};

describe 'Если в метод OrderProcessor::Controller::Order::get_order_info передать json, где параметр "order_id" положительное число, заказа нет в базе,' => sub {
    it 'тогда он вернёт ошибку "ORDER_NOT_EXISTS".' => sub {
        my $mojo                = mock();
        my $req                 = mock();
        my $json                = { any => 777, order_id => 100 };
        my @select_input_expect = ( 100 );
        my %render_input_expect = (
            json => {
                error => 'ORDER_NOT_EXISTS',
            },
        );

        $mojo->expects( 'req' )->returns( $req );
        $req->expects( 'json' )->returns( $json );
        OrderProcessor::Core->expects( 'select' )->returns( sub {
            my ( @select_input_actual ) = @_;

            is_deeply \@select_input_actual, \@select_input_expect;

            return ( undef, undef );
        } );
        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Order::get_order_info( $mojo );
    };
};

describe 'Если в метод OrderProcessor::Controller::Order::get_order_info передать json, где параметр "order_id" положительное число, заказ есть в базе,' => sub {
    it 'тогда он вернёт инфо о заказе.' => sub {
        my $mojo                = mock();
        my $req                 = mock();
        my $json                = { any => 777, order_id => 1000 };
        my @select_input_expect = ( 1000 );
        my %render_input_expect = (
            json => {
                error => undef,
                cost  => 100,
                price => 105,
            },
        );

        $mojo->expects( 'req' )->returns( $req );
        $req->expects( 'json' )->returns( $json );
        OrderProcessor::Core->expects( 'select' )->returns( sub {
            my ( @select_input_actual ) = @_;

            is_deeply \@select_input_actual, \@select_input_expect;

            return ( 100, 105 );
        } );
        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Order::get_order_info( $mojo );
    };
};

runtests;
