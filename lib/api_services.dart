import 'package:http/http.dart' as http;
import 'package:project1/posts_model.dart';

var base = "https://dummyjson.com/";
getposts() async {
  Uri url = Uri.parse("$base/products");
  var res = await http.get(url);
  try {
    if (res.statusCode == 200) {
      var data = postModelFromJson(res.body);
      return data.products;
    } else {
      print("error");
    }
  } catch (e) {
    print(e.toString());
  }
}
