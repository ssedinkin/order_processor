=head1 NAME

t/lib/OrderProcessor/Controller/Example/welcome.t

=head1 DESCRIPTION

UNIT-тесты метода OrderProcessor::Controller::Example::welcome.

=cut

use lib::abs '../../../../../lib';

use Test::More::UTF8;
use Test::Spec;

use OrderProcessor::Controller::Example;

describe 'Если вызвать метод OrderProcessor::Controller::Example::welcome,' => sub {
    it 'тогда он отрендерит стандартную страницу.' => sub {
        my $mojo                = mock();
        my %render_input_expect = ( msg => 'Welcome to the Mojolicious real-time web framework!' );

        $mojo->expects( 'render' )->returns( sub {
            my ( $self, %render_input_actual ) = @_;

            is_deeply \%render_input_actual, \%render_input_expect;

            return;
        } );

        OrderProcessor::Controller::Example::welcome( $mojo );
    };
};

runtests;
