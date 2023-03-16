import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sales/Graph_1.dart';
import 'package:sales/theme/colors.dart';

class ProductDetailPage extends StatefulWidget {
  final String name;
  final String img;
  final String price;
  final String rate;
  final List colors;
  const ProductDetailPage(
      {Key? key,
      required this.name,
      required this.img,
      required this.price,
      required this.rate,
      required this.colors})
      : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  List sizes = [7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11, 11.5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        "Product Detail",
        style: TextStyle(
            color: secondary, fontSize: 18, fontWeight: FontWeight.w600),
      ),
      leading: IconButton(
        icon: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: white,
              shape: BoxShape.circle,
              border: Border.all(color: secondary.withOpacity(0.2))),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 15,
              color: secondary,
            ),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      elevation: 0,
      backgroundColor: primary,
    );
  }

  Widget getFooter() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 24),
      child: SizedBox(
        height: 50,
        width: double.maxFinite - 20,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            primary: Colors.black,
            fixedSize: Size(double.maxFinite, double.maxFinite),
          ),
          onPressed: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Graph(
                          title: '',
                        )))
          },
          child: Text(
            "Status",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.name,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Icon(
                LineIcons.star,
                size: 20,
              ),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Text(
                  "${widget.rate} Reviews",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      "\$",
                      style: TextStyle(
                          color: red,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    widget.price,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                    color: white,
                    shape: BoxShape.circle,
                    border: Border.all(color: secondary.withOpacity(0.2)),
                    boxShadow: [
                      BoxShadow(
                          color: secondary.withOpacity(0.15),
                          blurRadius: 5,
                          offset: Offset(0, 5))
                    ]),
                child: Center(
                  child: Icon(
                    LineIcons.heart,
                    size: 23,
                  ),
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width * 0.25,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(widget.colors.length, (index) {
                      return FadeIn(
                        duration: Duration(milliseconds: 1000 * index),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Container(
                            width: 70,
                            height: 70,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 10,
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: secondary.withOpacity(0.1)),
                                        color: white),
                                  ),
                                ),
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage(widget.colors[index]),
                                          fit: BoxFit.cover)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: FadeIn(
                  duration: Duration(milliseconds: 1400),
                  child: Container(
                    height: 350,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Container(
                            height: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(120),
                                    topLeft: Radius.circular(120),
                                    topRight: Radius.circular(40)),
                                color: secondary.withOpacity(0.12)),
                          ),
                        ),
                        Container(
                          height: 270,
                          child: Image.asset(
                            widget.img,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                width: size.width * 0.15,
                child: Text(
                  "Sizes",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Flexible(
                child: Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(sizes.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: secondary.withOpacity(0.2))),
                            child: Center(
                              child: Text(
                                sizes[index].toString(),
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
