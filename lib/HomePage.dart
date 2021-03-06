import 'package:gestion_rdv/DocInfoPage.dart';
import 'package:gestion_rdv/colorScheme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir',
      ),
      home: MyFirstPage(),
      routes: {
        '/DocInfoPage' : (context)=>DocInfoPage(),
      },
    );
  }
}
class MyFirstPage extends StatefulWidget {
  @override
  _MyFirstPageState createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: CustomPaint(
              painter: pathPainter(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 30,
                  ),
                  actions: <Widget>[
                    Container(
                      height: 75,
                        width: 75,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [getStartedColorStart, getStartedColorEnd],
                          stops: [0,1]
                        )
                      ),
                      child: Center(
                        child: Text("C", style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 14, right: 10, top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("choisir un m??decin ou une sp??cialit??", style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        margin: EdgeInsets.only(top: 10),
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            categoryContainer("category7.png", "CT-Scan"),
                            categoryContainer("category1.png", "Orthop??die"),
                            categoryContainer("category2.png", "Nutrition"),
                            categoryContainer("category3.png", "G??n??ralit??"),
                            categoryContainer("category4.png", "Neurologie"),
                            categoryContainer("category5.png", "Cardiologie"),
                            categoryContainer("category6.png", "IRM"),
                            categoryContainer("category8.png","Gyn??cologie"),
                          ],
                        ),
                      ),
                      Text("liste des m??decins", style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),),
                      SizedBox(height: 20,),
                      Container(    
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: <Widget>[
                              createDocWidget("doc1.png", "Wafa Fehri","Diplom??e en ??chographie cardiaque de la Facult?? de M??decine d'Amiens.Doctorat en recherche m??dicale de l'Universit?? Laval"),
                              createDocWidget("doc2.png", "anis Jaoua","Neurologue et neurophysiologiste Ancien praticien des h??pitaux de Paris.Dipl??me de pathologie vasculaire et AVC "),
                              createDocWidget("doc3.png", "fatma zouari","Sp??cialiste en gyn??cologie obst??trique Ancienne Assistante Hospitalo-universitaire ?? la facult?? de m??decine de Sfax."),
                              
                                                          
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  Container categoryContainer(String imgName, String title)
  {
    return Container(
      width: 130,
        child: Column(
          children: <Widget>[
            Image.asset('assets/images/category/$imgName'),
            Text(
              "$title", style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 17
            ),
            )
          ],
        ),
    );
  }
  Container createDocWidget(String imgName, String docName,String description)
  {
    return Container(
      child: InkWell(
        child: Container(

          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            color: docContentBgColor,
          ),
          child: Container(
            padding: EdgeInsets.all(7),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 70,
                  height: 90,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/docprofile/$imgName'),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Dr. $docName", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),),
                    SizedBox(height: 5,),
                    Container(
                      width: 234,
                      height: 50,
                      child: Text('$description', style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                        overflow: TextOverflow.clip,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        onTap: openDocInfo,
      ),
    );
  }
  void openDocInfo()
  {
    Navigator.pushNamed(context, '/DocInfoPage');
  }
}

class pathPainter extends CustomPainter
{
  @override
  void paint(Canvas canvas, Size size) {
    var paint = new Paint();
    paint.color = path2Color;

    Path path = new Path();
    path.moveTo(0, 0);
    path.lineTo(size.width*0.3, 0);
    path.quadraticBezierTo(size.width*0.5, size.height*0.03, size.width*0.42, size.height*0.17);
    path.quadraticBezierTo(size.width*0.35, size.height*0.32, 0, size.height*0.29);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}
