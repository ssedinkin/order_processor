package OrderProcessor;

=head1 NAME

OrderProcessor

=head1 DESCRIPTION

Подготавливает приложение:
    - плагины
    - конфиги
    - сикреты
    - роуты

=cut

use Mojo::Base 'Mojolicious', -signatures;

=head1 METHODS

=head2 startup

Подготовка приложения перед стартом.
Возьмет секретный пароль из секретного конфига, пропишет его в secrets.
Пропишет роуты в routes.

! Внимание. Запустится 1 раз при старте приложения.

IN:
    $self - объект Mojolicious

OUT:
    не важен - используется в void-контексте

=cut

sub startup {
    my ( $self ) = @_;

    # Load configuration from config file
    my $config = $self->plugin('NotYAMLConfig');

    # Configure the application
    $self->secrets($config->{secrets});

    # Router
    my $r = $self->routes;

    # Normal route to controller
    $r->get('/')->to('Example#welcome');
}

1;
