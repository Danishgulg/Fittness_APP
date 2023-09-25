
import 'package:firebase_storage/firebase_storage.dart';

class StorageOperations{

  final Reference refStorage = FirebaseStorage.instance.ref();
  
  // get the data from firebaseStorage

  Future<String> getDataInUrl({String? bucketRef}) async{
    String networkString;
    if (bucketRef != null) {
      networkString = await refStorage.child(bucketRef).getDownloadURL();
    }else{
      networkString = await refStorage.getDownloadURL();
    }
    return networkString;
  }
}