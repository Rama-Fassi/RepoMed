import '../helper/api.dart';

class AllCategoriesService {
  Future<List<dynamic>?> getAllCategoires() async {
    List<dynamic> data = await Api().get(url: 'UrlForGetAllCategories');

    return data;
  }
}
