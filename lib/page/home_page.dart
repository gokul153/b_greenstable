import 'dart:io';

import 'package:b_green/page/meandrawer.dart';
import 'package:b_green/page/statusiot.dart';
import 'package:b_green/widget/bottomnav.dart';
import 'package:flutter/material.dart';
import 'package:b_green/core/color.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:begreen/data/category_model.dart';
//import 'package:begreen/data/plant_data.dart';
//import 'package:begreen/page/details_page.dart';
//import 'package:b_green/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController();
  @override
  void initState() {
    controller = PageController(viewportFraction: 0.6, initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.green,
          /* automaticallyImplyLeading: false,
          leadingWidth: 40,
          leading: TextButton(
            onPressed: () {},
            child: Image.asset(
              'assets/icons/menu.png',
            ),
          ),
          
          actions: [
            Container(
              height: 40.0,
              width: 40.0,
              margin: const EdgeInsets.only(right: 20, top: 10, bottom: 5),
              decoration: BoxDecoration(
                color: green,
                boxShadow: [
                  BoxShadow(
                    color: green.withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 0),
                  ),
                ],
                borderRadius: BorderRadius.circular(10.0),
                /*  image: const DecorationImage(
                  image: AssetImage('assets/images/pro.png'),
                ),*/
              ),
            ),
          ],*/
        ),
        drawer: MeanDrawer(),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Row(children: [
                Container(
                  height: 45.0,
                  width: 300.0,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: white,
                    border: Border.all(color: green),
                    boxShadow: [
                      BoxShadow(
                        color: green.withOpacity(0.15),
                        blurRadius: 10,
                        offset: const Offset(0, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        height: 45,
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/icons/search.png',
                        height: 25,
                      )
                    ],
                  ),
                ),
                //    ElevatedButton.icon(onPressed: () {}, icon: Icon(Icons.details_outlined), label: Text("To veiw status")),
              ])),
          ElevatedButton.icon(
              onPressed: () {
                // statusiot();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const statusiot()),
                );
              },
              icon: const Icon(Icons.details_outlined),
              label: const Text("View status")),
          ElevatedButton.icon(
            icon: const Icon(Icons.camera_alt),
            label: const Text("take photo"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CameraGalleryDemo()),
              );
            },
          ),
        ])));
  }
}
 File? _image, _croppedFile;
class CameraGalleryDemo extends StatefulWidget {
  const CameraGalleryDemo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CameraGalleryDemoState createState() => _CameraGalleryDemoState();
}

class _CameraGalleryDemoState extends State<CameraGalleryDemo> {
 

  ///static Future<File> Function(File file) cropImage
  // Function to get image from the camera
  Future<void> _getImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image == null) return;

    setState(() {
      _image = File(image.path);
    });
  }

  Future<void> _cropImage() async {
    print("croping");
    try {
      if (_image != null) {
        print("crop_intiated");
        final Cropped = await ImageCropper().cropImage(
            sourcePath: _image!.path,
            compressFormat: ImageCompressFormat.jpg,
            compressQuality: 100,
            uiSettings: [
              AndroidUiSettings(
                toolbarTitle: 'Cropper',
                // toolbarColor: Colors.deepOrange,
                // toolbarWidgetColor: Colors.white,
                // initAspectRatio: CropAspectRatioPreset.original,
                //lockAspectRatio: false
              ),
            ]);
        if (Cropped != null) {
          setState(() {
            _croppedFile = File(Cropped.path);
             _image = File(Cropped.path);
          });
        }
      }
    } catch (e) {
      print(e);
    }
  }

  // Function to get image from the gallery
  Future<void> _getImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;

    setState(() {
      _image = File(image.path);
    });
     Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const cropwindow()),
                );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Gallery Demo'),
      ),
      body: 
      Column(
        children: [
          ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.upload), label: Text("upload")),
          Center(
            
            child: _image == null
                ? const Text('No image selected.')
                : Image.file(_image!),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: _cropImage,
            tooltip: 'Crop_image',
            child: const Icon(Icons.crop),
          ),
          FloatingActionButton(
            onPressed: _getImageFromCamera,
            tooltip: 'Take a photo',
            child: const Icon(Icons.camera_alt),
          ),
          // const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: _getImageFromGallery,
            tooltip: 'Pick from gallery',
            child: const Icon(Icons.photo_library),
          ),
        ],
      ),
    );
  }
}
class cropwindow extends StatefulWidget {
  const cropwindow({super.key});

  @override
  State<cropwindow> createState() => _cropwindowState();
}

class _cropwindowState extends State<cropwindow> {
   Future<void> cropImage() async {
    print("croping");
    try {
      if (_image != null) {
        print("crop_intiated");
        final Cropped = await ImageCropper().cropImage(
            sourcePath: _image!.path,
            compressFormat: ImageCompressFormat.jpg,
            compressQuality: 100,
            uiSettings: [
              AndroidUiSettings(
                toolbarTitle: 'Cropper',
                // toolbarColor: Colors.deepOrange,
                // toolbarWidgetColor: Colors.white,
                // initAspectRatio: CropAspectRatioPreset.original,
                //lockAspectRatio: false
              ),
            ]);
        if (Cropped != null) {
          setState(() {
            _croppedFile = File(Cropped.path);
          });
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Crop image  for better result")),
      body: Center(
        child: _image == null
            ? const Text('No image selected.')
            : Image.file(_image!),
            
    ),
    floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: cropImage,
            tooltip: 'Crop_image',
            child: const Icon(Icons.crop),
          ),
          ]
    ),
    );
  }
}