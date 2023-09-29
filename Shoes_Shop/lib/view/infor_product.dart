import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoes_shop/model/product.dart';
import 'package:shoes_shop/view/myhome_screen.dart';

class InformationProduct extends StatefulWidget {
  const InformationProduct({super.key});

  @override
  State<InformationProduct> createState() => _InformationProductState();
}

class _InformationProductState extends State<InformationProduct> {
  late bool checkFavorite =false ;

  @override
  Widget build(BuildContext context) {
    ProductInfor? productInfor = ModalRoute.of(context)!.settings.arguments as ProductInfor?;
    Product? product = productInfor?.product;
    checkFavorite = productInfor!.isFavorite;
    if(product != null){
      return SafeArea(
          child:Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
              leading: Container(
                margin: const EdgeInsets.only(left: 20),
                child: RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  elevation: 1,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(8.0),
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
              ),
              title: const Text(
                'Sneaker Shop',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Raceway',
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Đặt màu chữ
                ),
              ),
              actions: [
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 1,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(10.0),
                  shape: const CircleBorder(),
                  child: SvgPicture.asset('assets/images/bag-2.svg'),
                ),
              ],
            ),
            body: Stack(
              children:[ Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: 200,
                        child: Text(product.title.toString(),
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),),
                      ),
                    ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(product.category.toString().toUpperCase(),style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                        fontFamily: 'Raceway'
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child : Text('\$ ${product.price}',style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                        fontFamily: 'Raceway',
                      color: Colors.redAccent
                    ),)
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        SizedBox(
                          width: 250,
                          height: 400,
                          child: Image.network(
                          product.image.toString(),
                          width: 200,
                          height: 250,
                          fit: BoxFit.contain,
                      ),
                        ),
                    ],
                  ),

                  Container(
                    height: 150,
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: SingleChildScrollView(
                      child: Text(product.description.toString(),
                        style: const TextStyle(
                          fontFamily: 'Raceway'
                        ),
                      ),
                    ),
                  )
                ],
              ),
                Positioned(
                  bottom: 10,
                    left: 20,
                    right: 20,
                    child:Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              checkFavorite =!checkFavorite;
                            });
                          },
                          elevation: 0.1,
                          fillColor: const Color.fromRGBO(217, 217, 217, 0.4),
                          padding: const EdgeInsets.all(8.0),
                          shape: const CircleBorder(),
                          child:  Icon(
                            Icons.favorite,
                            size: 30,
                            color: (checkFavorite)? Colors.red : Colors.white,
                          ),
                        ), ),
                        Expanded(
                            flex: 2,
                            child: ElevatedButton.icon(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                            onPressed: (){},
                            icon: const Icon(Icons.add_business,color: Colors.white,size: 30,),
                            label: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('Add to Cart',style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),),
                            )))
                      ],
                    ) )
            ]),
          )
      );
    }
    return Scaffold(

      body: Container(
        alignment: Alignment.center,
        child: const Text('ERROR',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50,
          color: Colors.red,
        ),),
      ),
    ) ;
  }
}
