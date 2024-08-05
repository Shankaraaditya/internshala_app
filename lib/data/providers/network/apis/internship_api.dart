import 'dart:io';
import 'package:internshala_app/data/providers/network/api_endpoint.dart';
import 'package:internshala_app/data/providers/network/api_provider.dart';
import 'package:internshala_app/data/providers/network/api_request_representable.dart';

class InternshalaAPI implements APIRequestRepresentable {
  InternshalaAPI._();

  InternshalaAPI.fetchInternships();

  @override
  String get endpoint => APIEndpoint.internshalaAPI;

  @override
  HttpMethod get method {
    return HttpMethod.get;
  }

  Map<String, String> get headers =>
      {HttpHeaders.contentTypeHeader: 'application/json'};

  Map<String, String> get query {
    return {HttpHeaders.contentTypeHeader: 'application/json'};
  }

  @override
  get body => null;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint;

  @override
  String get path => "";
}
