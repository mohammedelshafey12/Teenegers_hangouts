

import 'dart:io';
import 'package:googlemaps/Provider/modelHud.dart';
import 'package:googlemaps/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:path/path.dart' as Path;
import 'package:provider/provider.dart';

class pickImageDialog extends StatefulWidget {
  @override
  _pickImageDialogState createState() => _pickImageDialogState();
  double height;
  double width;
  String docId;
  pickImageDialog(this.width,this.height,this.docId);
}

class _pickImageDialogState extends State<pickImageDialog> {
  File _image;
  String assetimage = 'images/markercover.png';
  String _uploadedFileURL;
  bool ignoring =true;
  double opacity = 0;
  @override
  Widget build(BuildContext context) {
    return  ModalProgressHUD(
      inAsyncCall: Provider.of<modelHud>(context).isloading,
      child: Container(
        height: MediaQuery.of(context).size.height*0.5,
        child: Column(
          children: <Widget>[
            Text('Selected Image'),
            Container(
              height: widget.height*0.15,
              width: widget.width*0.6,
              child: Image.asset(assetimage),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  child: Text( 'Choose File'),
                  onPressed: pickimage,
                  color: Colors.cyan,
                ),
                Builder(
                  builder: (context)=>
                   IgnorePointer(
                     ignoring:ignoring ,
                     child: Opacity(
                       opacity: opacity,
                       child: RaisedButton(
                        child: Text( 'Upload File'),
                        onPressed:()async {
                          if(_image!=null){
                            Provider.of<modelHud>(context).isprogressloding(true);

                            Firestore firestore = Firestore.instance;
                            StorageReference storageReference = FirebaseStorage.instance
                                .ref()
                                .child('images/${Path.basename(_image.path)}}');
                            StorageUploadTask uploadTask = storageReference.putFile(_image);
                            await uploadTask.onComplete;

                            print('File Uploaded');
                            storageReference.getDownloadURL().then((fileURL) {
                              firestore.collection(constants.Markerscollection).document(widget.docId).updateData({
                                constants.PlaceImage: fileURL,
                              }).whenComplete(() {
                                Provider.of<modelHud>(context).isprogressloding(false);
                                Scaffold.of(context).showSnackBar(SnackBar(content: Text("Upload Success")));
                              });
                              setState(() {
                                _uploadedFileURL = fileURL;
                              });
                            });
                          }

                        },
                        color: Colors.cyan,
                  ),
                     ),
                   ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Future pickimage() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
        assetimage = image.path;
        if (image!=null){
          setState(() {
            ignoring = false;
            opacity = 1;
          });
        }
      });
    });
  }
}
