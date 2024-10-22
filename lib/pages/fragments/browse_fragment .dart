//import 'dart:developer';

import 'package:extended_image/extended_image.dart';
import 'package:finalproject_mototbike/controllers/booking_status_controller.dart';
import 'package:finalproject_mototbike/controllers/browse_featured_conttroler.dart';
import 'package:finalproject_mototbike/controllers/browse_newest_conttroler.dart';
import 'package:finalproject_mototbike/models/bike.dart';
import 'package:finalproject_mototbike/widgets/failed_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BrowseFragment extends StatefulWidget {
  const BrowseFragment({super.key});

  @override
  State<BrowseFragment> createState() => _BrowseFragmentState();
}

class _BrowseFragmentState extends State<BrowseFragment> {
  final browseFeaturedConttroler = Get.put(BrowseFeaturedConttroler());
  final browseNewestConttroler = Get.put(BrowseNewestConttroler());
  final bookingStatusController = Get.put(BookingStatusController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      browseFeaturedConttroler.fetchFeatured();
      browseNewestConttroler.fetchNewest();
      // bookingStatusController.bike = {
      //   'name': 'Enfielding pro',
      //   'image':
      //       'https://s3-alpha-sig.figma.com/img/547c/99d8/59cc8ebaeebcc6144f1f343ab1c55d96?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=JpugNcccaiwUzcH4xSL33QA24zVJKLGbeC3NbMxX1e-ttmbe0WRWkJaobhbtSMG~2EMbx55lfbNrrf7~HWTeYcKBkWkbAwQjiToFZ1ENlVR1yBpt0FuPo8vbE8ALcUR6YJUkMyfQC2bHfTpaSG0NHfynb81hcWMCD2U8wPQ7Rypi2ZVhqEiErscvtn6SPlF3q2bS4r4foRdeYoB0iKxlZN0etDPpYiDeD-l57xbwGN4sJ5kBVvPc0JYjjfH3Q8bnqeB7-INA3CAtFubedC~FoLuiWaTBmGTpJ3MI~psuHVNa9Uc9qi9kDjzUOzGZ8aoP1~wqc2HTsN583RvIZCQpkw__',
      // };
    });
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<BrowseFeaturedConttroler>(force: true);
    Get.delete<BrowseNewestConttroler>(force: true);
    Get.delete<BookingStatusController>(force: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        Gap(30 + MediaQuery.of(context).padding.top),
        buildheader(),
        buildBookingStatus(),
        const Gap(30),
        buildCategories(),
        const Gap(30),
        buildFeatured(),
        const Gap(30),
        buildNewest(),
        const Gap(100),
      ],
    );
  }

  Widget buildBookingStatus() {
    return Obx(() {
      Map bike = bookingStatusController.bike;
      if (bike.isEmpty) return const SizedBox();
      return Container(
        height: 96,
        margin: const EdgeInsets.fromLTRB(24, 30, 24, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xff4A1DFF),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 16),
              blurRadius: 20,
              color: const Color(0xff4A1DFF).withOpacity(0.25),
            )
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: -20,
              top: 0,
              bottom: 0,
              child: ExtendedImage.network(
                bike['image'],
                width: 80,
                height: 80,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Your booking ',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFFFFFF),
                        height: 1.5,
                      ),
                      children: [
                        TextSpan(
                          text: bike['name'],
                          style: const TextStyle(
                            color: Color(0xffFFBC1C),
                          ),
                        ),
                        const TextSpan(
                          text: "\nhas been delivered to.",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget buildNewest() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Newest Bikes',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xff070623),
            ),
          ),
        ),
        Obx(() {
          String status = browseNewestConttroler.status;
          if (status == '') return const SizedBox();
          if (status == 'loading') {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (status != 'success') {
            return Center(child: FailedUi(massage: status));
          }
          List<Bike> list = browseNewestConttroler.list;
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
            itemCount: list.length,
            itemBuilder: (context, index) {
              Bike bike = list[index];
              final margin = EdgeInsets.only(
                top: index == 0 ? 10 : 9,
                bottom: index == list.length - 1 ? 20 : 9,
              );
              return buildItemNewest(bike, margin);
            },
          );
        }),
      ],
    );
  }

  Widget buildItemNewest(Bike bike, EdgeInsetsGeometry margin) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail', arguments: bike.id);
      },
      child: Container(
        height: 98,
        margin: margin,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            ExtendedImage.network(
              bike.image,
              width: 90,
              height: 70,
              fit: BoxFit.contain,
            ),
            const Gap(10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bike.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff070623),
                    ),
                  ),
                  const Gap(4),
                  Text(
                    bike.category,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff838384),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  NumberFormat.currency(
                    decimalDigits: 0,
                    locale: 'id_ID', // Menggunakan locale Indonesia
                    symbol: 'IDR', // Mengganti simbol menjadi IDR
                  ).format(bike.price),

                  // NumberFormat.currency(
                  //   decimalDigits: 0,
                  //   locale: 'en_US',
                  //   symbol: '\$',
                  // ).format(bike.price),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff6747E9),
                  ),
                ),
                const Text(
                  '/day',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff838384),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFeatured() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Featured',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xff070623)),
          ),
        ),
        const Gap(10),
        Obx(() {
          String status = browseFeaturedConttroler.status;
          if (status == '') return const SizedBox();
          if (status == 'loading') {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (status != 'success') {
            return Center(
              child: FailedUi(massage: status),
            );
          }
          List<Bike> list = browseFeaturedConttroler.list;

          return SizedBox(
            height: 295,
            child: ListView.builder(
              itemCount: list.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Bike bike = list[index];
                final margin = EdgeInsets.only(
                  left: index == 0 ? 24 : 12,
                  right: index == list.length - 1 ? 24 : 12,
                );
                bool isTrending = index == 0;
                return buildItemFeatured(bike, margin, isTrending);
              },
            ),
          );
        }),
      ],
    );
  }

  Widget buildItemFeatured(
    Bike bike,
    EdgeInsetsGeometry margin,
    bool isTrending,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail', arguments: bike.id);
      },
      child: Container(
        width: 252,
        margin: margin,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ExtendedImage.network(
                  //'https://firebasestorage.googleapis.com/v0/b/final-projectmotobike.appspot.com/o/bike%2Fenfielding_pro.png?alt=media&token=b3449056-a097-4866-8556-46fe9e35b76f'
                  bike.image,
                  width: 220,
                  height: 170,
                ),
                if (isTrending)
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffFF2055),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 10,
                          color: const Color(0xffFF2056).withOpacity(0.5),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 14,
                    ),
                    child: const Text(
                      'TRENDING',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bike.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff070623),
                        ),
                      ),
                      const Gap(4),
                      Text(
                        bike.category,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff838384),
                        ),
                      ),
                    ],
                  ),
                ),
                RatingBar.builder(
                  initialRating: bike.rating.toDouble(),
                  itemPadding: const EdgeInsets.all(0),
                  itemSize: 16,
                  unratedColor: Colors.grey[300],
                  allowHalfRating: true,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Color(0xffFFBC1C),
                  ),
                  ignoreGestures: true,
                  onRatingUpdate: (value) {},
                ),
              ],
            ),
            const Gap(16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  NumberFormat.currency(
                    decimalDigits: 0,
                    locale: 'id_ID', // Menggunakan locale Indonesia
                    symbol: 'IDR', // Mengganti simbol menjadi IDR
                  ).format(bike.price),

                  // NumberFormat.currency(
                  //   decimalDigits: 0,
                  //   locale: 'en_US',
                  //   symbol: '\$',
                  // ).format(bike.price),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff6747E9),
                  ),
                ),
                const Text(
                  '/day',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff838384),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategories() {
    final categories = [
      ['City', 'assets/ic_city.png'],
      ['Downhill', 'assets/ic_downhill.png'],
      ['Beach', 'assets/ic_beach.png'],
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Categories',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xff070623)),
          ),
        ),
        const Gap(10),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Row(
              children: categories.map((e) {
                return Container(
                  height: 52,
                  margin: const EdgeInsets.only(right: 24),
                  padding: const EdgeInsets.fromLTRB(16, 14, 30, 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        16), // Dinamis, jadi tidak bisa menggunakan const
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        e[1],
                        width: 24,
                        height: 24,
                      ),
                      const Gap(10),
                      Text(
                        e[0],
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff070623)),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }

  Widget buildheader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/logo_Text.png',
            height: 38,
            fit: BoxFit.fitHeight,
          ),
          Container(
            height: 46,
            width: 46,
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Image.asset(
              'assets/ic_notification.png',
              height: 24,
              width: 24,
            ),
          )
        ],
      ),
    );
  }
}
