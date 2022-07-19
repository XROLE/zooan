import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final T model;
  final Widget child;
  final Function(T) onModelReady;
  final Function(T) onDispose;

  const BaseView({Key key, this.builder, this.model, this.child, this.onModelReady, this.onDispose})
      : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  T model;

  @override
  void initState() {
    super.initState();
    model = widget.model;

    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
  }

  @override
  void dispose() {
    model = widget.model;

    if (widget.onDispose != null) {
      widget.onDispose(model);
    }
    super.dispose();
  }

  @override 
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider<T>.value(value: model, child: Consumer<T>(
      builder: widget.builder,
      child: widget.child,
    ),);
  }
}
