import 'package:bloc_concurrency_practice/bloc/picture_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PictureChanger extends StatelessWidget {
  const PictureChanger({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picture changer'),
      ),
      body: Center(
        child: BlocBuilder<PictureBloc, PictureState>(
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                state.count >= 0 ? state.count.toString() : '',
                style: const TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 300,
                child: state.path == ''
                    ? const SizedBox()
                    : Image.asset('image/${state.path}'),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<PictureBloc>().add(PictureEvent());
                },
                child: const Text('change the picture!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
