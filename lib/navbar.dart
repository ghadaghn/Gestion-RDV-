import 'package:flutter/material.dart';
import 'package:gestion_rdv/colorScheme.dart';
import 'package:gestion_rdv/main.dart';

class navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
            accountName: Text("Ghada Ghozlane"),
            accountEmail: Text("ghozlane.ghada@uit.university"),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [getStartedColorStart, getStartedColorEnd],
                    stops: [0, 1])),
            currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person), backgroundColor: Color(0xff54D579))),
        ListTile(
          leading: Icon(Icons.person),
          title: Text(' Modifier Compte'),
          onTap: () => null,
        ),
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text('Favoris'),
          onTap: () => null,
        ),
        ListTile(
          leading: Icon(Icons.share),
          title: Text('Partager'),
          onTap: () => null,
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text('Notifications'),
          trailing: ClipOval(
            child: Container(
              color: Colors.red,
              width: 20,
              height: 20,
              child: Center(
                child: Text("8",style: TextStyle(
                  color: Colors.white,fontSize: 12
                ),),
              ),
            ),
          ),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Paramètres'),
          onTap: () => null,
        ),
        ListTile(
          leading: Icon(Icons.description),
          title: Text('Politiques'),
          onTap: () => null,
        ),
        Divider(),
        ListTile(
          title: Text('Sortir'),
          leading: Icon(Icons.exit_to_app),
          onTap:  (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp() ));
        },
          
        ),
      ],
    ));
  }
}
