package OrderProcessor;
use Mojo::Base 'Mojolicious', -signatures;

# This method will run once at server start
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
