import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:shoes_shop/view/infor_product.dart';

import '../model/product.dart';
import '../network/network_request.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Set<String> setMenu = <String>{};

 List<Menu> menuList=[
   Menu('All Products', true),
   ];

 List<Product> productList = [];
 bool isLoading = true;
 List<bool> isClickHeartList = [];
 int currentIndex=0;
  List<Product> productListCurrent = [];
 @override
  initState()  {
    // TODO: implement initState
    super.initState();
    NetworkRequest.fetProduct().then((value) {
      setState(() {
        productList =value;
        isLoading = false;
        isClickHeartList=List.generate(productList.length, (index) => false);
        productListCurrent.addAll(productList) ;
        for(Product product in productList ){
          setMenu.add(product.category.toString().trim());
        }
        for(String setM in setMenu){
          menuList.add(Menu(setM, false));
        }
      });
    });

 }


  @override
   build(BuildContext context)  {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onPanUpdateDownDirection],
      child: SafeArea(child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: RawMaterialButton(
            onPressed: () {},
            elevation: 0.1,
            padding: const EdgeInsets.all(10.0),
            shape: const CircleBorder(),
            child: SvgPicture.asset('assets/images/hamburger.svg'),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/images/highlight_text_black.svg'),
              const Column(
                children: [
                  Text(
                    'Explore',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontFamily: 'Raceway',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          actions: [
            RawMaterialButton(
              onPressed: () {},
              elevation: 2,
              fillColor: Colors.white,
              padding: const EdgeInsets.all(10.0),
              shape: const CircleBorder(),
              child: SvgPicture.asset('assets/images/bag-2.svg'),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 5,),
              Row(
                children: [
                    Container(
                      width:  MediaQuery.of(context).size.width-100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Search',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: const Icon(Icons.search),
                          ),
                        ),
                      ),
                  const SizedBox(width: 5,),
                  Expanded(
                    child: RawMaterialButton(
                      onPressed: () {},
                      elevation: 2,
                      fillColor: Colors.blueAccent,
                      padding: const EdgeInsets.all(15.0),
                      shape: const CircleBorder(),
                      child: SvgPicture.asset('assets/images/sliders.svg'),
                    ),
                  ),
                ],
              ),
               const SizedBox(height: 15,),
               const Row(
                 children: [
                   Text('Select Category',style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.w500
                   ),),
                 ],
               ),
              SizedBox(
                height: 90,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: menuList.length,
                    itemBuilder: (context,index) => GestureDetector (
                      onTap: (){
                        setState(() {
                          for(Menu menu in menuList){
                            menu.isClick=false;
                          }
                          menuList[index].isClick= true;
                          productListCurrent.clear();
                          if(menuList[index].name == 'All Products'){
                            print('all product is called');
                            productListCurrent.addAll(productList);
                          }else {
                            print('other products is called');
                            for (Product product in productList) {
                              if (product.category.toString().trim() ==
                                  menuList[index].name.toString().trim()) {
                                productListCurrent.add(product);
                              }
                            }
                          }
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 5,right: 20,top: 20,bottom: 25),
                        child: Container(
                          width: 100,
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: menuList[index].isClick==false? Colors.white :Colors.blueAccent,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 0,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Text(menuList[index].name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                             color: menuList[index].isClick==false? Colors.black:Colors.white
                          ),),
                        )
                      ),
                    )),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Popular Shoes',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),),
                  Text('See all',style: TextStyle(
                      fontSize:15,
                      color: Colors.blueAccent,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blueAccent
                  ),)
                ],
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productListCurrent.length,
                    itemBuilder: (context,index) => Container(
                        margin: const EdgeInsets.only(left: 5,right: 20,top: 25,bottom: 25),
                        child: Container(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 0,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const InformationProduct(),
                                        settings: RouteSettings(
                                          arguments: ProductInfor(productListCurrent[index],isClickHeartList[index])
                                        ),
                                      ),
                                    );
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(top: 10,left: 15,right: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      isLoading ? const SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: CircularProgressIndicator(),
                                      )
                                          : Image.network(
                                        productListCurrent[index].image.toString(),
                                        width: 200,
                                        height: 250,
                                        fit: BoxFit.contain,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(productListCurrent[index].rating!.rate!>=4? 'Best Seller':'Normal',style: TextStyle(
                                               color: productListCurrent[index].rating!.rate!>=4? Colors.blue :Colors.black,
                                               fontWeight: FontWeight.bold
                                          ),),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text('${productListCurrent[index].title.toString().substring(0,10)}...',style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500
                                          ),),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text('\$${productListCurrent[index].price}',style: const TextStyle(
                                              color: Colors.redAccent,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20
                                          ),),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),

                                   Positioned(
                                      top: 5,
                                      left: 0,
                                      child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              isClickHeartList[index] =!isClickHeartList[index];
                                            });
                                          },child : isClickHeartList[index]? SvgPicture.asset('assets/images/heart_red.svg') : SvgPicture.asset('assets/images/heart_black.svg') )
                                  ),
                                Positioned(
                                  bottom: 20,
                                  right: 0,
                                  child: RawMaterialButton(
                                    onPressed: () {},
                                    elevation: 0.1,
                                    fillColor: Colors.blueAccent,
                                    padding: const EdgeInsets.all(10.0),
                                    shape: const CircleBorder(),
                                    child: const Icon(
                                      Icons.add,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            )
                          )
                      )),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('New Arrivals',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                    ),),
                    Text('See all',style: TextStyle(
                        fontSize:15,
                        color: Colors.blueAccent,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blueAccent
                    ),)
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width-50,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child:  Stack(

                    clipBehavior: Clip.none,
                    children: [
                      const Positioned(
                        top: 15,
                        left: 30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Summer Sale'),
                            Text('15% OFF',style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(103, 77, 197, 1)
                            ),)
                          ],
                        ),
                      ),
                      Positioned(
                          top: 60,
                          left: 10,
                          child: SvgPicture.asset('assets/images/star.svg')),
                      Positioned(
                          top: 20,
                          left: 130,
                          child: SvgPicture.asset('assets/images/star.svg')),
                      Positioned(
                          top: 20,
                          right: 10,
                          child: SvgPicture.asset('assets/images/star.svg')),
                      Positioned(
                          top: 50,
                          left: 200,
                          child: SvgPicture.asset('assets/images/star.svg')),
                      Positioned(
                          top: 20,
                          left: 200,
                          child: SvgPicture.asset('assets/images/new.svg')),
                      Positioned(
                          top: -10,
                          right: 20,
                          child: SvgPicture.asset('assets/images/Nike_Zoom.svg')),
                    ],
                  ),
                ),
                const SizedBox(height: 20,)
              ],
            ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blueAccent,
          items: const [
            BottomNavigationBarItem(
              icon : Icon(Icons.home_filled),
              label: ''
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: ''
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: ''
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: ''
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: ''
            )
          ],
          currentIndex: currentIndex,
          onTap: (index){
            setState(() {
              currentIndex = index;
            });
          },
        ),
      )),
    );
  }

 Future<void> getdata() async {
   try {
    Future<List<Product>> products = NetworkRequest.fetProduct();
    productList = await products;
    setState(() {
      isLoading = false;
    });
   } catch (error) {
   }
 }


}

class Menu{
  var name;
  var isClick;
  Menu(this.name, this.isClick);
}

class ProductInfor{
  Product product;
  bool isFavorite;

  ProductInfor(this.product, this.isFavorite);
}
