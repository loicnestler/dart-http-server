import 'dart:io';

class Request {

	HttpRequest _request;

	/// Creates a higher abstraction layer of the HttpRequest class
	/// 
	/// Saves [request] as a private member variable
	Request(HttpRequest request) {
		this._request = request;
	}

	/// Request method (`GET`, `POST`, `PUT`, etc.)
	String get method {
		return this._request.method;
	}

	/// Request header object
	HttpHeaders get headers {
		return this._request.headers;
	}
	
	/// Request header object
	HttpHeaders get header {
		return this.headers;
	}

	/// Full Uri object
	Uri get fullUri {
		return this._request.uri;
	}

	/// Request URL
	String get url {
		return this.fullUri.toString();
	}

	/// Request pathname
	String get path {
		// /test?test=true&count=10 => /test
		return this.url.substring(0, this.url.indexOf('?') != -1 ? this.url.indexOf('?') : this.url.length);
	}

}