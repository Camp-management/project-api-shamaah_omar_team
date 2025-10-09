class ConstantApi{
  final baseURL="https://api-week.onrender.com";
 // final authLoginEndPoint="/auth/login";
  final folderEndPoint="/folders";
  final createFolderEndPoint="/folder/create/";
  final updateFolderEndPoint="/folder/update/";
  final deleteFolderEndPoint="/folder/delete/";
  Map<String,String> header = {"Accept": "application/json"};



  Map<String,String> foldersHeader =
    {"Accept": "application/json",
  "Authorization" :
  "Bearer eyJhbGciOiJIUzI1NiIsImtpZCI6ImVrT3MrMlluOXROd1hwYzQiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL21pb3Fvb21yYmp2eGdwdmJ5cmpjLnN1cGFiYXNlLmNvL2F1dGgvdjEiLCJzdWIiOiJlNDlmZGJlMC1hZDIxLTQ4MDItYTAyMi0xYTFlZjIzZmYyZmIiLCJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzYwMDQ4MzU1LCJpYXQiOjE3NjAwNDQ3NTUsImVtYWlsIjoic2hhbWFhaEBleGFtcGxlLmNvbSIsInBob25lIjoiIiwiYXBwX21ldGFkYXRhIjp7InByb3ZpZGVyIjoiZW1haWwiLCJwcm92aWRlcnMiOlsiZW1haWwiXX0sInVzZXJfbWV0YWRhdGEiOnsiZW1haWwiOiJzaGFtYWFoQGV4YW1wbGUuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsInBob25lX3ZlcmlmaWVkIjpmYWxzZSwic3ViIjoiZTQ5ZmRiZTAtYWQyMS00ODAyLWEwMjItMWExZWYyM2ZmMmZiIn0sInJvbGUiOiJhdXRoZW50aWNhdGVkIiwiYWFsIjoiYWFsMSIsImFtciI6W3sibWV0aG9kIjoicGFzc3dvcmQiLCJ0aW1lc3RhbXAiOjE3NjAwNDQ3NTV9XSwic2Vzc2lvbl9pZCI6IjcwMGVmZjQ4LTg2YmEtNDljMC1iZjk3LWU4YzIzNTczYjBlMiIsImlzX2Fub255bW91cyI6ZmFsc2V9.dLAM7wwLlcGSo-C6ZJpNDt9jsQS8RLjyTVeVW1oBflk"}
;


}