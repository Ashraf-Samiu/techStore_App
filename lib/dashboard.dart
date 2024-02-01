import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  TextEditingController _titleController= TextEditingController();
  TextEditingController _priceController= TextEditingController();
  GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  List x= [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tech Store"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                keyboardType: TextInputType.emailAddress,
                validator: (String? text){
                  if(text!.isEmpty){
                    return "Enter your Product Title";
                  }else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: "Title",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.emailAddress,
                validator: (String? text){
                  if(text!.isEmpty){
                    return "Enter Product Price";
                  }else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: "Price",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(
                width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          setState(() {});
                          return x.add({
                            "Title": _titleController.text,
                            "Price": _priceController.text
                          });
                        }
                      }, child: Text("Add")
                  )),
              Expanded(
                child: ListView.separated(
                    itemCount: x.length,
                    itemBuilder: (context,index){
                      return ListTile(
                          title: Text(x[index]["Title"],
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(x[index]["Price"],
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          leading: Image.asset("images/123.jpg"),
                          trailing: IconButton(
                              onPressed: (){
                                x.remove(x[index]);
                                setState(() {});
                              }, icon: Icon(Icons.delete)),
                          tileColor: Colors.redAccent.shade100
                      );
                    },
                    separatorBuilder: (context,index){
                      return Divider(
                        indent: 15,
                        endIndent: 15,
                        color: Colors.greenAccent.shade100,
                        thickness: 3,
                        height: 2,
                      );
                    },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
