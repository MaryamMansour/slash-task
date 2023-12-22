import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../home/data/data_sources/data_source.dart';
import '../../../home/domain/entities/productDetails.dart';
import '../manager/cubit.dart';
import '../manager/states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/image_Slider.dart';

class ProductDetailsScreen extends StatefulWidget {
  late int productId;

  ProductDetailsScreen(this.productId, {super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

int selectedPrice = 0;
String? selectedImage;

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    ProductDetailsCubit.get(context).getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit(HomeRemoteDto())
        ..getProductDetails(widget.productId),
      child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsError) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Error"),
                content: Text(state.failures.message),
              ),
            );
          }
          if (state is ProductDetailsLoaded) {
            return buildProductDetailsScreen(context, state.product);
          } else {
            return const Scaffold(
              backgroundColor: Colors.white,
              body: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }

  Widget buildProductDetailsScreen(
      BuildContext context, ProductDetails product) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.grey),
        centerTitle: true,
        title: Text(
          "Product Details",
          style: GoogleFonts.quicksand(
            fontSize: 24.sp,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 30,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              size: 30,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildComplexImageSlider(
                ProductDetailsCubit.get(context).productVarientImages ?? [],
              ),
              SizedBox(height: 24),
              Text(
                ProductDetailsCubit.get(context).product?.data?.name ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 16),
              buildChoiceChips(
                'Options',
                ProductDetailsCubit.get(context)
                    .product
                    ?.data
                    ?.avaiableProperties,
              ),
              SizedBox(height: 24),
              Text(
                ProductDetailsCubit.get(context).product?.data?.name ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    height: 34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1, color: Colors.greenAccent),
                    ),
                    child: Icon(
                      Icons.star,
                      color: Colors.green,
                      size: 15,
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    ' ${ProductDetailsCubit.get(context).product?.data?.productRating.toString()}',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 66),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.white),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.remove,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  '1',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              InkWell(
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.white),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Description',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  color: const Color(0xff06004F),
                ),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  // setState(() {
                  //   isExpanded = !isExpanded;
                  // });
                },
                child: Text(
                  ProductDetailsCubit.get(context).product?.data?.description ??
                      "",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Price',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                          color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'EGP ${ProductDetailsCubit.get(context).selectedPrice}',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 33),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.grey[800],
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 32),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_shopping_cart_outlined),
                          SizedBox(width: 16),
                          Text(
                            'Add to Cart',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChoiceChips(String label, List<AvaiableProperties>? properties) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            color: const Color(0xff06004F),
          ),
        ),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: properties?.map((property) {
                return buildPropertyChoiceChips(property);
              }).toList() ??
              [],
        ),
      ],
    );
  }

  Widget buildPropertyChoiceChips(AvaiableProperties property) {
    // Use a Set to ensure unique values
    Set<String> uniqueValues = Set<String>();

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: property.values?.map((value) {
            // Check if the value is unique before adding it
            if (uniqueValues.add(value.value ?? "")) {
              return ChoiceChip(
                label: Text(
                  value.value.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                selected: false, // Set to true if the chip is selected
                backgroundColor: Colors.grey,
                onSelected: (bool selected) {
                  backgroundColor:
                  Colors.blue;

                  updateProductDetails(property.property, value);
                },
              );
            } else {
              // Value is not unique, don't create a chip for it
              return SizedBox.shrink();
            }
          }).toList() ??
          [],
    );
  }

  updateProductDetails(String? propertyName, Values selectedOption) {
    ProductDetailsCubit cubit = ProductDetailsCubit.get(context);
    ProductDetails? productDetails = cubit.product;

    print(
        "WHAT${ProductDetailsCubit.get(context).product?.data?.variations?.length}");
    print(propertyName);
    if (productDetails != null && propertyName != null) {
      // Find the corresponding variation based on the selected option
      Variations selectedVariation = findVariationByOption(
        productDetails,
        propertyName,
        selectedOption,
      );

      ProductDetailsCubit.get(context).updateVariation(
          selectedVariation.price, selectedVariation.productVarientImages);
    }
  }

  Variations findVariationByOption(ProductDetails productDetails,
      String? propertyName, Values selectedOption) {
    List<Variations> variations = productDetails.data!.variations ?? [];

    for (Variations variation in variations) {
      List<ProductPropertiesValues> values =
          variation.productPropertiesValues ?? [];
      if (values.any((value) =>
          value.property == propertyName &&
          value.value == selectedOption.value)) {
        return variation;
      }
    }

    return variations.first;
  }
}
