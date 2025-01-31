import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/auth/presentation/view/login_view.dart';
import 'package:hotel_booking/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _gap = const SizedBox(height: 16);
  final _key = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'Sid@gmail.com');
  final _usernameController = TextEditingController(text: 'Sid');
  final _passwordController = TextEditingController(text: 'test12345');

  // Checking for Runtime Camera Permissions
  checkCameraPermission() async {
    if (await Permission.camera.request().isRestricted ||
        await Permission.camera.request().isDenied) {
      await Permission.camera.request();
    }
  }

  File? _img;

  Future _browseImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          _img = File(image.path);

          // Send File to server
          context.read<RegisterBloc>().add(LoadImage(file: _img!));
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: 'Create',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Account',
            ),
            children: [
              TextSpan(
                text: ' Back',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontFamily: 'Nunito',
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white, // Blue background for the app bar
      ),
      body: MultiBlocListener(
        listeners: [
          // Listener for Image Upload
          BlocListener<RegisterBloc, RegisterState>(
            listenWhen: (previous, current) =>
                previous.isImageLoading != current.isImageLoading ||
                previous.isImageSuccess != current.isImageSuccess,
            listener: (context, state) {
              if (state.isImageLoading) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Uploading image...'),
                    duration: Duration(seconds: 2),
                  ),
                );
              } else if (state.isImageSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Image uploaded successfully!'),
                    backgroundColor: Colors.green,
                  ),
                );
              } else if (!state.isImageLoading &&
                  !state.isImageSuccess &&
                  state.imageName == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Failed to upload image. Please try again.'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          ),
          // Listener for Student Registration
          BlocListener<RegisterBloc, RegisterState>(
            listenWhen: (previous, current) =>
                previous.isLoading != current.isLoading ||
                previous.isSuccess != current.isSuccess,
            listener: (context, state) {
              if (state.isLoading) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Registering User...'),
                    duration: Duration(seconds: 2),
                  ),
                );
              } else if (state.isSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('User registered successfully!'),
                    backgroundColor: Colors.green,
                  ),
                );

                // Navigate back to the login page after registration success
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pop(context);
                });
              } else if (!state.isLoading && !state.isSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Failed to register User. Try again.'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          ),
        ],
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.grey[300],
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) => Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    checkCameraPermission();
                                    _browseImage(ImageSource.camera);
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.camera,
                                      color: Colors.black),
                                  label: const Text('Camera'),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    checkCameraPermission();
                                    _browseImage(ImageSource.gallery);
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.image,
                                      color: Colors.black),
                                  label: const Text('Gallery'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 200,
                        width: 200,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: _img != null
                              ? FileImage(_img!)
                              : const AssetImage('assets/images/pro.png')
                                  as ImageProvider,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          size: 24,
                        ),
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                    ),
                    _gap,
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          size: 24,
                        ),
                        labelText: 'Username',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                    ),
                    _gap,
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 24,
                          color: Colors.black,
                        ),
                        suffixIcon: Icon(
                          Icons.visibility,
                          color: Colors.black,
                          size: 24, // Size for the visibility icon
                        ),
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                    _gap,
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            final registerState =
                                context.read<RegisterBloc>().state;
                            final imageName = registerState.imageName;

                            context.read<RegisterBloc>().add(RegisterUser(
                                  email: _emailController.text,
                                  username: _usernameController.text,
                                  password: _passwordController.text,
                                  image: imageName,
                                ));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontFamily: 'Nunito', // Font for the button text
                          ),
                        ),
                        child: const Text('Register'),
                      ),
                    ),
                    _gap,
                    TextButton(
                      onPressed: () {
                        // Navigate to the login screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginView()),
                        );
                      },
                      child: const Text(
                        'Already have an account? Login',
                        style: TextStyle(
                          fontFamily: 'Nunito', // Font for the text
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
