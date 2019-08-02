import 'package:http/http.dart' as http;
import 'dart:async';
import '../Data/FeedModel/FeedModel.dart';
import '../Globals.dart';
import 'dart:io';

Future<List<FeedModel>> getAllFeeds() async {
  final response = await http.get(serverURL + "/?TableName=Feeds");
  print(response.body);
  return allFeedsFromJson(response.body);
}

Future<http.Response> createFeed(FeedModel feed) async{
  var body = feedToAddJson(feed);
  print(body);
  final response = await http.post('$serverURL',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: body,
  );
  print(response.body);
  return response;
}

Future<http.Response> deleteFeed(String feedId) async{
  //var body = feedToDeleteJson(feedId);
  final response = await http.delete('$serverURL',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      }
  );
  return response;
}