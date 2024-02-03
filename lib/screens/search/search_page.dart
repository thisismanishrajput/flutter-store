import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/utils/constant.dart';
import 'package:flutter_ecommerce/common/utils/fade_page_route.dart';
import 'package:flutter_ecommerce/models/products/product_model.dart';
import 'package:flutter_ecommerce/providers/products/products_repository.dart';
import 'package:flutter_ecommerce/screens/products/product_details_screen.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 18.0,right: 18,top: 10),
          child: Column(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(50)
                ),
                child:   TextField(
                  controller: _searchController,
                  onChanged: (val){
                    if(val.isEmpty || _searchController.text.isEmpty){
                      Provider.of<ProductRepository>(context,listen: false).clearData();
                    }else{
                      Provider.of<ProductRepository>(context,listen: false).searchProduct(query: val);
                    }

                  },
                  decoration:InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white12,
                    contentPadding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 15),
                    enabledBorder:const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent, width: 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    focusedBorder:  const  OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent, width: 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    hintText: "Search here..",
                      hintStyle: AppTheme.hintStyle(context).copyWith(color: Theme.of(context).textTheme.headlineMedium!.color)
                  ),
                ),
              ),
              Consumer<ProductRepository>(
                builder: (context, provider, child) {
                return  Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:  2,
                      crossAxisSpacing: 12.0,
                      childAspectRatio: .66,
                    ),
                    itemCount: provider.searchedProductList.length,
                    itemBuilder: (context, index) {
                      Product product = provider.searchedProductList[index];
                      return productCard(product);

                    },
                  ),
                );
                },
              )
            ],
          ),
        ),
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
