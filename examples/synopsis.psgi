use strict;
use FindBin;
use lib "$FindBin::Bin/../lib";

use JSON::RPC::PSGI::Server;
use Plack::Builder;

my $jsonrpc = JSON::RPC::PSGI::Server->new(
    methods => {
        echo  => sub { $_[0] },
        empty => sub {''}
    }
);
my $app = sub {
    [200, ['Content-Type' => 'text/plain'], ['Hello']];
};
builder {
    mount '/jsonrpc', $jsonrpc->to_app;
    mount '/' => $app;
};
