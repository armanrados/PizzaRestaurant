import 'package:flutter/material.dart';
import 'package:pizza_restaurant_ui/models/gallery.dart';
import 'package:pizza_restaurant_ui/providers/gallery_provider.dart';
import 'package:provider/provider.dart';

import '../utils/util.dart';

class GalleryListScreen extends StatefulWidget {
  const GalleryListScreen({Key? key}) : super(key: key);
  static const String routeName = "/gallery";
  @override
  State<GalleryListScreen> createState() => _GalleryListScreenState();
}

class _GalleryListScreenState extends State<GalleryListScreen> {
  GalleryProvider? _galleryProvider;
  List<Gallery> data = [];

  @override
  void initState() {
  
    super.initState();
    _galleryProvider = context.read<GalleryProvider>();
    loadData();
  }

  Future loadData() async {
    var tmpData = await _galleryProvider!
        .get({'includeUser': true});
    setState(() {
      data = tmpData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery"),
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
                  child : Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: _buildGallery(),
                      ),
                    ),
                  )
      ),
          ),
        );
      
    
  }

  List<Widget> _buildGallery() {
    var list = data
        .map((e) => Column(children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 200,
                        width: double.infinity,
                        child: imageFromBase64String(e.image!),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.description!,
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              )
                            ]),
                      )
                    ]),
              )
            ]))
        .cast<Widget>()
        .toList();

    return list;
  }
}
