import 'dart:io';

import 'lib/request.dart';
import 'lib/response.dart';

import 'lib/statusCodes.dart';

class Server {
  int port;
  bool localOnly;
  List<Function> middlewares = [];

  HttpServer server;

  /// Creates a new instance of [Server]
  ///
  /// Set the port with `port: 9999` and listen globally by setting `localOnly` to false
  Server({int port: 8080, bool localOnly: true}) {
    this.port = port;
    this.localOnly = localOnly;
  }

  /// Begins to listen on the previously set `port`
  listen() async {
    this.server = await HttpServer.bind(
        this.localOnly ? InternetAddress.loopbackIPv4 : InternetAddress.anyIPv4,
        this.port);

    await for (HttpRequest request in this.server) {
      for (int i = 0; i < middlewares.length; i++) {
        // for(Function cb in middlewares) {
        final Function cb = middlewares[i];
        cb(new Request(request), new Response(request.response));
        cb(new Request(request), new Response(request.response),
            i + 1 <= middlewares.length ? middlewares[i + 1] : () {});
      }

      request.response..close();
    }
  }

  /// Stops the server
  ///
  /// [force] kills the server
  stop({bool force: false}) {
    this.server.close(force: force);
  }

  /// Adds a middleware function
  use(Function cb) {
    middlewares.add(cb);
  }
}
