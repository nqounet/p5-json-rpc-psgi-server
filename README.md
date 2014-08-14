[![Build Status](https://travis-ci.org/nqounet/p5-json-rpc-psgi-server.png?branch=master)](https://travis-ci.org/nqounet/p5-json-rpc-psgi-server)
# NAME

JSON::RPC::PSGI::Server - Yet another JSON-RPC 2.0 psgi application

# SYNOPSIS

    # app.psgi
    use JSON::RPC::PSGI::Server;
    use Plack::Builder;
    my $jsonrpc = JSON::RPC::PSGI::Server->new(
        methods => {
            echo  => sub { $_[0] },
            empty => sub {''}
        }
    );
    my $app = sub { [204, [], []] };
    builder {
        mount '/jsonrpc', $jsonrpc->to_app;
        mount '/' => $app;
    };

    # run
    $ plackup app.psgi

    # POST http://localhost:5000/jsonrpc
    #     {"jsonrpc":"2.0","method":"echo","params":"Hello","id":1}
    # return content
    #     {"jsonrpc":"2.0","result":"Hello","id":1}

# DESCRIPTION

JSON::RPC::PSGI::Server is Yet another JSON-RPC 2.0 psgi application

# LICENSE

Copyright (C) nqounet.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

nqounet <mail@nqou.net>
