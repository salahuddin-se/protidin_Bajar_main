import 'dart:convert';
import 'dart:developer';
import 'package:customer_ui/HomePage/grocer_offer/grocery_offer_page.dart';
import 'package:customer_ui/HomePage/offer/offer_page.dart';
import 'package:customer_ui/OthersPage/All_offerPage.dart';
import 'package:customer_ui/OthersPage/myOrders.dart';
import 'package:customer_ui/OthersPage/myaccopunt.dart';
import 'package:customer_ui/OthersPage/requestProduct.dart';
import 'package:customer_ui/OthersPage/tarck_order.dart';
import 'package:customer_ui/OthersPage/wallet.dart';
import 'package:customer_ui/components/size_config.dart';
import 'package:customer_ui/components/styles.dart';
import 'package:customer_ui/components/utils.dart';
import 'package:customer_ui/dataModel/breat_biscuit.dart';
import 'package:customer_ui/dataModel/category_data_model.dart';
import 'package:customer_ui/dataModel/groceryTopDeals.dart';
import 'package:customer_ui/dataModel/grocery_data_model.dart';
import 'package:customer_ui/dataModel/ruf.dart';
import 'package:customer_ui/dataModel/topdeals.dart';
//import 'package:customer_ui/dataModel/category_data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../HomePage/gorcery_item_widget.dart';
import '../HomePage/item_widget.dart';
import '../HomePage/offer_widget.dart';
import '../test_demo.dart';

class CategoryHomeScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CategoryHomeScreen> {


  ///
  var categoryData=[];

  Future<void> getCategory() async {
    log("comes");
    String productURl = "https://test.protidin.com.bd/api/v2/categories/top";

    final response = await get(Uri.parse(productURl), headers: {"Accept": "application/json"});

    var dataMap=jsonDecode(response.body);

    if(dataMap["success"]==true){
      log("data valid");

      var categoryDataModel=CategoryDataModel.fromJson(dataMap);
      categoryData=categoryDataModel.data;
      setState(() {

      });
      log("data length ${categoryData.length}");

    }else{
      log("data invalid");
    }

   // log("after decode $dataMap");

  }

  @override
  void initState(){
    // TODO: implement initState
    // autoData=await getData();
    getBreadBiscuit();
    getGroceryTopDeals();
    getGrocery();
    getTopDeals();
    getCategory();

  }
  ///


  ///
  var topDeals=[];

    Future<void> getTopDeals() async {
      log("comes2");
      String topURl = "https://test.protidin.com.bd/api/v2/products/brand/3";

      final response2 = await get(Uri.parse(topURl), headers: {"Accept": "application/json"});

      var topDealsdataMap=jsonDecode(response2.body);

      if(topDealsdataMap["success"]==true){
        log("data valid2");

        var topCategoryDataModel=TopDeals.fromJson(topDealsdataMap);
        topDeals=topCategoryDataModel.data;
        setState(() {

        });
        log("data length ${topDeals.length}");

      }else{
        log("data invalid");
      }

      // log("after decode $dataMap");

    }

  /*void initState2(){
    // TODO: implement initState
    // autoData=await getData();
    getTopDeals();
    super.initState();

  }*/
  ///



  ///
  var grocery=[];

  Future<void> getGrocery() async {
    log("comes3");
    String groceryURl = "https://test.protidin.com.bd/api/v2/filter/brands";

    final response3 = await get(Uri.parse(groceryURl), headers: {"Accept": "application/json"});

    var groceryDataMap=jsonDecode(response3.body);

    if(groceryDataMap["success"]==true){
      log("data valid3");

      var groceryDataModel=Grocery.fromJson(groceryDataMap);
      grocery=groceryDataModel.data;
      setState(() {

      });
      log("data length ${grocery.length}");

    }else{
      log("data invalid");
    }

    // log("after decode $dataMap");

  }

  /*void initState2(){
    // TODO: implement initState
    // autoData=await getData();
    getTopDeals();
    super.initState();

  }*/
  ///


  ///
  var groceryTopDeals=[];

  Future<void> getGroceryTopDeals() async {
    log("comes4");
    String groceryTopDealsURl = "https://test.protidin.com.bd/api/v2/products/brand/1";

    final response4 = await get(Uri.parse(groceryTopDealsURl), headers: {"Accept": "application/json"});

    var groceryTopDealsDataMap=jsonDecode(response4.body);

    if(groceryTopDealsDataMap["success"]==true){
      log("data valid4");

      var groceryDataModel=GroceryTopDeals .fromJson(groceryTopDealsDataMap);
      groceryTopDeals=groceryDataModel.data;
      setState(() {

      });
      log("data length ${groceryTopDeals.length}");

    }else{
      log("data invalid");
    }

    // log("after decode $dataMap");

  }

  /*void initState2(){
    // TODO: implement initState
    // autoData=await getData();
    getTopDeals();
    super.initState();

  }*/
  ///

  ///
  var breadBiscuits=[];

  Future<void> getBreadBiscuit() async {
    log("comes5");
    String breadBiscuitsURl = "https://test.protidin.com.bd/api/v2/products/category/41";

    final response5 = await get(Uri.parse(breadBiscuitsURl), headers: {"Accept": "application/json"});

    var breadDataMap=jsonDecode(response5.body);

    if(breadDataMap["success"]==true){
      log("data valid5");

      var breadDataModel= BreadBiscuit.fromJson(breadDataMap);
      breadBiscuits=breadDataModel.data;
      setState(() {

      });
      log("data length ${breadBiscuits.length}");

    }else{
      log("data invalid");
    }

    // log("after decode $dataMap");

  }

  /*void initState2(){
    // TODO: implement initState
    // autoData=await getData();
    getTopDeals();
    super.initState();

  }*/
  ///




  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    var width = SizeConfig.screenWidth;
    var height = SizeConfig.screenHeight;
    var block = SizeConfig.block;

