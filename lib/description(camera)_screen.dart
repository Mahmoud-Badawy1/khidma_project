// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'dart:io';
import 'package:flutter/foundation.dart';

import 'screens.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' hide Location;
import 'package:map_launcher/map_launcher.dart';
import 'package:intl/intl.dart' hide TextDirection;




class DescriptionPagecam extends StatefulWidget {
   const DescriptionPagecam({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DescriptionPagecamState createState() => _DescriptionPagecamState();



}

class _DescriptionPagecamState extends State<DescriptionPagecam> {
  XFile? _image;
  final _addressController = TextEditingController();
  final Location location = Location();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locatincontroller = TextEditingController();
  final TextEditingController _frompricecontroller = TextEditingController();
  final TextEditingController _topricecontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late DatabaseProvider phoneNumber ;

    @override
  void dispose() {
    // Make sure to dispose of the controller when the widget is removed
    _descriptionController.dispose();
    super.dispose();
  }
  Future<void> _takePicture() async {
    final ImagePicker picker = ImagePicker();
    final XFile? picture = await picker.pickImage(source: ImageSource.camera);

    if (picture != null) {
      setState(() {
        _image = picture;
      });
    }
  }

  Future<void> _getUserLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _locationData = await location.getLocation();
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) return;
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) return;
    }

    _locationData = await location.getLocation();
      List<Placemark> placemarks = await placemarkFromCoordinates(
      _locationData.latitude!,
      _locationData.longitude!,
    );

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      _addressController.text = "${place.street}, ${place.locality}, ${place.country}";
    }
    



  
    if (_locationData.latitude != null && _locationData.longitude != null) {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        _locationData.latitude!,
        _locationData.longitude!,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        _addressController.text = "${place.street}, ${place.locality}, ${place.country}";
      }

      // Check if a map is available and the result is not null
      bool? isMapAvailable = await MapLauncher.isMapAvailable(MapType.google);
      if (isMapAvailable != null && isMapAvailable) {
        await MapLauncher.showMarker(
          mapType: MapType.google,
          coords: Coords(_locationData.latitude!, _locationData.longitude!),
          title: "Current Location",
        );
      }
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orangeAccent,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(243, 247, 143, 6),
        ),
        body: SingleChildScrollView(
          child: Column(
          key:  _formKey,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration:  BoxDecoration(
                   color: Colors.orange ,
                    border: Border.all(
                      width: 2,
                      color: Colors.orange
                     // BorderRadius.circular(50.0),
                    ),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const SizedBox(
                      height: 20,
                    ),
                    //ماذا تحتاج
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 250,
                          height: 50,
                          decoration: const BoxDecoration(),
                          child:  const Center(child: Text("كاميرات مراقبة",style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 255, 255, 255))
                          ),
                          ),
                          ),
                        const Text(
                          " : ماذا تحتاج ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //متوسط السعر
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 70,
                          height: 50,
                          decoration: const BoxDecoration(color: Colors.amber),
                          child: TextFormField( 
                            controller: _frompricecontroller,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.right,
                            decoration: const InputDecoration(),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "الي",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 70,
                          height: 50,
                          decoration: const BoxDecoration(color: Colors.amber),
                          child: TextFormField(
                            controller: _topricecontroller,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.right,
                            decoration: const InputDecoration(),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "متوسط السعر من",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                      ], //Row children
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    //وصف الخدمة
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "وصف الخدمة",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            ),
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                        ),
                        Container(
                           width: 300,
                          decoration: BoxDecoration(
                              border: Border.all(
                            width: 1.0,
                          )),
                          child: TextFormField(
                            controller: _descriptionController ,
                            textAlign: TextAlign.right,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                      
                            ),
                          ),
                        )
                      ],
                    ),
                      Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               const Text( "تصوير المشكلة",
                                textAlign: TextAlign.center,),
              IconButton(
                icon: const Icon(Icons.camera_alt),
                onPressed: _takePicture,
              ),
              const SizedBox(width: 5),
              if (_image != null)
                SizedBox(
                  height: 20,  // Adjust the size as needed
                  width: 100,  // Adjust the size as needed
                  child: Image.file(File(_image!.path)),
                ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "العنوان",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                          IconButton(
  onPressed: _getUserLocation,
  icon: const Icon(
    Icons.location_city_outlined,
    color: Color.fromARGB(255, 193, 244, 54),
    size: 30.0,
  ),
),
                            Container(
                              width: 100,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.greenAccent),
                              child: const Text(
                                "تحديد الموقع ",
                                textAlign: TextAlign.center,
                                style: TextStyle(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 300,
                          child: TextFormField(
                            controller: _locatincontroller,
                            textAlign: TextAlign.right,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                )
                              ),
                                hintText: "اضغط هنا لكتابة العنوان يدوياً",
                                hintTextDirection: TextDirection.rtl,
                                helperStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ] //Column children
                      ),
                ),
              ),
                  const SizedBox(
                    height: 10,
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                   // width:100,
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.yellow
                    ),
                    child: TextButton(
                        onPressed: () => Navigator.pushNamed(context, '/homepage'),
                        child: const Text(
                          "الغاء الطلب ",
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color:  Colors.yellow,
                    ),
                    child: TextButton(
  onPressed: () async {
    // Assuming you have a GlobalKey<FormState> for your form and a TextEditingController for your description
       if (_formKey.currentState?.validate() ?? false) { // Check for null
   String userId = 'the_user_id'; // Replace with the actual user ID
  String? phoneNumber = await DatabaseProvider().getUserPhoneNumber(userId);

      String serviceName = "كاميرات مراقبة"; // The service name is static, as provided.
      String description = _descriptionController.text; // Description entered by the user in the TextFormField.
  try {
      // Create and save the order
 
      Order newOrder = Order(
        name: serviceName,
        date: DateFormat('dd/MM/yyyy').format(DateTime.now()), // Current date in dd/MM/yyyy format
        description: description,
        customerPhone: phoneNumber,
        status: 'incomplete', id: 1 , // Set status as incomplete
      );

      // Insert the new order into the database and then navigate to the OrdersPage.
      await DatabaseProvider().insertOrder(newOrder);
       // Feedback to the user (e.g., navigate to orders page or show success message)
      Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersPage(order: newOrder,)));
    
    } catch (e) {
      // Handle errors and provide feedback
      if (kDebugMode) {
        print('Error creating order: $e');
      }
    }
    }
  },
  child: const Text(
    "تأكيد طلب الخدمة",
  ),
)

                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),

            ],
          ),
        ),
             bottomNavigationBar: SizedBox(
              height: 88,
      
          child: Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    const SizedBox(width: 2),
    Expanded(
      child: Container(
        width: 80,
        height: 88,
        decoration: const BoxDecoration(color: Colors.orange),
        child: TextButton(
         onPressed: () => Navigator.pushNamed(
                        context, '/homepage'),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.add, color: Colors.yellow),
              Text("اضافة طلب"),
            ],
          ),
        ),
      ),
    ),
    const SizedBox(width: 2),
    Expanded(
      child: Container(
        width: 80,
        height: 88,
        decoration: const BoxDecoration(color: Colors.orange),
        child: TextButton(
          onPressed: () => Navigator.pushNamed(
                        context, '/orders'),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.history, color: Colors.yellow),
              Text("طلباتي السابقة", textDirection: TextDirection.rtl),
            ],
          ),
        ),
      ),
    ),
    const SizedBox(width: 2),
    Expanded(
      child: Container(
        width: 80,
        height: 88,
        decoration: const BoxDecoration(color: Colors.orange),
        child: TextButton(
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.question_answer, color: Colors.yellow),
              Text("المجتمع :عرض الاسئلة الشائعة", textAlign: TextAlign.right),
            ],
          ),
        ),
      ),
    ),
    const SizedBox(width: 2),
    Expanded(
      child: Container(
        width: 80,
        height: 88,
        decoration: const BoxDecoration(color: Colors.orange),
        child: TextButton(
          onPressed: () => Navigator.pushNamed(context, '/profile'),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.settings, color: Colors.yellow),
              Text("الإعدادات"),
            ],
          ),
        ),
      ),
    ),
  ],
),

        ),
     
    );
  }
}
