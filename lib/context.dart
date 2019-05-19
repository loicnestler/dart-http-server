import 'dart:io';

import 'request.dart';
import 'response.dart';

class Context {

  Request req;
  Response res;

  Context(Request req, Response res) {
    this.req = req;
    this.res = res;
  }

  String get method {
    return this.req.method;
  }

  HttpHeaders get headers {
    return this.req.headers;
  }

  String get path {
    return this.req.path;
  }



  set status(int status) {
    this.res.status = status;
  }

  int get status {
    return this.res.status;
  }

  setCookie(cookie, [String value]) {
    this.res.setCookie(cookie, value);
  }

  List<Cookie> get cookies {
    return this.res.cookies;
  }

  set body(String context) {
    this.res.body = context;
  }

}