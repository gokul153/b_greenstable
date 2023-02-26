import 'dart:io';

//import 'package:b_green/function.dart';
import 'package:b_green/disease/bacterial.dart';
import 'package:b_green/disease/earlyblight.dart';
import 'package:b_green/disease/healthy.dart';
import 'package:b_green/disease/lateblight.dart';
import 'package:b_green/disease/leafmould.dart';
import 'package:b_green/disease/mosaic.dart';
import 'package:b_green/disease/septoria.dart';
import 'package:b_green/disease/spidermites.dart';
import 'package:b_green/disease/targetspot.dart';
import 'package:b_green/disease/yellowleaf.dart';
import 'package:b_green/function.dart';
import 'package:b_green/page/meandrawer.dart';
import 'package:b_green/page/statusiot.dart';
import 'package:b_green/widget/bottomnav.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:b_green/core/color.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'dart:convert';
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

  void showTopSnackBar(BuildContext context) => Flushbar(
        icon: Icon(Icons.notifications_active),
        title: "Agriculture Department",
        message: "Regarding seed action",
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
      )..show(context);

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
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 20.0),
                  child: Row(children: [
                    Container(
                      height: 45.0,
                      width: 300.0,
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: IconButton(
                              onPressed: () {
                                //  showFlushbar(context: context, flushbar: flushbar),
                                showTopSnackBar(context);
                              },
                              icon: Icon(
                                Icons.notification_add_outlined,
                                color: Colors.red,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    //    ElevatedButton.icon(onPressed: () {}, icon: Icon(Icons.details_outlined), label: Text("To veiw status")),
                  ])),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  child: Image.asset('assets/images/IoT_smart-farming.png',
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 400),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.width * 0.15,
                  child: ElevatedButton.icon(
                      onPressed: () {
                        // statusiot();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const statusiot()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 10), // Set the padding of the button
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      icon: const Icon(Icons.details_outlined),
                      label: const Text("Live status and Control")),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.5),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: MediaQuery.of(context).size.width * 0.15,
                    child: ElevatedButton.icon(
                        onPressed: () {
                          // statusiot();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const statusiot()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          padding: EdgeInsets.symmetric(
                              horizontal: 2,
                              vertical: 10), // Set the padding of the button
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        icon: const Icon(Icons.details_outlined),
                        label: const Text("Disease Analysics")),
                  ),
                ),
              ),
              /*     ElevatedButton.icon(
            icon: const Icon(Icons.camera_alt),
            label: const Text("take photo"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CameraGalleryDemo()),
              );
            },
          ),*/
            ])));
  }
}

