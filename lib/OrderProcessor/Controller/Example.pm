package OrderProcessor::Controller::Example;

=head1 NAME

OrderProcessor::Controller::Example

=head1 DESCRIPTION

Контроллер для страницы "/".

=cut

use Mojo::Base 'Mojolicious::Controller', -signatures;

=head1 METHODS

=head2 welcome

Отрендерит стандартную страницу "/".

IN:
    $self - объект Mojolicious

OUT:
    не важен - используется в void-контексте

=cut

sub welcome {
    my ( $self ) = @_;

    # Render template "example/welcome.html.ep" with message
    $self->render(msg => 'Welcome to the Mojolicious real-time web framework!');
}

1;
