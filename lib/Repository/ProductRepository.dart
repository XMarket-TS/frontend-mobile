import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:x_market/Models/Product.dart';
import 'package:x_market/Models/SpecificProduct.dart';
import 'package:x_market/Repository/url.dart';

class ProductRepository {
  // List<Product> _productList=[
  //   Product(1,"Lechuga",2.44,"Fresca, traida del tropico",4,['burger.png','cola.png'],1,"Vegetales"),
  //   Product(2,"Tomate",3.44,"Fresca, traida del tropico",4,['burger.png','cola.png'],1,"Vegetales"),
  //   Product(3,"Pepino",4.44,"Fresca, traida del tropico",4,['burger.png','cola.png'],1,"Vegetales"),
  //   Product(4,"Carne",5.44,"Fresca, traida del tropico",4,['burger.png','cola.png'],1,"Carnes"),
  //   Product(5,"Pollo",6.44,"Fresca, traida del tropico",4,['burger.png','cola.png'],1,"Carnes"),
  // ];
  //
  // List<Product> get productList => _productList;
  //
  // set productList(List<Product> value) {
  //   _productList = value;
  // }

  static Future<List<Product>> obtainListProduct(
      int branchId, int categoriesId,int page,int size,String _data) async {
    try {
      // var _branchId=branchId.toString();
      String url;
      if(_data==null){
        url = directionUrl +
            "user/1/branchOffice/" +
            branchId.toString() +
            "/category/" +
            categoriesId.toString()+"?page=" +
            page.toString() +
            "&size="+size.toString();
      }else{
        url = directionUrl +
            "product/branchOffice/" +
            branchId.toString() +
            "/category/" +
            categoriesId.toString()+"?search="+_data+"&page=" +
            page.toString() +
            "&size="+size.toString();
      }

      // print(url);
      var res = await http.get(url, //ip for virtualized devices
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      // print(res.body.length);
      var productCollection2 = json.decode(utf8.decode(res.bodyBytes));
      // print(productCollection2);
      // var branchCollection2;
      var productCollection3 = List<Product>();
      // var branchCollection2=jsonDecode(res.body);
      for (productCollection2 in productCollection2) {
        productCollection3.add(Product.fromJson(productCollection2));
      }
      // print("list of Products");
      // print(productCollection3);
      // body: jsonEncode(singleDriver.toJson()));
      if (res.statusCode == 200) {
        // print("DoneListaProducts");
        return productCollection3;
      } else {
        return null;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<SpecificProduct> obtainSpecificProduct(int productId) async {
    try {
      // var _branchId=branchId.toString();
      SpecificProduct product;
      String url = directionUrl + "product/" + productId.toString();

      var res = await http.get(url, //ip for virtualized devices
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      var product2 = jsonDecode(res.body);
      product = SpecificProduct.fromJson(product2);
      // print(singleDriver2);
      // print("prueba producto especifico");
      // print(product);
      // product.productId=(product2["productId"]);
      // // product.categoryId=(product2["productCategoryId"]);
      // product.name=(product2["name"]);
      // product.price=(product2["price"]);
      // product.percentage=(product2[""])
      // product.description=(product2["description"]);

      // product.imageUrl=(product2["imageUrl"]);
      if (res.statusCode == 200) {
        // print(product.name);
        return product;
      } else {
        return null;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<Product> obtainbyHash(String hash) async {
    try {
      // var _branchId=branchId.toString();
      // print("entro a repo de hash");
      Product product=Product();
      String url = directionUrl + "product/qr/hash?hash=" + hash;

      var res = await http.get(url, //ip for virtualized devices
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      var product2 = jsonDecode(res.body);
      product = Product.fromJson(product2);
      if (res.statusCode == 200) {
        // print("se obtuvo producto por hash");
        // print(product.name);
        return product;
      } else {
        return null;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

}
