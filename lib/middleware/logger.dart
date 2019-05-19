import 'package:colorize/colorize.dart';

import '../request.dart';
import '../response.dart';

// logger(Request req, Response res, Function next) async {
logger(Request req, Response res) async {
  // await next();

  final Colorize method = new Colorize(req.method.toUpperCase());
  method.white();
  method.dark();

  final Colorize url = new Colorize(req.path);
  url.white();

  final int status = res.status;
  final Colorize statusString = new Colorize(status.toString());
  statusString.bold();

  if (status >= 200 && status <= 226)
    statusString.lightGreen();
  else if (status >= 300 && status <= 308)
    statusString.lightCyan();
  else if (status >= 400 && status <= 451)
    statusString.yellow();
  else if (status >= 500 && status <= 511)
    statusString.lightRed();
  else
    statusString.white();

  // TODO: request time & size
  print('${method} ${url} ${statusString} 12ms ­— 24kB');
}
