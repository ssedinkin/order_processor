package OrderProcessor::Controller::Order;

=head1 NAME

OrderProcessor::Controller::Example

=head1 DESCRIPTION

Основной контроллер с логикой заказа.

=cut

use Carp;
use Mojo::Base 'Mojolicious::Controller', -signatures;

my $COMISSION_PERCENT = 5;

=head1 METHODS

=head2 get_order_price

Метод запроса стоимости заказа.
На вход принимает цену товара.
Возвращает стоимость - сумму с комиссией 5%.

Отрендерит ответ в JSON.

IN:
    $self - объект Mojolicious

OUT:
    не важен - используется в void-контексте

=cut

sub get_order_price {
    my ( $self ) = @_;

    my $input  = $self->req->json;
    my $output = { error => undef };

    if ( !defined $input->{cost} ) {
        $output->{error} = 'BAD_INPUT';
    }
    elsif ( $input->{cost} =~ /^(\d+)$/ ) {
        my $cost = $1;

        $output->{price} = $cost + ( $cost * $COMISSION_PERCENT / 100 );
    }
    else {
        $output->{error} = 'BAD_INPUT';
    }

    $self->render( json => $output );
}

1;
