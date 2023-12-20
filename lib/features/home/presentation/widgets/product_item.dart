import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/routes/routes.dart';
import '../../domain/entities/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.productDetails,
          arguments: product.id,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16.0),
                    ),
                    child: Hero(
                      tag: 'product_image_${product.id}',
                      child: Image.network(
                        product.productVariations![0].productVarientImages?[0].imagePath ?? "",
                        height: 128.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          product.description ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.productVariations![0].price.toString(),
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: Color.fromRGBO(126, 255, 0, 1.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: CircleAvatar(
                  radius: 15.r,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.favorite,
                    color: Color.fromRGBO(126, 255, 0, 1.0),
                    size: 18.h,
                  ),
                ),
              ),
              Positioned(
                bottom: 8.h,
                right: 8.w,
                child: CircleAvatar(
                  radius: 15.r,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.shopping_cart,
                    color:  Color.fromRGBO(126, 255, 0, 1.0),
                    size: 18.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
