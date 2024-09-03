import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/colores/app_colors.dart';
import 'package:flutter_application_2/presentacion/widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

class TomarFotografiaScreen extends StatefulWidget {
  const TomarFotografiaScreen({Key? key}) : super(key: key);
  static const nombre = 'tomar_fotografia';

  @override
  _TomarFotografiaScreenState createState() => _TomarFotografiaScreenState();
}

class _TomarFotografiaScreenState extends State<TomarFotografiaScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _image;
  String? _base64Image;

  Future<void> captureImages() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
      _base64Image = await convertToBase64(_image!);
    }
  }

  Future<String> convertToBase64(File image) async {
    Uint8List bytes = await image.readAsBytes();
    String base64Image = base64Encode(bytes);
    return base64Image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarLogoOscusWidget(),
      backgroundColor: AppColors.blancoOscus,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Title(
              color: AppColors.azulOscus,
              child: TituloTextWidget(
                text: _image == null
                    ? 'Tómate una foto, \n por favor'
                    : '¿Te gusta tu foto?',
                textColor: AppColors.verdeOscus,
              ),
            ),
            _image != null
                ? Container(
                    width: 400,
                    height: 500,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.azulOscus,
                        width: 4,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.file(
                        _image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : const Icon(
                    Icons.image,
                    size: 150,
                  ),
            const SizedBox(height: 10),
            BotonIconoWidget(
              icon: Icons.camera_enhance_rounded,
              text: _image == null ? 'Tomar  foto' : 'Volver a tomar foto',
              iconColor: AppColors.blancoOscus,
              textColor: AppColors.blancoOscus,
              onPressed: () => captureImages(),
              buttonColor: AppColors.azulOscus,
            ),
            const SizedBox(height: 10),
            _image != null
                ? BotonContinuarWiget(onPressed: () {})
                : const SizedBox.shrink(),
            IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit_sharp))
          ],
        ),
      ),
    );
  }
}
