//import 'package:customer_ui/MyOrders/myOrders.dart';
import 'package:customer_ui/components/styles.dart';
import 'package:flutter/material.dart';

import 'tarck_order.dart';

//import 'Language.dart';


class Payment_Screen extends StatefulWidget {
  const Payment_Screen({Key? key}) : super(key: key);

  @override
  _Payment_ScreenState createState() => _Payment_ScreenState();
}

class _Payment_ScreenState extends State<Payment_Screen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.purpleAccent[700],
        centerTitle: true,
        title: Text(
          "Payment Screen",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        iconTheme: IconThemeData(color: kBlackColor),
        actions: const [
          Center(
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      //backgroundColor: Colors.white,
      backgroundColor: Colors.purpleAccent[700],
      body: SingleChildScrollView(
        child: FittedBox(
          child: Column(
            children: [

              SizedBox(height: 25,),



                    //SizedBox(height: 25,),

                    Center(
                      child: Container(
                        //color: Colors.white,
                        height: 100,
                        width: 100,
                        child: Image.asset("assets/img_129.png",color: Colors.white,),
                      ),
                    ),


                    Container(
                      child: Center(
                        child: Text(
                          "Your order has been confirmed",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900,),textAlign:TextAlign.center,
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),

                    Container(
                      child: const Center(
                        child: Text(
                          "Order No #123456",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500,),textAlign:TextAlign.center,
                        ),
                      ),
                    ),

                    SizedBox(height: 20,),

                    Align(
                      alignment: Alignment.center,
                      child: InkWell(

                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TrackOrder()));
                        },

                        child: Container(
                          decoration: BoxDecoration(
                            //color: Colors.indigo[100],
                            borderRadius: BorderRadius.circular(30),

                            boxShadow: [

                              BoxShadow(
                                color: Colors.white,
                              ),

                            ],

                          ),
                          //color: Colors.green,
                          height: 45,
                          width: MediaQuery.of(context).size.width/2.5,
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Center(
                              child: Text("Track Order",style: TextStyle(
                                  color: Colors.purpleAccent[700],fontSize: 16,fontWeight: FontWeight.w900
                              ),),
                            ),
                          ),
                        ),
                      ),
                    ),


              SizedBox(height: 20,),

              FittedBox(
                child: Container(
                  width: MediaQuery.of(context).size.width/1,
                  height: MediaQuery.of(context).size.height/1.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 5, //spread radius
                        blurRadius: 5, // blur radius
                        offset: Offset(
                            0, 3),
                      ),
                    ],
                  ),

                  child: Column(
                    children: [

                      SizedBox(height: 15,),

                      Align(
                        alignment:Alignment.center,
                        child: Container(
                          width:MediaQuery.of(context).size.width/1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [


                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Container(
                                  width:MediaQuery.of(context).size.width/5,
                                  //color: Colors.white,
                                  height: 40,
                                  child: Image.asset("assets/img_130.png",),
                                ),
                              ),

                              Padding(padding: const EdgeInsets.fromLTRB(10,0,0,0),),
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      width:MediaQuery.of(context).size.width*3/5,
                                      child: Align(
                                        alignment:Alignment.centerLeft,
                                        child: Text(
                                          "৳707",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w900,),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width:MediaQuery.of(context).size.width*3/5,
                                      child: Align(
                                        alignment:Alignment.centerLeft,
                                        child: Text(
                                          "Total Payable",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w400,),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),

                      Align(
                        alignment:Alignment.center,
                        child: Container(
                          width:MediaQuery.of(context).size.width/1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [


                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Container(
                                  width:MediaQuery.of(context).size.width/5,
                                  //color: Colors.white,
                                  height: 40,
                                  child: Image.asset("assets/img_171.png",),
                                ),
                              ),

                              Padding(padding: const EdgeInsets.fromLTRB(10,0,0,0),),
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      width:MediaQuery.of(context).size.width*3/5,
                                      child: Align(
                                        alignment:Alignment.centerLeft,
                                        child: Text(
                                          "Cash on delivery",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w900,),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width:MediaQuery.of(context).size.width*3/5,
                                      child: Align(
                                        alignment:Alignment.centerLeft,
                                        child: Text(
                                          "Total Payable",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w400,),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),



                      SizedBox(height: 10,),

                      Align(
                        alignment:Alignment.center,
                        child: Container(
                          width:MediaQuery.of(context).size.width/1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [


                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Container(
                                  width:MediaQuery.of(context).size.width/5,
                                  //color: Colors.white,
                                  height: 40,
                                  child: Image.asset("assets/img_173.png",),
                                ),
                              ),

                              Padding(padding: const EdgeInsets.fromLTRB(10,0,0,0),),
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      width:MediaQuery.of(context).size.width*3/5,
                                      child: Align(
                                        alignment:Alignment.centerLeft,
                                        child: Text(
                                          "45 purana palton, 3rd floor,\nDhaka-1000",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w900,),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width:MediaQuery.of(context).size.width*3/5,
                                      child: Align(
                                        alignment:Alignment.centerLeft,
                                        child: Text(
                                          "Total Payable",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w400,),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),

                      Align(
                        alignment:Alignment.center,
                        child: Container(
                          width:MediaQuery.of(context).size.width/1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [


                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Container(
                                  width:MediaQuery.of(context).size.width/5,
                                  //color: Colors.white,
                                  height: 40,
                                  child: Image.asset("assets/img_133.png",),
                                ),
                              ),

                              Padding(padding: const EdgeInsets.fromLTRB(10,0,0,0),),
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      width:MediaQuery.of(context).size.width*3/5,
                                      child: Align(
                                        alignment:Alignment.centerLeft,
                                        child: Text(
                                          "24 september,\n2021,8:P.M",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w900,),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width:MediaQuery.of(context).size.width*3/5,
                                      child: Align(
                                        alignment:Alignment.centerLeft,
                                        child: Text(
                                          "Delivery date & Time",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w400,),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),


                      SizedBox(height: 40,),

                      Center(
                        child: Container(
                          height: 30,
                          //width: 230,
                          child: Text("Thank You for shopping with us ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.purpleAccent[700]),),
                        ),
                      ),


                    ],
                  ),
                ),
              )




            ],
          ),
        ),
      ),

    );
  }

}




