=head1 NAME

t/lib/OrderProcessor/startup.t

=head1 DESCRIPTION

UNIT-тесты метода OrderProcessor::startup.

=cut

use lib::abs '../../../lib';

use Test::More::UTF8;
use Test::Spec;

use OrderProcessor;

describe 'Приложение не запущено. Когда его запустить, вызывается метод OrderProcessor::startup.' => sub {
    it 'Тогда он подготовит приложение.' => sub {
        my $mojo                    = mock();
        my $router                  = mock();
        my @plugin_input_expect     = ( 'NotYAMLConfig' );
        my $plugin_result           = { secrets => 'very_secret_hash' };
        my @secrets_input_expect    = ( 'very_secret_hash' );
        my @all_get_router_expects  = (
            '/',
        );
        my @all_to_router_expects   = (
            'Example#welcome',
        );

        $mojo->expects( 'plugin' )->returns( sub {
            my ( $self, @plugin_input_actual ) = @_;

            is_deeply \@plugin_input_actual, \@plugin_input_expect;

            return $plugin_result;
        } );
        $mojo->expects( 'secrets' )->returns( sub {
            my ( $self, @secrets_input_actual ) = @_;

            is_deeply \@secrets_input_actual, \@secrets_input_expect;

            return;
        } );
        $mojo->expects( 'routes' )->returns( $router );
        $router->expects( 'get' )->returns( sub {
            my ( $self, @router_get_input_actual ) = @_;

            my @router_get_input_expect = shift @all_get_router_expects;

            is_deeply \@router_get_input_actual, \@router_get_input_expect;

            return $router;
        } );
        $router->expects( 'to' )->returns( sub {
            my ( $self, @router_to_input_actual ) = @_;

            my @router_to_input_expect = shift @all_to_router_expects;

            is_deeply \@router_to_input_actual, \@router_to_input_expect;

            return $router;
        } );

        OrderProcessor::startup( $mojo );
    };
};

runtests;
