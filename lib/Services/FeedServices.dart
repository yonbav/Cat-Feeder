import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../Data/Feed/Feed.dart';
import '../Globals.dart';
import 'dart:io';

Future<List<Feed>> getAllFeeds() async {
  final response = await http.get(serverURL + "/?TableName=Feeds");
  print(response.body);
  return allFeedsFromJson(response.body);
}

Future<http.Response> createFeed(Feed feed) async{
  final response = await http.post('$serverURL',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: json.encode(feed)
  );
  print(response.body);
  return response;
}

Future<http.Response> deleteFeed(String feedId) async{
  final response = await http.delete('$serverURL',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      }
  );
  return response;
}