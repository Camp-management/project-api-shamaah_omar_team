import 'package:get_storage/get_storage.dart';

class ConstantApi {
  final baseURL = "https://api-week.onrender.com";
  // final authLoginEndPoint="/auth/login";
  final folderEndPoint = "/folders";
  final createFolderEndPoint = "/folder/create/";
  final updateFolderEndPoint = "/folder/update/";
  final deleteFolderEndPoint = "/folder/delete/";
  final bookmarksEndPoint = "/bookmarks";
  final createBookmarksEndPoint = "/create/";
  final updateDeleteBookmarksEndPoint = "/bookmark/";
  final bookmarksByFolderEndPoint = "/bookmarks/folder/";
  final signInEndPoint = "/sign_in/";
  final signUpEndPoint = "/sign_up/";
  Map<String, String> header = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  final box = GetStorage().read("token");

  //final token = "Bearer eyJhbGciOiJIUzI1NiIsImtpZCI6ImVrT3MrMlluOXROd1hwYzQiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL21pb3Fvb21yYmp2eGdwdmJ5cmpjLnN1cGFiYXNlLmNvL2F1dGgvdjEiLCJzdWIiOiJlNDlmZGJlMC1hZDIxLTQ4MDItYTAyMi0xYTFlZjIzZmYyZmIiLCJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzYwMTExODQzLCJpYXQiOjE3NjAxMDgyNDMsImVtYWlsIjoic2hhbWFhaEBleGFtcGxlLmNvbSIsInBob25lIjoiIiwiYXBwX21ldGFkYXRhIjp7InByb3ZpZGVyIjoiZW1haWwiLCJwcm92aWRlcnMiOlsiZW1haWwiXX0sInVzZXJfbWV0YWRhdGEiOnsiZW1haWwiOiJzaGFtYWFoQGV4YW1wbGUuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsInBob25lX3ZlcmlmaWVkIjpmYWxzZSwic3ViIjoiZTQ5ZmRiZTAtYWQyMS00ODAyLWEwMjItMWExZWYyM2ZmMmZiIn0sInJvbGUiOiJhdXRoZW50aWNhdGVkIiwiYWFsIjoiYWFsMSIsImFtciI6W3sibWV0aG9kIjoicGFzc3dvcmQiLCJ0aW1lc3RhbXAiOjE3NjAxMDgyNDN9XSwic2Vzc2lvbl9pZCI6ImVlZmQ2NmYxLTY3ODItNDM1ZS04MTY3LWE2MmE2ZTJiZmJjYyIsImlzX2Fub255bW91cyI6ZmFsc2V9.6Bw9hoGthCDlShukdE0talJqNG_6hXHdhRO-xdrMmEM";

  Map<String, String> foldersHeader = {
    "Accept": "application/json",
    // "Content-Type": "application/json",
    "Authorization": "Bearer ${GetStorage().read("token")}",
    // "Bearer eyJhbGciOiJIUzI1NiIsImtpZCI6ImVrT3MrMlluOXROd1hwYzQiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL21pb3Fvb21yYmp2eGdwdmJ5cmpjLnN1cGFiYXNlLmNvL2F1dGgvdjEiLCJzdWIiOiJlNDlmZGJlMC1hZDIxLTQ4MDItYTAyMi0xYTFlZjIzZmYyZmIiLCJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzYwMTE4NjY3LCJpYXQiOjE3NjAxMTUwNjcsImVtYWlsIjoic2hhbWFhaEBleGFtcGxlLmNvbSIsInBob25lIjoiIiwiYXBwX21ldGFkYXRhIjp7InByb3ZpZGVyIjoiZW1haWwiLCJwcm92aWRlcnMiOlsiZW1haWwiXX0sInVzZXJfbWV0YWRhdGEiOnsiZW1haWwiOiJzaGFtYWFoQGV4YW1wbGUuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsInBob25lX3ZlcmlmaWVkIjpmYWxzZSwic3ViIjoiZTQ5ZmRiZTAtYWQyMS00ODAyLWEwMjItMWExZWYyM2ZmMmZiIn0sInJvbGUiOiJhdXRoZW50aWNhdGVkIiwiYWFsIjoiYWFsMSIsImFtciI6W3sibWV0aG9kIjoicGFzc3dvcmQiLCJ0aW1lc3RhbXAiOjE3NjAxMTUwNjd9XSwic2Vzc2lvbl9pZCI6IjJkODMwYmZhLTcyYjUtNGRiMy1iMThmLTQxZDVhYTBlNzI1ZiIsImlzX2Fub255bW91cyI6ZmFsc2V9.3Zx1rPh2YNk_UxASYTXyWBcd_iyIvjUinISmcplNVcs",
  };

