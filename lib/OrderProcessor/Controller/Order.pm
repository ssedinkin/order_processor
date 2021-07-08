package OrderProcessor::Controller::Order;

=head1 NAME

OrderProcessor::Controller::Example

=head1 DESCRIPTION

Основной контроллер с логикой заказа.

=cut

use lib::abs '../../../../../../lib';

use Carp;
use Mojo::Base 'Mojolicious::Controller', -signatures;

use OrderProcessor::Core;

my $COMISSION_PERCENT = 5;

=head1 METHODS

=head2 _calculate_order_price

Посчитать стоимость с комиссией.

IN:
    $cost - число, сколько стоит товар

OUT:
    $price - число, сколько стоит товар + комиссия

=cut

sub _calculate_order_price {
    my ( $cost ) = @_;

    return $cost + ( $cost * $COMISSION_PERCENT / 100 );
}

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

        $output->{price} = _calculate_order_price( $cost );
    }
    else {
        $output->{error} = 'BAD_INPUT';
    }

    $self->render( json => $output );
}

=head2 get_order_info

Метод запроса стоимости заказа.
На вход принимает цену товара.
Возвращает стоимость - сумму с комиссией 5%.

Отрендерит ответ в JSON.

IN:
    $self - объект Mojolicious

OUT:
    не важен - используется в void-контексте

=cut

sub get_order_info {
    my ( $self ) = @_;

    my $input  = $self->req->json;
    my $output = { error => undef };

    if ( !defined $input->{order_id} ) {
        $output->{error} = 'BAD_INPUT';
    }
    elsif ( $input->{order_id} =~ /^([1-9]\d*)$/ ) {
        my $order_id = $1;

        my ( $cost, $price ) = OrderProcessor::Core::select( $order_id );

        if ( !defined $cost && !defined $price ) {
            $output->{error} = 'ORDER_NOT_EXISTS';
        }
        else {
            $output->{cost}  = $cost;
            $output->{price} = $price;
        }
    }
    else {
        $output->{error} = 'BAD_INPUT';
    }

    $self->render( json => $output );
}

=head2 create_order

Метод запроса стоимости заказа.
На вход принимает цену товара.
Возвращает стоимость - сумму с комиссией 5%.

Отрендерит ответ в JSON.

IN:
    $self - объект Mojolicious

OUT:
    не важен - используется в void-контексте

=cut

sub create_order {
    my ( $self ) = @_;

    my $input  = $self->req->json;
    my $output = { error => undef };

    my $cost   = defined $input
        ? $input->{cost}
        : undef;

    my $price  = defined $input
        ? $input->{price}
        : undef;

    if ( !defined $cost || !defined $price ) {
        $output->{error} = 'BAD_INPUT';
    }
    elsif ( $cost =~ /^\d+$/ && $price =~ /^\d+$/ ) {
        my $calc_price = _calculate_order_price( $cost );

        if ( $calc_price != $price ) {
            $output->{error} = 'BAD_INPUT';
        }
        else {
            $output->{order_id} = OrderProcessor::Core::insert( $cost, $price );
        }
    }
    else {
        $output->{error} = 'BAD_INPUT';
    }

    $self->render( json => $output );
}

1;
