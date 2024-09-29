import 'package:auto_route/auto_route.dart';
import 'package:book_reader/domain/models/book_detail.dart';
import 'package:book_reader/features/library_bar/download/bloc/download_bloc.dart';
import 'package:book_reader/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

@RoutePage()
class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key, required this.book});
  final BookDetail book;
  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("InAppWebView Download"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: InAppWebView(
              initialUrlRequest:
                  URLRequest(url: WebUri(widget.book.downloadLink)),
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                return NavigationActionPolicy.ALLOW;
              },
              onLoadStop: (controller, url) async {},
              onDownloadStartRequest: (controller, downloadStartRequest) async {
                BlocProvider.of<DownloadBloc>(context).add(
                  DownloadEvent.download(
                    book: widget.book,
                    downloadUrl: downloadStartRequest.url,
                    filename: downloadStartRequest.suggestedFilename,
                  ),
                );
                AutoRouter.of(context).navigate(const MyBooksRoute());
              },
              onReceivedHttpError: (controller, request, errorResponse) {},
            ),
          ),
        ],
      ),
    );
  }
}
