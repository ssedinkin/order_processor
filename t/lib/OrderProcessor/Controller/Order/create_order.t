=head1 NAME

t/lib/OrderProcessor/Controller/Order/create_order.t

=head1 DESCRIPTION

UNIT-тесты метода OrderProcessor::Controller::Order::create_order.

=cut

use lib::abs '../../../../../lib';

use Test::Exception;
use Test::More::UTF8;
use Test::Spec;

use OrderProcessor::Controller::Order;

describe 'Если в метод OrderProcessor::Controller::Order::create_order не передать json,' => sub {
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
        OrderProcessor::Controller::Order->expects( '_calculate_order_price' )->never;
        OrderProcessor::Core->expects( 'insert' )->never;
        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Order::create_order( $mojo );
    };
};

describe 'Если в метод OrderProcessor::Controller::Order::create_order передать пустой json,' => sub {
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
        OrderProcessor::Controller::Order->expects( '_calculate_order_price' )->never;
        OrderProcessor::Core->expects( 'insert' )->never;
        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Order::create_order( $mojo );
    };
};

describe 'Если в метод OrderProcessor::Controller::Order::create_order передать json без параметра "cost",' => sub {
    it 'тогда он вернёт ошибку "BAD_INPUT".' => sub {
        my $mojo                = mock();
        my $req                 = mock();
        my $json                = {
            any => 777,
        };
        my %render_input_expect = (
            json => {
                error => 'BAD_INPUT',
            },
        );

        $mojo->expects( 'req' )->returns( $req );
        $req->expects( 'json' )->returns( $json );
        OrderProcessor::Controller::Order->expects( '_calculate_order_price' )->never;
        OrderProcessor::Core->expects( 'insert' )->never;
        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Order::create_order( $mojo );
    };
};

describe 'Если в метод OrderProcessor::Controller::Order::create_order передать json с параметром "cost" строкой,' => sub {
    it 'тогда он вернёт ошибку "BAD_INPUT".' => sub {
        my $mojo                = mock();
        my $req                 = mock();
        my $json                = {
            any  => 777,
            cost => 777,
        };
        my %render_input_expect = (
            json => {
                error => 'BAD_INPUT',
            },
        );

        $mojo->expects( 'req' )->returns( $req );
        $req->expects( 'json' )->returns( $json );
        OrderProcessor::Controller::Order->expects( '_calculate_order_price' )->never;
        OrderProcessor::Core->expects( 'insert' )->never;
        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Order::create_order( $mojo );
    };
};

describe 'Если в метод OrderProcessor::Controller::Order::create_order передать json с параметром "cost" "0",' => sub {
    it 'тогда он вернёт ошибку "BAD_INPUT".' => sub {
        my $mojo                = mock();
        my $req                 = mock();
        my $json                = {
            any  => 777,
            cost => -100,
        };
        my %render_input_expect = (
            json => {
                error => 'BAD_INPUT',
            },
        );

        $mojo->expects( 'req' )->returns( $req );
        $req->expects( 'json' )->returns( $json );
        OrderProcessor::Controller::Order->expects( '_calculate_order_price' )->never;
        OrderProcessor::Core->expects( 'insert' )->never;
        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Order::create_order( $mojo );
    };
};

describe 'Если в метод OrderProcessor::Controller::Order::create_order передать json с параметром "cost" "0",' => sub {
    it 'тогда он вернёт ошибку "BAD_INPUT".' => sub {
        my $mojo                = mock();
        my $req                 = mock();
        my $json                = {
            any  => 777,
            cost => 0,
        };
        my %render_input_expect = (
            json => {
                error => 'BAD_INPUT',
            },
        );

        $mojo->expects( 'req' )->returns( $req );
        $req->expects( 'json' )->returns( $json );
        OrderProcessor::Controller::Order->expects( '_calculate_order_price' )->never;
        OrderProcessor::Core->expects( 'insert' )->never;
        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Order::create_order( $mojo );
    };
};

