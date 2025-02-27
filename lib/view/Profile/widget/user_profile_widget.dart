import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../cubit/customer_details/update_user_profle_cubit.dart';
import '../../common_widget/common_container_widget.dart';
class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({super.key});

  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  final ImagePicker _picker = ImagePicker();
  Uint8List? registrationImage; // import 'package:flutter/services.dart';

  Future<Uint8List?> getImageFromGallery() async {
    final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxWidth: 800,
        maxHeight: 600);

    if (image != null) {
      return await image.readAsBytes(); // convert into Uint8List.
    }
    return null;
  }

  void setImage(image){
    context
        .read<UpdateUserProfileCubit>().updateModel(
        userProfileImage:  image
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        onTap: () async {
          final Uint8List? image =
              await getImageFromGallery();

          if (image != null) {
            registrationImage = image;
            setImage(image);
            setState(() {});
          }
      },
        child: ContainerWidget(
          borderRadius: 100,
          height: 98,
          width: 98,
          backgroundColor: Colors.transparent,
          borderWidth: 0,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(56),
                child: registrationImage != null
                    ? Image.memory(
                  registrationImage!,
                  fit: BoxFit.cover, // Change this to cover
                  width: 98, // Ensure it takes full width
                  height: 98, // Ensure it takes full height
                )
                    : Image.asset(
                  "assets/images/profile.png",
                  fit: BoxFit.cover, // Ensure placeholder fills too
                  width: 98,
                  height: 98,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 10,
                child: Icon(Icons.edit),
              )
            ],
          ),
        )
        ,
      ),
    );
  }
}
