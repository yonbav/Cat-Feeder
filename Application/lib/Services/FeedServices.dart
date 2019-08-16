import 'package:http/http.dart' as http;
import 'dart:async';
import '../Data/FeedModel/FeedModel.dart';
import '../Globals.dart';
import 'dart:io';

Future<List<FeedModel>> getAllFeeds() async {
  print("request body: {}");
  final response = await http.get(serverURL + "/?TableName=Feeds");
  print("response body: " + response.body);
  return allFeedsFromJson(response.body);
}

Future<http.Response> createFeed(FeedModel feed) async{
  var body = feedToAddJson(feed);
  print("request body: " + body);
  final response = await http.put('$serverURL',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: body,
  );
  print("response body: " + response.body);
  return response;
}

Future<http.Response> deleteFeed(String feedId) async{
  var body = feedToDeleteJson(feedId);
  print("request body: " + body);
  final response = await http.post('$serverURL',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: body,
  );
  print("response body: " + response.body);
  return response;
}