describe 'Если в метод OrderProcessor::Controller::Order::create_order передать json с параметром "cost" "100",' => sub {
    it 'тогда он вернёт ошибку "BAD_INPUT".' => sub {
        my $mojo                = mock();
        my $req                 = mock();
        my $json                = {
            any  => 777,
            cost => 100,
        };
        my %render_input_expect = (
            json => {
                error => 'BAD_INPUT',
            },
        );

        $mojo->expects( 'req' )->returns( $req );
        $req->expects( 'json' )->returns( $json );
        OrderProcessor::Controller::Order->expects( '_calculate_order_price' )->never;
        OrderProcessor::Core->expects( 'insert' )->never;
        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Order::create_order( $mojo );
    };
};

describe 'Если в метод OrderProcessor::Controller::Order::create_order передать json с параметром "cost" "0" и параметром "price" строкой,' => sub {
    it 'тогда он вернёт ошибку "BAD_INPUT".' => sub {
        my $mojo                = mock();
        my $req                 = mock();
        my $json                = {
            any   => 777,
            cost  => 0,
            price => "zero",
        };
        my %render_input_expect = (
            json => {
                error => 'BAD_INPUT',
            },
        );

        $mojo->expects( 'req' )->returns( $req );
        $req->expects( 'json' )->returns( $json );
        OrderProcessor::Controller::Order->expects( '_calculate_order_price' )->never;
        OrderProcessor::Core->expects( 'insert' )->never;
        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Order::create_order( $mojo );
    };
};

describe 'Если в метод OrderProcessor::Controller::Order::create_order передать json с параметром "cost" "100" и параметром "price" "-100",' => sub {
    it 'тогда он вернёт ошибку "BAD_INPUT".' => sub {
        my $mojo                = mock();
        my $req                 = mock();
        my $json                = {
            any   => 777,
            cost  => 100,
            price => -100,
        };
        my %render_input_expect = (
            json => {
                error => 'BAD_INPUT',
            },
        );

        $mojo->expects( 'req' )->returns( $req );
        $req->expects( 'json' )->returns( $json );
        OrderProcessor::Controller::Order->expects( '_calculate_order_price' )->never;
        OrderProcessor::Core->expects( 'insert' )->never;
        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Order::create_order( $mojo );
    };
};

describe 'Если в метод OrderProcessor::Controller::Order::create_order передать json с параметром "cost" "100" и параметром "price" "100",' => sub {
    it 'тогда он вернёт ошибку "BAD_INPUT".' => sub {
        my $mojo                = mock();
        my $req                 = mock();
        my $json                = {
            any   => 777,
            cost  => 100,
            price => 100,
        };
        my @calc_input_expect   = ( 100 );
        my $calc_res            = 105;
        my %render_input_expect = (
            json => {
                error => 'BAD_INPUT',
            },
        );

        $mojo->expects( 'req' )->returns( $req );
        $req->expects( 'json' )->returns( $json );
        OrderProcessor::Controller::Order->expects( '_calculate_order_price' )->returns( sub {
            my ( @calc_input_actual ) = @_;

            is_deeply \@calc_input_actual, \@calc_input_expect;

            return $calc_res;
        } );
        OrderProcessor::Core->expects( 'insert' )->never;
        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Order::create_order( $mojo );
    };
};

describe 'Если в метод OrderProcessor::Controller::Order::create_order передать json с параметром "cost" "100" и параметром "price" "105",' => sub {
    it 'тогда он вернёт order_id.' => sub {
        my $mojo                = mock();
        my $req                 = mock();
        my $json                = {
            any   => 777,
            cost  => 100,
            price => 105,
        };
        my @calc_input_expect   = ( 100 );
        my $calc_res            = 105;
        my @insert_input_expect = ( 100, 105 );
        my $insert_res          = 100500;
        my %render_input_expect = (
            json => {
                error    => undef,
                order_id => 100500,
            },
        );

        $mojo->expects( 'req' )->returns( $req );
        $req->expects( 'json' )->returns( $json );
        OrderProcessor::Controller::Order->expects( '_calculate_order_price' )->returns( sub {
            my ( @calc_input_actual ) = @_;

            is_deeply \@calc_input_actual, \@calc_input_expect;

            return $calc_res;
        } );
        OrderProcessor::Core->expects( 'insert' )->returns( sub {
            my ( @insert_input_actual ) = @_;

            is_deeply \@insert_input_actual, \@insert_input_expect;

            return $insert_res;
        } );
        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Order::create_order( $mojo );
    };
};

runtests;
