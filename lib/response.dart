import 'dart:io';

class Response {

	HttpResponse _response;

	/// Creates a higher abstraction layer of the HttpResponse class
	Response(HttpResponse response) {
		this._response = response;
	}

	/// Set response status via numeric code
	set status(int status) {
		this._response.statusCode = status;
	}

	/// Get response status (default = `404`)
	int get status {
		return this._response.statusCode;
	}

	/// Set a cookie, either by providing [cookie] of type [Cookie] or by using the `name-value-schema`
	/// 
	/// `response.setCookie(new Cookie('secret', 'theCakeIsALie'))` or `respose.setCookie('secret', 'theCakeIsALie')`
	/// Using an instance of the [Cookie]-Class adds extra functionality such as setting the expiration time etc
	setCookie(cookie, [String value]) {
		if(cookie is Cookie)
			this._response.cookies.add(cookie);
		else if(cookie is String)
			this._response.cookies.add(new Cookie(cookie, value));
	}

	/// Get all cookies
	List<Cookie> get cookies {
		return this._response.cookies;
	}

	/// Sets the response's body
	set body(String content) {
		this._response..write(content);
	}

}