File? _image, _croppedFile;
var cropim;
int cropcheck = 0;
String message = "";

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
    cropcheck = 0;
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    //XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    setState(() {
      _image = File(image.path);
      print("${_image?.path}");
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const cropwindow()),
    );
  }

  Future<void> _cropImage() async {
    print("croping");
    try {
      if (_image != null) {
        print("crop_intiated");
        cropim = await ImageCropper().cropImage(
            sourcePath: _image!.path,
            compressFormat: ImageCompressFormat.jpg,
            compressQuality: 100,
            uiSettings: [
              AndroidUiSettings(
                toolbarTitle: 'Cropper',
                toolbarColor: Colors.deepOrange,
                // toolbarWidgetColor: Colors.white,
                // initAspectRatio: CropAspectRatioPreset.original,
                //lockAspectRatio: false
              ),
            ]);
        if (cropim != null) {
          setState(() {
            _croppedFile = File(cropim.path);
            _image = File(cropim.path);
            cropcheck = 1;
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
    cropcheck = 0;
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
        backgroundColor: Colors.green,
      ),
      drawer: MeanDrawer(),
      body: Column(
        children: [
          /*ElevatedButton.icon(
              onPressed: () {
                //uploadimage(_image);
              },
              icon: Icon(Icons.upload),
              label: Text("upload")),*/
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: _image == null
                    ? Center(
                        child: const Text(
                        'No image selected.',
                        selectionColor: Colors.blue,
                      ))
                    : Image.file(_image!),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /* FloatingActionButton(
            onPressed: _cropImage,
            tooltip: 'Crop_image',
            child: const Icon(Icons.crop),
          ),*/
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

Reference referenceRoot = FirebaseStorage.instance.ref();
Reference referencedirimage = referenceRoot.child('images');
Reference referenceimage_up = referencedirimage.child('imagename');
String image_url = '';

class _cropwindowState extends State<cropwindow> {
  Future<void> onUploadImage() async {
    //File imagefile = _croppedFile; //convert to bytes
    String url =
        "http://ec2-43-205-135-176.ap-south-1.compute.amazonaws.com:8080/disease?f=";
    Uint8List imagebytes = await _croppedFile!.readAsBytes();
    String base64string =
        base64.encode(imagebytes); //convert bytes to base64 string

    String parsedData = Uri.encodeComponent(base64string);
    url = url + parsedData;
    // print(url);
    http.Response response = await http.get(Uri.parse(url));
    String disease = response.body;
    setState(() {
                    // cropr = "intial";

                    disease = disease;
                       });
    
                        if (disease.contains("Bacerial Spot")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Bacterial(),
                          ));}
                          if (disease.contains("Early Blight")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Early(),
                          ));}
                          if (disease.contains("Healthy")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Healthy(),
                          ));}
                          if (disease.contains("Late Blight")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Late(),
                          ));
                          }
                          if (disease.contains("Leaf Mold")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Leafmould(),
                          ));}
                          if (disease.contains("Mosaic Virus")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Mosaic(),
                          ));
                          if (disease.contains("Septoria Leaf Spot")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Septoria(),
                          ));
                          if (disease.contains("Spider Mites")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Spider(),
                          ));}
                          if (disease.contains("Target Spot")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Targetspot(),
                          ));}
                          if (disease.contains("Yellow leaf Curl Virus")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Yellowleaf(),
                          ));}
                        
                          
                          

                          


                          }

                          }
                      //   Navigator.of(context).pushReplacementNamed('/Orange');
                    }

  

  /* Future<void> upimage() async {
    try {
      await referenceimage_up.putFile(File(_image!.path));
      image_url = await referenceimage_up.getDownloadURL();
    } catch (e) {
      print(e);
    }
  }*/

  Future<void> cropImage() async {
    print("croping");
    try {
      if (_image != null) {
        print("crop_intiated");
        var Cropped = await ImageCropper().cropImage(
            sourcePath: _image!.path,
            compressFormat: ImageCompressFormat.jpg,
            compressQuality: 100,
            uiSettings: [
              AndroidUiSettings(
                  toolbarTitle: 'Cropper',
                  // toolbarColor: Colors.deepOrange,
                  // toolbarWidgetColor: Colors.white,
                  initAspectRatio: CropAspectRatioPreset.square,
                  lockAspectRatio: true),
            ]);
        if (Cropped != null) {
          setState(() {
            _croppedFile = File(Cropped.path);
            _image = File(Cropped.path);
            cropcheck = 1;
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
      appBar: AppBar(title: Text("Crop image")),
      body: Center(
        child: _image == null
            ? const Text('No image selected.')
            : Image.file(_image!),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        FloatingActionButton(
          onPressed: cropImage,
          tooltip: 'Crop_image',
          child: const Icon(Icons.crop),
        ),
        ElevatedButton.icon(
          onPressed: () {
            if (cropcheck == 1) {
              //upimage();
              onUploadImage();
            } else {
              print("crop check_activated $cropcheck");
              final snackBar = SnackBar(
                content: const Text('Crop photo'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          icon: Icon(Icons.upload_file),
          label: Text("Process image"),
        )
      ]),
    );
  }
}
                        