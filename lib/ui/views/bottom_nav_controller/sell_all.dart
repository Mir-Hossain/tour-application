import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shelter/ui/views/bottom_nav_controller/details_screen.dart';
import 'package:shelter/ui/views/bottom_nav_controller/pages/nav_home.dart';

// ignore: must_be_immutable
class SeeAll extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var compare;
  SeeAll(this.compare, {Key? key}) : super(key: key);
  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  //collectionName
  final CollectionReference _refference = FirebaseFirestore.instance
      .collection('all-data')
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection('images');

  //queryName
  late Future<QuerySnapshot> _futureDataForYou;
  @override
  void initState() {
    _futureDataForYou =
        _refference.where(widget.compare, isEqualTo: true).get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text("See All"),
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: _futureDataForYou,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasError) {
                return const Text("Error");
              }
              if (snapshot.hasData) {
                List<Map> items = parseData(snapshot.data);
                return forYouBuildGridview(items);
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}

GridView forYouBuildGridview(List<Map<dynamic, dynamic>> shoppingItems) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
    ),
    itemCount: shoppingItems.length,
    itemBuilder: (_, i) {
      Map thisItem = shoppingItems[i];
      return InkWell(
        onTap: () => Get.to(DetailsSCreen(thisItem)),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFfC4C4C4),
            borderRadius: BorderRadius.all(
              Radius.circular(7.r),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7.r),
                    topRight: Radius.circular(7.r),
                  ),
                  child: Image.network(
                    thisItem['list_images'][0],
                    // height: 115.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
              Text(
                thisItem['list_destination'],
                style: TextStyle(fontSize: 15.sp),
              ),
              Text(
                thisItem['list_cost'],
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      );
    },
  );
}
