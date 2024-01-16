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
      // Create a unique file name for the image
      String fileName = 'profile_photo/$userId/profile.png';

      // Upload the file to Firebase Storage
      TaskSnapshot snapshot =
          await _firebaseStorage.ref(fileName).putFile(imageFile);

      // When complete, fetch the download URL
      String downloadUrl = await snapshot.ref.getDownloadURL();

      // Update the state with the new image URL
      setState(() {
        _imageURL = downloadUrl; // Update _imageURL with the new URL
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload image: $e')),
      );
    }
  }

  Future<void> _loadProfileImage() async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? 'unknown_user';
    try {
      String filePath = 'profile_photo/$userId/profile.png';
      String downloadUrl =
          await _firebaseStorage.ref(filePath).getDownloadURL();
      setState(() {
        _imageURL = downloadUrl;
      });
    } catch (e) {
      // Handle the error, e.g., image not found or permission denied
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: CircleAvatar(
        radius: 60,
        backgroundColor: Colors.grey.shade200,
        backgroundImage: _imageURL != null ? NetworkImage(_imageURL!) : null,
        child:
            _imageURL == null ? const Icon(Icons.camera_alt, size: 60) : null,
      ),
    );
  }
}
