import '../models/gallery.dart';
import 'base_provider.dart';

class GalleryProvider extends BaseProvider<Gallery> {
    GalleryProvider(): super("Gallery");

   @override
   Gallery fromJson(data) {
    return Gallery.fromJson(data);
  }
}