

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  bool isLoading = false;
  var captionController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  File? image;

  _imgFromGallery() async{
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    setState(() {
      image = File(photo!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Upload", style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.drive_folder_upload,
              color:  Color.fromRGBO(193, 53, 132, 1)
            ),
            onPressed: (){},
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                GestureDetector(
                  onTap: (){
                    _imgFromGallery();
                  },
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.width,
                    color: Colors.grey.withOpacity(0.4),
                    child: image == null ?  const Center(
                      child: Icon(Icons.add_a_photo,
                        size: 50, color: Colors.grey,),
                    ) : Stack(
                      children: [
                        Image.file(image!,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.black12,
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: (){
                                  setState(() {
                                    image == null;
                                  });
                                },
                                icon: const Icon(Icons.highlight_remove_outlined),
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ),
                ),

                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: TextField(
                      controller: captionController,
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: "Caption",
                        hintStyle: TextStyle(color: Colors.black38, fontSize: 17),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
