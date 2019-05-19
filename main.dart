import 'dart:io';

import 'lib/request.dart';
import 'lib/response.dart';
import 'server.dart';

import 'lib/middleware/logger.dart';

Future main() async {

	Server server = new Server();

  server.use(logger);

  server.use((Request req, Response res, Function next) async {
    if(req.path == '/404')
      res.status = 404;
    else if(req.path == '/502')
      res.status = 502;
    else if(req.path == '/302')
      res.status = 302;
  });



	server.listen();

}