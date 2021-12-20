import 'package:customer_ui/components/styles.dart';
import 'package:flutter/material.dart';

//import 'Language.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({Key? key}) : super(key: key);
  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: kWhiteColor,
          centerTitle: true,
          title: Text(
            "My account",
            style: TextStyle(color: kBlackColor, fontSize: 14),
          ),
          iconTheme: IconThemeData(color: kBlackColor),
          actions: const [
            Center(
              child: Icon(
                Icons.menu,
                color: kBlackColor,
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
      //backgroundColor: Colors.white,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
                children: [

                  SizedBox(height: 25,),


                  Center(
                    child: Container(
                      //color: Colors.white,
                      height: 120,
                      width: 120,
                      child: Image.asset("assets/img_142.png",),
                    ),
                  ),

                  SizedBox(height: 10,),

                  Center(
                    child: Container(
                      /*decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.5,
                          color:  Colors.black,
                        ),

                        //color: Color(0xFFE5E5E5),
                        borderRadius: BorderRadius.circular(30),

                      ),*/
                      //color: Colors.white,
                      height: 37,
                      width: 150,
                      child: Center(child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Md. Ajhar Ali",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 16,color: Colors.black),),

                          Container(
                            //color: Colors.white,
                            height: 15,
                            width: 15,
                            child: Image.asset("assets/img_143.png",),
                          ),
                        ],
                      )),
                    ),
                  ),


                  SizedBox(height: 20,),


                  Container(
                    width: MediaQuery.of(context).size.width/1,
                    height: MediaQuery.of(context).size.height/1.6,
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      //borderRadius: BorderRadius.circular(20),

                    ),

                    child: Column(
                      children: [

                        SizedBox(height: 20,),

                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Align(
                            alignment:Alignment.center,
                            child: Container(
                              //width:MediaQuery.of(context).size.width/6,
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [

                                  Container(
                                    //color: Colors.white,
                                    height: 15,
                                    width:MediaQuery.of(context).size.width/7,
                                    child: Image.asset("assets/img_144.png",),
                                  ),

                                  Padding(padding: const EdgeInsets.fromLTRB(0,0,30,0),),

                                  Container(
                                    width:MediaQuery.of(context).size.width/2,
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment:Alignment.centerLeft,
                                          child: Text(
                                            "My Address",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700,),
                                          ),
                                        ),
                                        Align(
                                          alignment:Alignment.centerLeft,
                                          child: Text(
                                            "40 TopKhana Road, Dhaka-1000",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w500,),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  //Padding(padding: const EdgeInsets.fromLTRB(0,0,50,0),),

                                  Container(
                                    //color: Colors.white,
                                    height: 15,
                                    width:MediaQuery.of(context).size.width/7,
                                    child: Image.asset("assets/img_145.png",),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 15,),

                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Align(
                            alignment:Alignment.center,
                            child: Container(

                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [

                                  Container(
                                    //color: Colors.white,
                                    height: 15,
                                    width:MediaQuery.of(context).size.width/7,
                                    child: Image.asset("assets/img_146.png",),
                                  ),

                                  Padding(padding: const EdgeInsets.fromLTRB(0,0,30,0),),

                                  Container(
                                    width:MediaQuery.of(context).size.width/2,
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment:Alignment.centerLeft,
                                          child: Text(
                                            "Contact Number",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700,),
                                          ),
                                        ),
                                        Align(
                                          alignment:Alignment.centerLeft,
                                          child: Text(
                                            "018200-66662",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w500,),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  //Padding(padding: const EdgeInsets.fromLTRB(0,0,50,0),),

                                  Container(
                                    //color: Colors.white,
                                    height: 15,
                                    width:MediaQuery.of(context).size.width/7,
                                    child: Image.asset("assets/img_145.png",),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 15,),

                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Align(
                            alignment:Alignment.center,
                            child: Container(

                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [

                                  Container(
                                    //color: Colors.white,
                                    height: 15,
                                    width:MediaQuery.of(context).size.width/7,
                                    child: Image.asset("assets/img_148.png",),
                                  ),

                                  Padding(padding: const EdgeInsets.fromLTRB(0,0,30,0),),

                                  Container(
                                    width:MediaQuery.of(context).size.width/2,
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment:Alignment.centerLeft,
                                          child: Text(
                                            "Change Password",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700,),
                                          ),
                                        ),
                                        Align(
                                          alignment:Alignment.centerLeft,
                                          child: Text(
                                            "......",style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w500,),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  //Padding(padding: const EdgeInsets.fromLTRB(0,0,50,0),),

                                  Container(
                                    //color: Colors.white,
                                    height: 15,
                                    width:MediaQuery.of(context).size.width/7,
                                    child: Image.asset("assets/img_145.png",),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 15,),



                      ],
                    ),
                  )


                ]
            )
        )
    );
  }

}




