import 'package:flutter/material.dart';
import 'package:project_ecommerce/models/product_model.dart';
import 'package:project_ecommerce/routes/app_route.dart';

class DetailShirt extends StatefulWidget {
  const DetailShirt({super.key});

  @override
  State<DetailShirt> createState() => _DetailShirtState();
}

class _DetailShirtState extends State<DetailShirt> {
  late ProductModel? data;
  String size = "S";
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    data = ModalRoute.of(context)!.settings.arguments as ProductModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 30,
          ),
          SizedBox(width: 10),
        ],
        backgroundColor: Colors.purpleAccent.shade200,
      ),
      backgroundColor: Color(0xffEBEBEB),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: _builddetailpage(),
        ),
      ),
    );
  }

  Widget _builddetailpage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Image.network(
            data!.thumbnail,
            width: double.infinity,
            height: 350,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          data!.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Text(
              "Price : \$ ${data!.price}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 10),
            Container(
              height: 25,
              width: 90,
              decoration: BoxDecoration(
                color: Color(0xffFF0000),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                  child: Text(
                "15% off",
                style: TextStyle(color: Colors.white),
              )),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          data!.description,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 20),
        Text(
          "AVAILABLE :  ${data!.availabilityStatus}",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          "TAG : ${data!.tags?.join(', ') ?? 'No tags'}",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          "SKU :  ${data!.sku}",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          "Size: $size",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            _buildsize(),
          ],
        ),
        SizedBox(height: 20),
        Text(
          "Quantity : ",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 7),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffC5C6C7),
                  foregroundColor: Colors.black,
                ),
                child: Text(
                  " -  1  + ",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              flex: 2,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: BorderSide(
                      color: Colors.black,
                      width: 2,
                    )),
                child: Text(
                  "Add to Cart - 20USD",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(width: 5),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Color(0xffC5C6C7),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                Icons.bookmark_border_outlined,
                size: 25,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoute.CheckoutPage,
                  arguments: data);
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: Color(0xff004044),
              side: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
            child: Text(
              "Buy Now",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Icon(
              Icons.local_shipping_outlined,
              size: 35,
            ),
            SizedBox(width: 10),
            Text(
              data!.shippingInformation,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Icon(
              Icons.warning_amber,
              size: 35,
            ),
            SizedBox(width: 10),
            Text(
              data!.warrantyInformation,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          "Return Policy",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 5),
        Text(
          data!.returnPolicy,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w100, color: Colors.black),
        ),
        SizedBox(height: 20),
        Text(
          "Shipping",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 5),
        Text(
          "We can ship to virtually any address in the world.Note that there are restrictions on some products, and some products cannot be shipped to international destinations.",
          style: TextStyle(fontSize: 13),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Icon(
              Icons.share_outlined,
              size: 30,
            ),
            SizedBox(width: 10),
            Text(
              "Share : ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    );
  }

  Widget _buildsize(
      // required String text,
      // required Color color,
      // required Color textcolor,
      ) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              size = "S";
            });
          },
          child: Container(
            width: 35,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: size == "S"
                  ? Colors.black
                  : const Color.fromARGB(255, 192, 191, 191),
            ),
            child: Center(
              child: Text(
                "s",
                style: TextStyle(
                  color: size == "S" ? Colors.white : Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              size = "M";
            });
          },
          child: Container(
            width: 35,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: size == "M"
                  ? Colors.black
                  : const Color.fromARGB(255, 209, 207, 207),
            ),
            child: Center(
              child: Text(
                "M",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: size == "M" ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              size = "L";
            });
          },
          child: Container(
            width: 35,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: size == "L"
                  ? Colors.black
                  : const Color.fromARGB(255, 207, 206, 206),
            ),
            child: Center(
              child: Text(
                "L",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: size == "L" ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              size = "XL";
            });
          },
          child: Container(
            width: 35,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: size == "XL"
                  ? Colors.black
                  : const Color.fromARGB(255, 216, 216, 216),
            ),
            child: Center(
              child: Text(
                "XL",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: size == "XL" ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
