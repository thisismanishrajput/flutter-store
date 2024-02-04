import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/utils/colors.dart';
import 'package:flutter_ecommerce/common/utils/constant.dart';
import 'package:flutter_ecommerce/models/products/product_model.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key,required this.product});
final Product product;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Product Details"),),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0,right: 18,top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height*0.4,
              child: FadeInUp(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: widget.product.imageUrls.first,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FadeInUp(
                  child: Text(widget.product.title,style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),),
                ),
                FadeInUp(
                  delay:const Duration(milliseconds: 100),
                  child: Text(widget.product.price.toString(),style:const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),),
                ),
              ]
            ),
            FadeInUp(
                delay: const Duration(milliseconds: 200),
                child: const Divider()),
            const SizedBox(height: 15,),
            FadeInUp(
                delay:const Duration(milliseconds: 300),
                child:const Text("Description",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),)),

            FadeInUp(
                delay:const Duration(milliseconds: 300),
                child: Text(widget.product.description,style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 14),)),
            const SizedBox(height: 15,),
            Expanded(
              child: FadeInUp(
                delay:const Duration(milliseconds: 400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      const Text("Reviews & Rating",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                    const SizedBox(height: 15,),
                  Expanded(
                      child: ListView.builder(
                        itemCount: widget.product.ratings.length,
                        itemBuilder: (context,index){
                        Rating rating = widget.product.ratings[index];
                         return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(rating.review,style:const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                    ),),
                                    Text(formatDateTime(rating.date))
                                  ],
                                ),
                                  Row(
                                    children: [
                                      for(int i = 0;i<rating.rating;i++)
                                        const Icon(Icons.star,size: 20,color: COLORS.primary,)
                                    ],
                        )
                      ],
                    );
                  }))
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