  Map<String, String> updateCreateHeader = {
    "Accept": "application/json",
    "Content-Type": "application/json",
    "Authorization": "Bearer ${GetStorage().read("token")}",
    // "Bearer eyJhbGciOiJIUzI1NiIsImtpZCI6ImVrT3MrMlluOXROd1hwYzQiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL21pb3Fvb21yYmp2eGdwdmJ5cmpjLnN1cGFiYXNlLmNvL2F1dGgvdjEiLCJzdWIiOiJlNDlmZGJlMC1hZDIxLTQ4MDItYTAyMi0xYTFlZjIzZmYyZmIiLCJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzYwMTE4NjY3LCJpYXQiOjE3NjAxMTUwNjcsImVtYWlsIjoic2hhbWFhaEBleGFtcGxlLmNvbSIsInBob25lIjoiIiwiYXBwX21ldGFkYXRhIjp7InByb3ZpZGVyIjoiZW1haWwiLCJwcm92aWRlcnMiOlsiZW1haWwiXX0sInVzZXJfbWV0YWRhdGEiOnsiZW1haWwiOiJzaGFtYWFoQGV4YW1wbGUuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsInBob25lX3ZlcmlmaWVkIjpmYWxzZSwic3ViIjoiZTQ5ZmRiZTAtYWQyMS00ODAyLWEwMjItMWExZWYyM2ZmMmZiIn0sInJvbGUiOiJhdXRoZW50aWNhdGVkIiwiYWFsIjoiYWFsMSIsImFtciI6W3sibWV0aG9kIjoicGFzc3dvcmQiLCJ0aW1lc3RhbXAiOjE3NjAxMTUwNjd9XSwic2Vzc2lvbl9pZCI6IjJkODMwYmZhLTcyYjUtNGRiMy1iMThmLTQxZDVhYTBlNzI1ZiIsImlzX2Fub255bW91cyI6ZmFsc2V9.3Zx1rPh2YNk_UxASYTXyWBcd_iyIvjUinISmcplNVcs",
  };

  Map<String, String> subHeader = {
    "Accept": "application/json",
    "Content-Type": "application/json",
    "Authorization": "Bearer ${GetStorage().read("token")}",
    // "Bearer eyJhbGciOiJIUzI1NiIsImtpZCI6ImVrT3MrMlluOXROd1hwYzQiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL21pb3Fvb21yYmp2eGdwdmJ5cmpjLnN1cGFiYXNlLmNvL2F1dGgvdjEiLCJzdWIiOiJlNDlmZGJlMC1hZDIxLTQ4MDItYTAyMi0xYTFlZjIzZmYyZmIiLCJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzYwMTE4NjY3LCJpYXQiOjE3NjAxMTUwNjcsImVtYWlsIjoic2hhbWFhaEBleGFtcGxlLmNvbSIsInBob25lIjoiIiwiYXBwX21ldGFkYXRhIjp7InByb3ZpZGVyIjoiZW1haWwiLCJwcm92aWRlcnMiOlsiZW1haWwiXX0sInVzZXJfbWV0YWRhdGEiOnsiZW1haWwiOiJzaGFtYWFoQGV4YW1wbGUuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsInBob25lX3ZlcmlmaWVkIjpmYWxzZSwic3ViIjoiZTQ5ZmRiZTAtYWQyMS00ODAyLWEwMjItMWExZWYyM2ZmMmZiIn0sInJvbGUiOiJhdXRoZW50aWNhdGVkIiwiYWFsIjoiYWFsMSIsImFtciI6W3sibWV0aG9kIjoicGFzc3dvcmQiLCJ0aW1lc3RhbXAiOjE3NjAxMTUwNjd9XSwic2Vzc2lvbl9pZCI6IjJkODMwYmZhLTcyYjUtNGRiMy1iMThmLTQxZDVhYTBlNzI1ZiIsImlzX2Fub255bW91cyI6ZmFsc2V9.3Zx1rPh2YNk_UxASYTXyWBcd_iyIvjUinISmcplNVcs",
  };
}
