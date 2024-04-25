// import 'package:http/http.dart' as http;
// import 'package:project1/posts_model.dart';

// getposts() async {
//   final url = Uri.parse('https://dummyjson.com/products');
//   final res = await http.get(url);

//   print("----------------------${res.b}");
//   try {
//     if (res.statusCode == 200) {
//       var data = postModelFromJson(res.body);
//       return data.products;
//     } else {
//       print("error");
//     }
//   } catch (e) {
//     print(e.toString());
//   }
// }
