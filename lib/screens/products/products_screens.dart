import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/utils/colors.dart';
import 'package:flutter_ecommerce/common/utils/fade_page_route.dart';
import 'package:flutter_ecommerce/models/products/brand_model.dart';
import 'package:flutter_ecommerce/models/products/product_model.dart';
import 'package:flutter_ecommerce/providers/products/products_repository.dart';
import 'package:flutter_ecommerce/screens/products/product_details_screen.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductRepository>(context, listen: false).brands(context: context);
      Provider.of<ProductRepository>(context, listen: false).fetchProducts(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        backgroundColor: COLORS.primary,
      ),
      body: Consumer<ProductRepository>(
        builder: (context, provider, child) {
          if(provider.isBrandLoading || provider.isProductLoading){
            return Center(child: CircularProgressIndicator(color: COLORS.primary,),);
          }
          return Padding(
            padding: const EdgeInsets.only(left: 18.0,right: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const SizedBox(height: 20,),
                const Text("Shop by category",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),),
               const SizedBox(height:8,),
                  SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.brandList.length,
                      itemBuilder: (context,index){
                      Brand brand = provider.brandList[index];
                      return Row(
                        children: [
                          Container(
                            width: 100,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color:Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(child: Text(brand.name)),
                          ),
                        ],
                      );

                  }),
                ),
                const SizedBox(height:12,),
               const  Text("Recommended for you",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                ),),
                const SizedBox(height:12,),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:  2,
                      crossAxisSpacing: 12.0,
                      childAspectRatio: .66,
                    ),
                    itemCount: provider.productList.length,
                    itemBuilder: (context, index) {
                      Product product = provider.productList[index];
                      return productCard(product);
                  
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget productCard(Product product){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(FadePageRoute(builder: (context)=>ProductDetails(product: product)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10),

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.22,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,

              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                  tag: product.id,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: product.imageUrls.first,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.productBrand.name,style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500
                  ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.title,style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),),
                      Text(product.price.toString(),style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}