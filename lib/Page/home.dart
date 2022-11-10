import 'package:bloc_p/Bloc/color_change_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/Secound/chnage_text_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorChangeCubit, ColorChangeState>(
      listener: (context, state) {
        if(state is AppColorChange){
          ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.redAccent,
            content: Text("Listing"),
            duration: Duration(milliseconds: 2000),
          ));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: BlocBuilder<ColorChangeCubit, ColorChangeState>(
          builder: (context, state) {
            if (state is! AppColorChange) {
              return Center(child: CircularProgressIndicator(),);
            }
            final data = (state as AppColorChange).color;
            return Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              color: data,
              child: Column(
                children: [
                  BlocConsumer<ChnageTextCubit, ChnageTextState>(
                    listener: (context, state) {
                      if(state is ChnageText){
                        print("object");
                      }
                    },
                    builder: (context, state) {
                      if(state is !ChnageText){
                       return Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          color: Colors.greenAccent,
                          child: const Center(
                            child: Text("State not emit",style: TextStyle(fontSize: 20),),
                          ),
                        );
                      }
                      final data=(state as ChnageText).text;
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        color: Colors.greenAccent,
                        child: Center(
                          child: Text(data!,style: TextStyle(fontSize: 20),),
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<ColorChangeCubit>(context).chnageColor(color: Colors.blueAccent);
            BlocProvider.of<ChnageTextCubit>(context).chnageText("Bloc noman");
          },
          child: Text("C"),
        ),
      ),
    );
  }
}