    return SafeArea(
      child: Scaffold(
        ///
          key: scaffoldKey,
          ///
          drawer: Drawer(

            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Container(

                    height: 200,
                    width: MediaQuery.of(context).size.width/1.2,
                    child: Column(
                        children: [

                          SizedBox(height: 20,),

                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                //color: Colors.white,
                                height: 60,
                                width: 60,
                                child: Image.asset("assets/img_135.png",),
                              ),
                              Padding(padding: const EdgeInsets.fromLTRB(20,0,0,0),),
                              Container(
                                width: 120,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment:Alignment.centerLeft,
                                      child: Text(
                                        "Welcome ",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400,),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Align(
                                      alignment:Alignment.centerLeft,
                                      child:Text(
                                        "Md. Abcdef ghijkl",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w900,),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],

                          ),
                        ]
                    ),

                  ),        decoration: BoxDecoration(
                  color: Color(0xFF9900FF),
                ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Container(
                        //color: Colors.white,
                        height: 20,
                        width: 20,
                        child: Image.asset("assets/img_149.png",color: Colors.black,),
                      ),
                      Padding(padding: const EdgeInsets.fromLTRB(20,0,0,0),),
                      Text('Track Order',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w700,),),

                    ],
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TrackOrder()));
                  },
                ),
                ListTile(
                  title: Row(
                    children: [
                      Container(
                        //color: Colors.white,
                        height: 20,
                        width: 20,
                        child: Image.asset("assets/img_150.png",color: Colors.black,),
                      ),
                      Padding(padding: const EdgeInsets.fromLTRB(20,0,0,0),),
                      Text('My Orders',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w700,),),

                    ],
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrder()));
                  },
                ),
                ListTile(
                  title: Row(
                    children: [
                      Container(
                        //color: Colors.white,
                        height: 20,
                        width: 20,
                        child: Image.asset("assets/img_151.png",color: Colors.black,),
                      ),
                      Padding(padding: const EdgeInsets.fromLTRB(20,0,0,0),),
                      Text('Categories',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w700,),),

                    ],
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>GroceryOfferPage()));
                  },
                ),

                ListTile(
                  title: Row(
                    children: [
                      Container(
                        //color: Colors.white,
                        height: 20,
                        width: 20,
                        child: Image.asset("assets/img_152.png",color: Colors.black,),
                      ),
                      Padding(padding: const EdgeInsets.fromLTRB(20,0,0,0),),
                      Text('Wallet',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w700,),),

                    ],
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyWallet()));
                  },
                ),

                ListTile(
                  title: Row(
                    children: [
                      Container(
                        //color: Colors.white,
                        height: 20,
                        width: 20,
                        child: Image.asset("assets/img_153.png",color: Colors.black,),
                      ),
                      Padding(padding: const EdgeInsets.fromLTRB(20,0,0,0),),
                      Text('Request a product',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w700,),),

                    ],
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ReqquestPage()));
                  },
                ),

                ListTile(
                  title: Row(
                    children: [
                      Container(
                        //color: Colors.white,
                        height: 20,
                        width: 20,
                        child: Image.asset("assets/img_149.png",color: Colors.black,),
                      ),
                      Padding(padding: const EdgeInsets.fromLTRB(20,0,0,0),),
                      Text('Call to order',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w700,),),

                    ],
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TrackOrder()));
                  },
                ),

                ListTile(
                  title: Row(
                    children: [
                      Container(
                        //color: Colors.white,
                        height: 20,
                        width: 20,
                        child: Image.asset("assets/img_154.png",color: Colors.black,),
                      ),
                      Padding(padding: const EdgeInsets.fromLTRB(20,0,0,0),),
                      Text('My Account',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w700,),),

                    ],
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyAccountPage()));
                  },
                ),
              ],
            ),
          ),
        ///



          backgroundColor: Colors.white,
          //backgroundColor: Colors.indigo[50],
          body: SingleChildScrollView(
              child: Padding(
            //padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 15.0),
            child: Column(children: [

              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width/1.1,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.150,
                      color: Colors.cyan,
                    ),
                    color: Color(0xFF9900FF),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5, //spread radius
                        blurRadius: 5, // blur radius
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),

                  //width: 330,
                  //width: MediaQuery.of(context).size.width/1.1,
                  height: 45,

                  child: Row(
                    children: [
                      SizedBox(
                        height: 20,
                        //width: 80,
                        width: MediaQuery.of(context).size.width/7,
                        child: Image.asset("assets/img_27.png"),
                      ),

                      SizedBox(
                        height: 20,
                        //width: 230,
                        width: MediaQuery.of(context).size.width*4/6.5,
                        child: Image.asset("assets/img_29.png"),
                      ),


                      SizedBox(
                        width: MediaQuery.of(context).size.width/7,
                        height: 20,
                        //width: 100,
                        child: InkWell(
                          onTap: () {
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => GroceryOfferPage()));
                            if(!scaffoldKey.currentState!.isDrawerOpen){ //check if drawer is closed
                              scaffoldKey.currentState!.openDrawer(); //open drawer
                            }
                          },
                          child: Container(
                              child: Image.asset("assets/img_184.png")),
                        ),
                      ),


                    ],
                  ),
                ),
              ),


              sized10,
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 40,
                    //width: 200,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Row(
                      children: [
                        SizedBox(height: 17, child: Image.asset("assets/img_49.png")),
                        Text(
                          "  Protidin PG Store, Shahbag  ",
                          style: TextStyle(color: Color(0xFF515151), fontSize: 13, fontWeight: FontWeight.w700,fontFamily: "CeraProBold",),
                        ),
                        Container(
                          height: 10,
                            child: Image.asset(
                                "assets/img_50.png",
                            height: 5,)
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 5,
              ),

              ///
              Container(
                //width: 320.0,
                width: MediaQuery.of(context).size.width / 1,
                height: 185.0,
                decoration:
                    const BoxDecoration(image: DecorationImage(image: AssetImage("assets/img_32.png"), fit: BoxFit.cover)),

                child: Row(
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width /2.5,
                        child: Image.asset("assets/img_33.png")
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width /2,
                        child: SizedBox(
                          height: 105,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Enjoy buy 1 get one offer\n throughout september",
                                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AllOfferPage()));
                                    },
                                    child: SizedBox(
                                      height: 55,
                                      width: 95,
                                      child: Image.asset("assets/img_35.png"),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),

              ///

              SizedBox(
                height: 20,
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Expanded(
                      child: Text(
                        "Offer for you",
                        style: TextStyle(color: Color(0xFF515151), fontSize: 22, fontWeight: FontWeight.w700,fontFamily: "CeraProBold"),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AllOfferPage()));
                      },
                      child: Text(
                        "VIEW ALL",
                        style: TextStyle(color: Color(0xFF515151), fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ),

                  ],
                ),
              ),
              //sized10,

              SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: FittedBox(
                    child: SizedBox(
                      //width: MediaQuery.of(context).size.width/1.1,
                      child: Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => OfferPage()));
                            },
                            child: OfferWidget(
                              color: Colors.blue[400],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                          ),
                          OfferWidget(
                            color: Colors.blue[400],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                          ),
                          OfferWidget(
                            color: Colors.blue[400],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                          ),
                          OfferWidget(
                            color: Colors.blue[400],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                          ),
                          OfferWidget(
                            color: Colors.blue[400],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                          ),
                          OfferWidget(
                            color: Colors.blue[400],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),



              Container(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      //height: 685,
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Column(children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Shop By Category",
                            style: TextStyle(color: Color(0xFF515151), fontSize: 22, fontWeight: FontWeight.w700,fontFamily: "CeraProBold"),
                          ),
                        ),

                        SizedBox(height: 12,),

                        /*Container(
                          height: height*0.15,
                          width: width,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: categoryData.length,
                            itemBuilder: (_,index){
                              return Container(
                                
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(imagePath+categoryData[index].banner,height: height*0.1,),
                                    Text(categoryData[index].name
                                   
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),*/

                        Container(
                          height: height*0.3,
                          width: width,
                          //width: width*0.4,
                          //height: height * 0.2,
                          //width: width*0.35,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: categoryData.length,
                            itemBuilder: (_,index){
                              return Container(
                                //height: height * 0.2,
                                height: height * 0.2,
                                width: width*0.35,
                                margin: EdgeInsets.symmetric(vertical: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  /*boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 1),
                                        blurRadius: 2,
                                        spreadRadius: 2,
                                        color: Colors.black.withOpacity(0.1),
                                      ),
                                    ],*/
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(child: Image.network(imagePath+categoryData[index].banner)),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(2,2,0,5,),
                                      child: Container(
                                        //height: MediaQuery.of(context).size.height/20,
                                        height: MediaQuery.of(context).size.height/14,
                                        child: Text(
                                          categoryData[index].name,
                                          style: TextStyle(color: Color(0xFF515151), fontWeight: FontWeight.w700, fontSize:16),textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),

                        ////////

                        /*Container(
                          height: height*0.15,
                          width: width,
                          child: ListView.builder(
                              shrinkWrap:true,
                              scrollDirection: Axis.horizontal,
                              itemCount: categoryData.length,
                              itemBuilder: (_,index){
                                return Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network(imagePath+categoryData[index].banner,height: height*0.1,),
                                      Text(categoryData[index].name)
                                    ],
                                  ),
                                );
                              }

                          ),
                        ),*/


                        SizedBox(
                          height: 0,
                        ),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Essentials- Top Deals",
                            style: TextStyle(color: Color(0xFF515151), fontSize: 22, fontWeight: FontWeight.w700,fontFamily: "CeraProBold"),
                          ),
                        ),

                        SizedBox(height: 13,),


                      ]),
                    ),

                  ],
                ),
              ),


              
              ///


              /*Container(
                height: height*0.3,
                width: width,
                child: ListView.builder(
                    shrinkWrap:true,
                    scrollDirection: Axis.horizontal,
                    itemCount: topDeals.length,
                    itemBuilder: (_,index){
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: MediaQuery.of(context).size.width/5,
                                height: MediaQuery.of(context).size.height/45,
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(4.0),
                                      bottomRight: Radius.circular(4.0)
                                  ),

                                ),
                                //

                                child: Center(
                                  child: Text(
                                    "15% OFF",
                                    style: TextStyle(color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                            Image.network(imagePath+topDeals[index].thumbnailImage,height: height*0.1,),
                            Text(topDeals[index].name),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Center(
                                child: Container(
                                  height: MediaQuery.of(context).size.height/32,
                                  width: MediaQuery.of(context).size.width/2.34,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [

                                      Container(
                                        child: Image.asset("assets/p.png"),
                                        height: 20,
                                        width: 22,
                                      ),
                                      //Text(topDeals[index].name),
                                      Text(topDeals[index].basePrice.toString(),style: TextStyle(
                                          color: Color(0xFF515151),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)
                                      ),
                                      //baseDiscountedPrice
                                      Text(topDeals[index].baseDiscountedPrice.toString(),
                                          style: TextStyle(
                                              color: Color(0xFFA299A8),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              decoration: TextDecoration.lineThrough)
                                      ),
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(

                                            color: kPrimaryColor,shape: BoxShape.circle),
                                        child: Center(
                                          child: Icon(
                                            Icons.shopping_cart_rounded,
                                            color: Colors.white,

                                          ),
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                ),
              ),*/

              Padding(
                padding: const EdgeInsets.fromLTRB(15,0,8,0),
                child: Container(
                  height: height*0.31,
                  width: width,
                  child: ListView.builder(
                      shrinkWrap:true,
                      scrollDirection: Axis.horizontal,
                      itemCount: breadBiscuits.length,
                      itemBuilder: (_,index){
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFF1EDF2),
                                borderRadius: BorderRadius.circular(15.0)
                            ),
                            //height: MediaQuery.of(context).size.height/3.2,
                            width: MediaQuery.of(context).size.width/2.34,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width/5,
                                    height: MediaQuery.of(context).size.height/45,
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(4.0),
                                          bottomRight: Radius.circular(4.0)
                                      ),

                                    ),
                                    //

                                    child: Center(
                                      child: Text(
                                        "15% OFF",
                                        style: TextStyle(color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),


                                Container(
                                  child: Image.network(imagePath+breadBiscuits[index].thumbnailImage),
                                  height: MediaQuery.of(context).size.height/8,
                                  width: MediaQuery.of(context).size.width/2.34,
                                ),


                                FittedBox(
                                  child: Container(
                                    ///height: height! * 0.08,
                                    width: MediaQuery.of(context).size.width/2.36,
                                    height: MediaQuery.of(context).size.height/20,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(5,5,5,0),
                                      child: Text(
                                        breadBiscuits[index].name,
                                        style: TextStyle(color: Color(0xFF515151), fontSize: 12.5, fontWeight: FontWeight.w600,fontFamily: "CeraProBold",),maxLines: 2,
                                        textAlign: TextAlign.center,

                                      ),
                                    ),
                                  ),
                                ),



                                Center(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/38,
                                    child: Text(
                                      "5 lit",
                                      style: TextStyle(color: Colors.grey.withOpacity(0.9)),
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Center(
                                    child: Container(
                                      height: MediaQuery.of(context).size.height/32,
                                      width: MediaQuery.of(context).size.width/2.34,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [

                                          Container(
                                            child: Image.asset("assets/p.png"),
                                            height: 20,
                                            width: 22,
                                          ),
                                          Text(breadBiscuits[index].basePrice.toString(),style: TextStyle(
                                              color: Color(0xFF515151),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700)
                                          ),
                                          Text(breadBiscuits[index].baseDiscountedPrice.toString(),
                                              style: TextStyle(
                                                  color: Color(0xFFA299A8),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  decoration: TextDecoration.lineThrough)
                                          ),
                                          Container(
                                            height: 25,
                                            width: 25,
                                            decoration: BoxDecoration(

                                                color: kPrimaryColor,shape: BoxShape.circle),
                                            child: Center(
                                              child: Icon(
                                                Icons.shopping_cart_rounded,
                                                color: Colors.white,

                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                  ),
                                ),


                                Container(
                                  //height: height! * 0.03,
                                  height: MediaQuery.of(context).size.height/26,
                                  width: MediaQuery.of(context).size.width/2.34,
                                  decoration: BoxDecoration(
                                      color: Colors.lightGreen[100],
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(1, 3, 1, 3),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [


                                        Container(
                                          child: Image.asset("assets/img_42.png"),
                                          height: 17,
                                          width: 15,
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(top: 2),
                                          child: Text(
                                            "  Earning +৳18",
                                            style: TextStyle(fontSize: 12,
                                                color: Colors.green,
                                                fontWeight: FontWeight.w600),

                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                )


                              ],
                            ),
                          ),
                        );
                      }
                  ),
                ),
              ),
              //Padding(padding: const EdgeInsets.fromLTRB(15,0,8,0),),
              /*Container(
                decoration: BoxDecoration(
                    color: Color(0xFFF1EDF2),
                    borderRadius: BorderRadius.circular(15.0)
                ),
                //height: MediaQuery.of(context).size.height/3.2,
                width: MediaQuery.of(context).size.width/2.34,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: MediaQuery.of(context).size.width/5,
                        height: MediaQuery.of(context).size.height/45,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(4.0),
                              bottomRight: Radius.circular(4.0)
                          ),

                        ),
                        //

                        child: Center(
                          child: Text(
                            "15% OFF",
                            style: TextStyle(color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),


                    Container(
                      child: Image.asset("assets/img_89.png"),
                      height: MediaQuery.of(context).size.height/8,
                      width: MediaQuery.of(context).size.width/2.34,
                    ),


                    FittedBox(
                      child: Container(
                        ///height: height! * 0.08,
                        width: MediaQuery.of(context).size.width/2.36,
                        height: MediaQuery.of(context).size.height/20,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(3,0,3,0),
                          child: Text(
                            "ACI Healthy 100%\npure soyabean oil",
                            style: TextStyle(color: Color(0xFF515151), fontSize: 12.5, fontWeight: FontWeight.w600,fontFamily: "CeraProBold",),maxLines: 2,
                            textAlign: TextAlign.center,

                          ),
                        ),
                      ),
                    ),


                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height/38,
                        child: Text(
                          "5 lit",
                          style: TextStyle(color: Colors.grey.withOpacity(0.9)),
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height/32,
                          width: MediaQuery.of(context).size.width/2.34,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              Container(
                                child: Image.asset("assets/p.png"),
                                height: 20,
                                width: 22,
                              ),
                              Text("৳500",style: TextStyle(
                                  color: Color(0xFF515151),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700)
                              ),
                              Text("৳525",
                                  style: TextStyle(
                                      color: Color(0xFFA299A8),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.lineThrough)
                              ),
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(

                                    color: kPrimaryColor,shape: BoxShape.circle),
                                child: Center(
                                  child: Icon(
                                    Icons.shopping_cart_rounded,
                                    color: Colors.white,

                                  ),
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                    ),


                    Container(
                      //height: height! * 0.03,
                      height: MediaQuery.of(context).size.height/26,
                      width: MediaQuery.of(context).size.width/2.34,
                      decoration: BoxDecoration(
                          color: Colors.lightGreen[100],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(1, 3, 1, 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [


                            Container(
                              child: Image.asset("assets/img_42.png"),
                              height: 17,
                              width: 15,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Text(
                                "  Earning +৳18",
                                style: TextStyle(fontSize: 12,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600),

                              ),
                            ),

                          ],
                        ),
                      ),
                    )


                  ],
                ),
              ),*/

              ///



              /*Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      ProductItemsWidget(
                        height: height,
                        width: width,
                        block: block,
                        image: "assets/img_89.png",
                        productName: "ACI Healthy 100%\npure soyabean oil",//-hgfhg hf gf jhgjh  uygykg iuywt wuity",
                        productWeight: "5 lit",
                        productActualPrice: "৳125",
                        productOfferPrice: "৳100",
                      ),

                    /*return Scaffold(
                      body: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (_,index){
                        return Text("Ref: ${list[index].references}  Grade ${list[index].grade}");
                      },
                       ),
                    );*/


                      Padding(padding: const EdgeInsets.only(left: 8.0),),

                      ProductItemsWidget(
                        height: height,
                        width: width,
                        block: block,
                        image: "assets/lays.png",
                        productName: "Lays Premium taste\nChips orange",//-gfgh rtefetr hjif iuwyiu ",
                        productWeight: "60g",
                        productActualPrice: "৳400",
                        productOfferPrice: "৳300",
                      ),

                      Padding(padding: const EdgeInsets.only(left: 8.0),),

                      ProductItemsWidget(
                        height: height,
                        width: width,

                        block: block,
                        image: "assets/cadebry.png",
                        productName: "Cadbery Chocolate \nMilk Candy",
                        productWeight: "20g",
                        productActualPrice: "৳120",
                        productOfferPrice: "৳110",
                      ),

                    ]
                    )
                ),
              ),*/
              //

              sized20,
              SizedBox(height: 5,),
              Container(
                width: MediaQuery.of(context).size.width/1,
                //margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: kPrimaryColor, borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "1-99 Store",
                            style: TextStyle(fontFamily: "CeraProBold", fontSize: 22,color: Colors.white,fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "VIEW ALL",
                            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      sized10,
                      Center(
                        child: Stack(
                          children: [
                            Image.asset("assets/posterfive.png"),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Row(
                                children: [
                                  Text(
                                    "Everything under ৳99",
                                    style: TextStyle(color: Colors.white, fontSize:16, fontWeight:FontWeight.w700,fontFamily: "CeraProBold"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      child: Image.asset("assets/v.png"),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      sized10,
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(children: [
                              ProductItemsWidget(
                                height: height,
                                width: width,
                                block: block,
                                image: "assets/img_89.png",
                                productName: "ACI Healthy 100%\npure soyabean oil",
                                productWeight: "5 lit",
                                productActualPrice: "৳125",
                                productOfferPrice: "৳100",
                              ),
                              Padding(padding: const EdgeInsets.only(left: 8.0),),
                              ProductItemsWidget(
                                height: height,
                                width: width,
                                block: block,
                                image: "assets/lays.png",
                                productName: "Lays Premium taste\nChips orange",
                                productWeight: "60g",
                                productActualPrice: "৳400",
                                productOfferPrice: "৳300",
                              ),
                              Padding(padding: const EdgeInsets.only(left: 8.0),),
                              ProductItemsWidget(
                                height: height,
                                width: width,
                                block: block,
                                image: "assets/cadebry.png",
                                productName: "Cadbery Chocolate \nMilk Candy",
                                productWeight: "20g",
                                productActualPrice: "৳120",
                                productOfferPrice: "৳110",
                              ),
                            ]
                            )
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              sized20,



              Container(
                width: MediaQuery.of(context).size.width/1.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Grocery",
                      style: TextStyle(color: Color(0xFF515151), fontSize: 22, fontWeight:FontWeight.w700,fontFamily: "CeraProBold"),
                    ),
                    Text(
                      "VIEW ALL",
                      style: TextStyle(color: Color(0xFF515151), fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              sized20,

              Stack(
                children: [
                  Image.asset("assets/posterone.png"),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Row(
                      children: [
                        Text(
                          "Shop for daily needs",
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight:FontWeight.w700,fontFamily: "CeraProBold"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Container(
                            height: 15,
                            width: 15,
                            child: Image.asset("assets/v.png"),

                          ),
                        )
                      ],
                    ),
                  )
                  ]
              ),
              sized20,


              /*Container(
                width: MediaQuery.of(context).size.width/1.1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GroceryItemWidget(
                        height: height,
                        width: width,
                        block: block,
                        image: "assets/rin.png",
                        title: "Essentials\nItem",
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      GroceryItemWidget(
                        height: height,
                        width: width,
                        block: block,
                        image: "assets/whitechips.png",
                        title: "Snacks\nItem",
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      GroceryItemWidget(
                        height: height,
                        width: width,
                        block: block,
                        image: "assets/dove.png",
                        title: "Personal\nCare",
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      GroceryItemWidget(
                        height: height,
                        width: width,
                        block: block,
                        image: "assets/lays.png",
                        title: "Chips\nChocolate",
                      ),

                    ],
                  ),
                ),
              ),*/


              /*Container(
                          height: height*0.15,
                          width: width,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: categoryData.length,
                            itemBuilder: (_,index){
                              return Container(

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(imagePath+categoryData[index].banner,height: height*0.1,),
                                    Text(categoryData[index].name

                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),*/

              Container(
                height: height*0.2,
                width: width,
                //width: width*0.4,
                //height: height * 0.2,
                //width: width*0.35,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: grocery.length,
                  itemBuilder: (_,index){
                    return Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Container(
                        //height: height * 0.2,
                        height: height * 0.2,
                        width: width*0.35,
                        margin: EdgeInsets.symmetric(vertical: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),

                        ),
                        child: Column(
                          children: [
                            Container(
                              height: height*0.15,
                              width: width*0.30,
                              decoration: BoxDecoration(
                                  color: Color(0xFFF0E6F2),
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              child: Center(
                                child:Image.network(imagePath+grocery[index].logo,
                                ),
                              ),
                            ),
                            sized5,
                            Text(
                                grocery[index].name,
                              style: TextStyle(color: Color(0xFF515151), fontSize: block * 4, fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      ),
                    );
                  },
                ),
              ),



              SizedBox(height: 5,),
              //sized20,
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Grocery- Top Deals",
                    style: TextStyle(color: Color(0xFF515151), fontSize: 22, fontWeight:FontWeight.w700,fontFamily: "CeraProBold"),
                  ),
                ),
              ),
              sized20,
              Padding(
                padding: const EdgeInsets.fromLTRB(15,0,8,0),
                child: Container(
                  height: height*0.31,
                  width: width,
                  child: ListView.builder(
                      shrinkWrap:true,
                      scrollDirection: Axis.horizontal,
                      itemCount: topDeals.length,
                      itemBuilder: (_,index){
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFF1EDF2),
                                borderRadius: BorderRadius.circular(15.0)
                            ),
                            //height: MediaQuery.of(context).size.height/3.2,
                            width: MediaQuery.of(context).size.width/2.34,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width/5,
                                    height: MediaQuery.of(context).size.height/45,
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(4.0),
                                          bottomRight: Radius.circular(4.0)
                                      ),

                                    ),
                                    //

                                    child: Center(
                                      child: Text(
                                        "15% OFF",
                                        style: TextStyle(color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),


                                Container(
                                  child: Image.network(imagePath+topDeals[index].thumbnailImage),
                                  height: MediaQuery.of(context).size.height/8,
                                  width: MediaQuery.of(context).size.width/2.34,
                                ),


                                FittedBox(
                                  child: Container(
                                    ///height: height! * 0.08,
                                    width: MediaQuery.of(context).size.width/2.36,
                                    height: MediaQuery.of(context).size.height/20,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(5,5,5,0),
                                      child: Text(
                                        topDeals[index].name,
                                        style: TextStyle(color: Color(0xFF515151), fontSize: 12.5, fontWeight: FontWeight.w600,fontFamily: "CeraProBold",),maxLines: 2,
                                        textAlign: TextAlign.center,

                                      ),
                                    ),
                                  ),
                                ),


                                Center(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/38,
                                    child: Text(
                                      "5 lit",
                                      style: TextStyle(color: Colors.grey.withOpacity(0.9)),
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Center(
                                    child: Container(
                                      height: MediaQuery.of(context).size.height/32,
                                      width: MediaQuery.of(context).size.width/2.34,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [

                                          Container(
                                            child: Image.asset("assets/p.png"),
                                            height: 20,
                                            width: 22,
                                          ),
                                          Text(topDeals[index].basePrice.toString(),style: TextStyle(
                                              color: Color(0xFF515151),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700)
                                          ),
                                          Text(topDeals[index].baseDiscountedPrice.toString(),
                                              style: TextStyle(
                                                  color: Color(0xFFA299A8),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  decoration: TextDecoration.lineThrough)
                                          ),
                                          Container(
                                            height: 25,
                                            width: 25,
                                            decoration: BoxDecoration(

                                                color: kPrimaryColor,shape: BoxShape.circle),
                                            child: Center(
                                              child: Icon(
                                                Icons.shopping_cart_rounded,
                                                color: Colors.white,

                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                  ),
                                ),


                                Container(
                                  //height: height! * 0.03,
                                  height: MediaQuery.of(context).size.height/26,
                                  width: MediaQuery.of(context).size.width/2.34,
                                  decoration: BoxDecoration(
                                      color: Colors.lightGreen[100],
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(1, 3, 1, 3),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [


                                        Container(
                                          child: Image.asset("assets/img_42.png"),
                                          height: 17,
                                          width: 15,
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(top: 2),
                                          child: Text(
                                            "  Earning +৳18",
                                            style: TextStyle(fontSize: 12,
                                                color: Colors.green,
                                                fontWeight: FontWeight.w600),

                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                )


                              ],
                            ),
                          ),
                        );
                      }
                  ),
                ),
              ),
              sized20,
              SizedBox(height: 5,),
              InkWell(

                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OfferPage ()));
                },

                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/img_61.png"), fit: BoxFit.cover),
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 5, //spread radius
                        blurRadius: 5, // blur radius
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  height: 200,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: Image.asset("assets/img_62.png"),
                ),
              ),
              sized20,
              Container(
                width: MediaQuery.of(context).size.width/1.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Beverages",
                      style: TextStyle(color: Color(0xFF515151), fontSize: 22,fontWeight:FontWeight.w700,fontFamily: "CeraProBold"),
                    ),
                    Text(
                      "VIEW ALL",
                      style: TextStyle(color: Color(0xFF515151), fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              sized20,

              Stack(
                children: [
                  Image.asset("assets/postertwo.png"),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Row(
                      children: [
                        Text(
                          "Sip it up",
                          style: TextStyle(color: Colors.white, fontSize:16, fontWeight:FontWeight.w700,fontFamily: "CeraProBold"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Container(
                            height: 15,
                            width: 15,
                            child: Image.asset("assets/v.png"),

                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              sized20,
              Container(
                height: height*0.2,
                width: width,
                //width: width*0.4,
                //height: height * 0.2,
                //width: width*0.35,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: grocery.length,
                  itemBuilder: (_,index){
                    return Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Container(
                        //height: height * 0.2,
                          height: height * 0.2,
                          width: width*0.35,
                          margin: EdgeInsets.symmetric(vertical: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),

                          ),
                          child: Column(
                            children: [
                              Container(
                                height: height*0.15,
                                width: width*0.30,
                                decoration: BoxDecoration(
                                    color: Color(0xFFF0E6F2),
                                    borderRadius: BorderRadius.circular(15.0)
                                ),
                                child: Center(
                                  child:Image.network(imagePath+grocery[index].logo,
                                  ),
                                ),
                              ),
                              sized5,
                              Text(
                                grocery[index].name,
                                style: TextStyle(color: Color(0xFF515151), fontSize: block * 4, fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                      ),
                    );
                  },
                ),
              ),
              sized5,
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Grocery- Top Deals",
                    style: TextStyle(color: Color(0xFF515151), fontSize: 22, fontWeight:FontWeight.w700,fontFamily: "CeraProBold"),
                  ),
                ),
              ),
              sized20,

              Padding(
                padding: const EdgeInsets.fromLTRB(15,0,8,0),
                child: Container(
                  height: height*0.31,
                  width: width,
                  child: ListView.builder(
                      shrinkWrap:true,
                      scrollDirection: Axis.horizontal,
                      itemCount: groceryTopDeals.length,
                      itemBuilder: (_,index){
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFF1EDF2),
                                borderRadius: BorderRadius.circular(15.0)
                            ),
                            //height: MediaQuery.of(context).size.height/3.2,
                            width: MediaQuery.of(context).size.width/2.34,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width/5,
                                    height: MediaQuery.of(context).size.height/45,
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(4.0),
                                          bottomRight: Radius.circular(4.0)
                                      ),

                                    ),
                                    //

                                    child: Center(
                                      child: Text(
                                        "15% OFF",
                                        style: TextStyle(color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),


                                Container(
                                  child: Image.network(imagePath+groceryTopDeals[index].thumbnailImage),
                                  height: MediaQuery.of(context).size.height/8,
                                  width: MediaQuery.of(context).size.width/2.34,
                                ),


                                FittedBox(
                                  child: Container(
                                    ///height: height! * 0.08,
                                    width: MediaQuery.of(context).size.width/2.36,
                                    height: MediaQuery.of(context).size.height/20,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(5,5,5,0),
                                      child: Text(
                                        groceryTopDeals[index].name,
                                        style: TextStyle(color: Color(0xFF515151), fontSize: 12.5, fontWeight: FontWeight.w600,fontFamily: "CeraProBold",),maxLines: 2,
                                        textAlign: TextAlign.center,

                                      ),
                                    ),
                                  ),
                                ),



                                Center(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/38,
                                    child: Text(
                                      "5 lit",
                                      style: TextStyle(color: Colors.grey.withOpacity(0.9)),
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Center(
                                    child: Container(
                                      height: MediaQuery.of(context).size.height/32,
                                      width: MediaQuery.of(context).size.width/2.34,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [

                                          Container(
                                            child: Image.asset("assets/p.png"),
                                            height: 20,
                                            width: 22,
                                          ),
                                          Text(groceryTopDeals[index].basePrice.toString(),style: TextStyle(
                                              color: Color(0xFF515151),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700)
                                          ),
                                          Text(groceryTopDeals[index].baseDiscountedPrice.toString(),
                                              style: TextStyle(
                                                  color: Color(0xFFA299A8),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  decoration: TextDecoration.lineThrough)
                                          ),
                                          Container(
                                            height: 25,
                                            width: 25,
                                            decoration: BoxDecoration(

                                                color: kPrimaryColor,shape: BoxShape.circle),
                                            child: Center(
                                              child: Icon(
                                                Icons.shopping_cart_rounded,
                                                color: Colors.white,

                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                  ),
                                ),


                                Container(
                                  //height: height! * 0.03,
                                  height: MediaQuery.of(context).size.height/26,
                                  width: MediaQuery.of(context).size.width/2.34,
                                  decoration: BoxDecoration(
                                      color: Colors.lightGreen[100],
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(1, 3, 1, 3),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [


                                        Container(
                                          child: Image.asset("assets/img_42.png"),
                                          height: 17,
                                          width: 15,
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(top: 2),
                                          child: Text(
                                            "  Earning +৳18",
                                            style: TextStyle(fontSize: 12,
                                                color: Colors.green,
                                                fontWeight: FontWeight.w600),

                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                )


                              ],
                            ),
                          ),
                        );
                      }
                  ),
                ),
              ),

              //sized20,
              SizedBox(height: 25,),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/img_65.png"), fit: BoxFit.cover),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      spreadRadius: 5, //spread radius
                      blurRadius: 5, // blur radius
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                height: 420,
                width: MediaQuery.of(context).size.width / 1.1,
                child: Image.asset("assets/img_66.png"),
              ),

              SizedBox(
                height: 7,
              ),

              ///
              sized20,
              Container(
                width: MediaQuery.of(context).size.width/1.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Baby and kids",
                      style: TextStyle(color: Color(0xFF515151), fontSize: 22, fontWeight:FontWeight.w700,fontFamily: "CeraProBold"),
                    ),
                    Text(
                      "VIEW ALL",
                      style: TextStyle(color: Color(0xFF515151), fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              sized20,

              Stack(
                children: [
                  Image.asset("assets/postertwo.png"),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Row(
                      children: [
                        Text(
                          "Sip it up",
                          style: TextStyle(color: Colors.white, fontSize:16, fontWeight:FontWeight.w700,fontFamily: "CeraProBold"),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Container(
                            height: 15,
                            width: 15,
                            child: Image.asset("assets/v.png"),
                          ),
                        ),

                        /*Icon(
                          Icons.arrow_right,
                          color: Colors.white,
                          size: block * 6,
                        )*/
                      ],
                    ),
                  )
                ],
              ),
              sized20,
              Container(
                height: height*0.2,
                width: width,
                //width: width*0.4,
                //height: height * 0.2,
                //width: width*0.35,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: grocery.length,
                  itemBuilder: (_,index){
                    return Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Container(
                        //height: height * 0.2,
                          height: height * 0.2,
                          width: width*0.35,
                          margin: EdgeInsets.symmetric(vertical: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),

                          ),
                          child: Column(
                            children: [
                              Container(
                                height: height*0.15,
                                width: width*0.30,
                                decoration: BoxDecoration(
                                    color: Color(0xFFF0E6F2),
                                    borderRadius: BorderRadius.circular(15.0)
                                ),
                                child: Center(
                                  child:Image.network(imagePath+grocery[index].logo,
                                  ),
                                ),
                              ),
                              sized5,
                              Text(
                                grocery[index].name,
                                style: TextStyle(color: Color(0xFF515151), fontSize: block * 4, fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                      ),
                    );
                  },
                ),
              ),
              sized5,
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Grocery- Top Deals",
                    style: TextStyle(color: Color(0xFF515151), fontSize: 22, fontWeight:FontWeight.w700,fontFamily: "CeraProBold"),
                  ),
                ),
              ),
              sized20,
              //SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      ProductItemsWidget(
                        height: height,
                        width: width,
                        block: block,
                        image: "assets/img_89.png",
                        productName: "ACI Healthy 100%\npure soyabean oil",
                        productWeight: "5 lit",
                        productActualPrice: "৳125",
                        productOfferPrice: "৳100",
                      ),
                      Padding(padding: const EdgeInsets.only(left: 8.0),),
                      ProductItemsWidget(
                        height: height,
                        width: width,
                        block: block,
                        image: "assets/lays.png",
                        productName: "Lays Premium taste\nChips orange",
                        productWeight: "60g",
                        productActualPrice: "৳400",
                        productOfferPrice: "৳300",
                      ),
                      Padding(padding: const EdgeInsets.only(left: 8.0),),
                      ProductItemsWidget(
                        height: height,
                        width: width,

                        block: block,
                        image: "assets/cadebry.png",
                        productName: "Cadbery Chocolate \nMilk Candy",
                        productWeight: "20g",
                        productActualPrice: "৳120",
                        productOfferPrice: "৳110",
                      ),
                    ]
                    )
                )
              ),
              //sized20,

              SizedBox(height: 20,),

              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/img_69.png"), fit: BoxFit.cover),//69
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      spreadRadius: 5, //spread radius
                      blurRadius: 5, // blur radius
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                height: 190,
                width: MediaQuery.of(context).size.width / 1.1,
                child: Image.asset("assets/img_70.png"),
              ),

              sized20,
              Container(
                width: MediaQuery.of(context).size.width/1.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Fruits & Vegetables",
                      style: TextStyle(color: kBlackColor, fontSize:22, fontWeight:FontWeight.w700,fontFamily: "CeraProBold"),
                    ),
                    Text(
                      "VIEW ALL",
                      style: TextStyle(color: Color(0xFF515151), fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              sized20,

              Stack(
                children: [
                  Image.asset("assets/postertwo.png"),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Row(
                      children: [
                        Text(
                          "Sip it up",
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight:FontWeight.w700,fontFamily: "CeraProBold"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Container(
                            height: 15,
                            width: 15,
                            child: Image.asset("assets/v.png"),

                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              sized20,
              Container(
                height: height*0.2,
                width: width,
                //width: width*0.4,
                //height: height * 0.2,
                //width: width*0.35,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: grocery.length,
                  itemBuilder: (_,index){
                    return Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Container(
                        //height: height * 0.2,
                          height: height * 0.2,
                          width: width*0.35,
                          margin: EdgeInsets.symmetric(vertical: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),

                          ),
                          child: Column(
                            children: [
                              Container(
                                height: height*0.15,
                                width: width*0.30,
                                decoration: BoxDecoration(
                                    color: Color(0xFFF0E6F2),
                                    borderRadius: BorderRadius.circular(15.0)
                                ),
                                child: Center(
                                  child:Image.network(imagePath+grocery[index].logo,
                                  ),
                                ),
                              ),
                              sized5,
                              Text(
                                grocery[index].name,
                                style: TextStyle(color: Color(0xFF515151), fontSize: block * 4, fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                      ),
                    );
                  },
                ),
              ),
              sized5,
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Grocery- Top Deals",
                    style: TextStyle(color: Color(0xFF515151), fontSize: 22, fontWeight:FontWeight.w700,fontFamily: "CeraProBold"),
                  ),
                ),
              ),
              //sized20,
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.fromLTRB(15,0,8,0),
                child: Container(
                  height: height*0.31,
                  width: width,
                  child: ListView.builder(
                      shrinkWrap:true,
                      scrollDirection: Axis.horizontal,
                      itemCount: topDeals.length,
                      itemBuilder: (_,index){
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFF1EDF2),
                                borderRadius: BorderRadius.circular(15.0)
                            ),
                            //height: MediaQuery.of(context).size.height/3.2,
                            width: MediaQuery.of(context).size.width/2.34,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width/5,
                                    height: MediaQuery.of(context).size.height/45,
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(4.0),
                                          bottomRight: Radius.circular(4.0)
                                      ),

                                    ),
                                    //

                                    child: Center(
                                      child: Text(
                                        "15% OFF",
                                        style: TextStyle(color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),


                                Container(
                                  child: Image.network(imagePath+topDeals[index].thumbnailImage),
                                  height: MediaQuery.of(context).size.height/8,
                                  width: MediaQuery.of(context).size.width/2.34,
                                ),


                                FittedBox(
                                  child: Container(
                                    ///height: height! * 0.08,
                                    width: MediaQuery.of(context).size.width/2.36,
                                    height: MediaQuery.of(context).size.height/20,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(3,5,3,0),
                                      child: Text(
                                        topDeals[index].name,
                                        style: TextStyle(color: Color(0xFF515151), fontSize: 12.5, fontWeight: FontWeight.w600,fontFamily: "CeraProBold",),maxLines: 2,
                                        textAlign: TextAlign.center,

                                      ),
                                    ),
                                  ),
                                ),


                                Center(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/38,
                                    child: Text(
                                      "5 lit",
                                      style: TextStyle(color: Colors.grey.withOpacity(0.9)),
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Center(
                                    child: Container(
                                      height: MediaQuery.of(context).size.height/32,
                                      width: MediaQuery.of(context).size.width/2.34,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [

                                          Container(
                                            child: Image.asset("assets/p.png"),
                                            height: 20,
                                            width: 22,
                                          ),
                                          Text(topDeals[index].basePrice.toString(),style: TextStyle(
                                              color: Color(0xFF515151),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700)
                                          ),
                                          Text(topDeals[index].baseDiscountedPrice.toString(),
                                              style: TextStyle(
                                                  color: Color(0xFFA299A8),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  decoration: TextDecoration.lineThrough)
                                          ),
                                          Container(
                                            height: 25,
                                            width: 25,
                                            decoration: BoxDecoration(

                                                color: kPrimaryColor,shape: BoxShape.circle),
                                            child: Center(
                                              child: Icon(
                                                Icons.shopping_cart_rounded,
                                                color: Colors.white,

                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                  ),
                                ),


                                Container(
                                  //height: height! * 0.03,
                                  height: MediaQuery.of(context).size.height/26,
                                  width: MediaQuery.of(context).size.width/2.34,
                                  decoration: BoxDecoration(
                                      color: Colors.lightGreen[100],
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(1, 3, 1, 3),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [


                                        Container(
                                          child: Image.asset("assets/img_42.png"),
                                          height: 17,
                                          width: 15,
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(top: 2),
                                          child: Text(
                                            "  Earning +৳18",
                                            style: TextStyle(fontSize: 12,
                                                color: Colors.green,
                                                fontWeight: FontWeight.w600),

                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                )


                              ],
                            ),
                          ),
                        );
                      }
                  ),
                ),
              ),
              sized20,



              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/img_72.png"), fit: BoxFit.cover),
                  color: Colors.white,
                ),
                height: 130,
                width: MediaQuery.of(context).size.width / 1.1,
                child: Image.asset("assets/img_73.png"),
              ),

              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Didn't find\nwhat you\nwere looking for?",
                    style: TextStyle(color:Color(0xFFB99DCB), fontSize: 28, fontWeight: FontWeight.bold,fontFamily: "CeraProBold"),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                    hintText: 'Search Here',
                    prefixIcon: Icon(Icons.search)),
              ),

              SizedBox(
                height: 20,
              ),

              Container(
                height: height * 0.11,
                //width: width,
                width: MediaQuery.of(context).size.width/1.1,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.call,
                      color: kBlackColor,
                      size: block * 10,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Call for query:",
                          style: TextStyle(color: kBlackColor, fontSize: block * 7),
                        ),
                        Text(
                          "01812-3456789",
                          style: TextStyle(color: kBlackColor, fontSize: block * 7, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 40,
              ),
            ]),
          ))),
    );
  }
}

