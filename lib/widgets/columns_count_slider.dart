// import 'package:flickr_viewer/bloc/f_viewer_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class ColumnsCountSlider extends StatelessWidget {
//   const ColumnsCountSlider({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     FViewerBloc _bloc = BlocProvider.of<FViewerBloc>(context);
//
//     return Container(child: Slider(
//       value: _bloc.state.columnsCount,
//       min: 1,
//       max: 3,
//       divisions: 3,
//       onChanged: (double value) {
//         _bloc.add(SetColunmsEvent(value));
//       },
//     ),);
//
//     // return BlocBuilder(
//     //   builder: (context, FViewerState()) {
//         // const value = context.select((FViewerBloc) => bloc.state.columnsCount)
//         // return Slider(
//         //   value: _bloc.state.columnsCount,
//         //   min: 1,
//         //   max: 3,
//         //   divisions: 3,
//         //   onChanged: (double value) {
//         //     _bloc.add(SetColunmsEvent(value));
//         //   },
//         // );
//       // },
//     // );
//   }
// }
//
//
// // class ColumnsCountSlider extends StatefulWidget {
// //   const ColumnsCountSlider({super.key});
// //
// //   @override
// //   State<ColumnsCountSlider> createState() => _ColumnsCountSliderState();
// // }
// //
// // class _ColumnsCountSliderState extends State<ColumnsCountSlider> {
// //   double _currentSliderValue = 2;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Slider(
// //       value: _currentSliderValue,
// //       min: 1,
// //       max: 3,
// //       divisions: 3,
// //       onChanged: (double value) {
// //         setState(() {
// //           _currentSliderValue = value;
// //         });
// //       },
// //     );
// //   }
// // }
