package OrderProcessor::Core;

=head1 NAME

OrderProcessor::Core

=head1 DESCRIPTION

Модуль низкоуровневой работы с базой данных.
! Сюда должны приходить только проверенные и легитимные запросы.
! Если сюда придет запрос на дроп базы данных, то именно это и произойдёт.

=cut

use Carp;

=head1 METHODS

=head2 select

Метод запроса в базу данных.

! Внимание. Упадёт, потому что не реализовано.

IN:
    $order_id - id заказа в базе, целое положительное число

OUT:
    не реализовано, должен быть hashref

=cut

sub select {
    my ( $order_id ) = @_;

    confess 'not implemented';
}

=head2 insert

Метод запроса в базу данных.

! Внимание. Упадёт, потому что не реализовано.

IN:
    $cost  - цена заказа без коммиссии
    $price - стоимость заказа с комиссией

OUT:
    $order_id - id заказа в базе, целое положительное число, не реализовано

=cut

sub insert {
    my ( $cost, $price ) = @_;

    confess 'not implemented';
}

1;
