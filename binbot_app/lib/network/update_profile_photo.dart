// taking photo from gallery
import 'dart:io';
import 'package:flutter/material.dart';
// image picker
import 'package:image_picker/image_picker.dart';
// requesting permission
import 'package:permission_handler/permission_handler.dart';
// image processing
import 'package:image/image.dart' as img;
// storage and user auth
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
// toast animation
import 'package:toastification/toastification.dart';

class UpdateProfilePhoto extends StatefulWidget {
  const UpdateProfilePhoto({Key? key}) : super(key: key);

  @override
  _UpdateProfilePhotoState createState() => _UpdateProfilePhotoState();
}

class _UpdateProfilePhotoState extends State<UpdateProfilePhoto> {
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  String? _imageURL;

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  Future<void> _pickImage() async {
    // Check for permissions
    var permissionStatus = await Permission.photos.status;

    // Check if permission is already granted
    if (!permissionStatus.isGranted) {
      // Request permission
      permissionStatus = await Permission.photos.request();
    }

    if (permissionStatus.isGranted) {
      try {
        final XFile? selectedImage =
            await _picker.pickImage(source: ImageSource.gallery);
        if (selectedImage != null) {
          setState(() {
            _imageFile = selectedImage;
          });
          // Upload to Firebase
          await _uploadToFirebase(File(selectedImage.path));
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to pick image: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permission not granted')),
      );
    }
  }

  Future<void> _uploadToFirebase(File imageFile) async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? 'unknown_user';
    try {
      // Load the image file
      img.Image? originalImage = img.decodeImage(imageFile.readAsBytesSync());

      // Resize the image (example: width to 600 pixels)
      img.Image resizedImage = img.copyResize(originalImage!, width: 600);

      // Compress the image (example: JPEG with 70% quality)
      List<int> resizedBytes = img.encodeJpg(resizedImage, quality: 70);

      // Save the resized image to a temporary file
      File resizedFile = File(imageFile.path + '_resized.jpg')
        ..writeAsBytesSync(resizedBytes);
      // Create a unique file name for the image
      String fileName = 'profile_photo/$userId/profile.jpg';

      // Upload the file to Firebase Storage
      TaskSnapshot snapshot =
          await _firebaseStorage.ref(fileName).putFile(resizedFile);

      // When complete, fetch the download URL
      String downloadUrl = await snapshot.ref.getDownloadURL();

      // ignore: use_build_context_synchronously
      toastification.show(
        context: context,
        title: const Text('Profile photo updated!'),
        type: ToastificationType.success,
        style: ToastificationStyle.flatColored,
        autoCloseDuration: const Duration(seconds: 10),
        icon: const Icon(Icons.check),
        primaryColor: const Color.fromARGB(84, 222, 132, 167),
      );

      // Update the state with the new image URL
      setState(() {
        _imageURL = downloadUrl; // Update _imageURL with the new URL
      });
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload image: $e')),
      );
    }
  }

  Future<void> _loadProfileImage() async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? 'unknown_user';
    try {
      String filePath = 'profile_photo/$userId/profile.jpg';
      String downloadUrl =
          await _firebaseStorage.ref(filePath).getDownloadURL();
      setState(() {
        _imageURL = downloadUrl;
      });
    } catch (e) {
      // ignore: use_build_context_synchronously
      toastification.show(
        context: context,
        title: const Text('Failed to load profile photo'),
        type: ToastificationType.error,
        style: ToastificationStyle.flatColored,
        autoCloseDuration: const Duration(seconds: 10),
        icon: const Icon(Icons.check),
      );
      // Handle the error, e.g., image not found or permission denied
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      GestureDetector(
        onTap: _pickImage,
        child: CircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey.shade200,
          backgroundImage: _imageURL != null ? NetworkImage(_imageURL!) : null,
          onBackgroundImageError: _imageURL != null
              ? (exception, stackTrace) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Failed to upload image: $exception')),
                  );
                }
              : null,
          child:
              _imageURL == null ? const Icon(Icons.camera_alt, size: 60) : null,
        ),
      ),
    ]);
  }
}
