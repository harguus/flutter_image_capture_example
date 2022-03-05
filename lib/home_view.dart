import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_capture_example/camera_controller.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CameraController>(
      init: CameraController(),
      builder: (c) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Camera example'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Gallery imagens',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    onPressed: () => c.getImages(),
                    icon: const Icon(Icons.image_search),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: c.images!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => c.removeImagesGallery(i),
                        child: Image.file(
                          File(
                            c.images![i].path,
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Câmera imagens',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    onPressed: () => c.takeImage(),
                    icon: const Icon(Icons.camera_enhance),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: c.cameraImages!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => c.removeImagesCamera(i),
                        child: Image.file(
                          File(
                            c.cameraImages![i].path,
                          ),
                          height: 150,
                          width: 150,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
