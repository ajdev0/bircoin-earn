import 'package:bitcoin_earn/component/main_button.dart';
import 'package:bitcoin_earn/layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_earn/constants.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class ReferScreen extends StatefulWidget {
  static String id = "refer";
  @override
  _ReferScreenState createState() => _ReferScreenState();
}

class _ReferScreenState extends State<ReferScreen> {
  String _linkMessage;
  bool _isCreatingLink = false;
  String _testString =
      "To test: long press link and then copy and click from a non-browser "
      "app. Make sure this isn't being tested on iOS simulator and iOS xcode "
      "is properly setup. Look at firebase_dynamic_links/README.md for more "
      "details.";
  @override
  void initState() {
    super.initState();
    initDynamicLinks();
  }

  void initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      final Uri deepLink = dynamicLink?.link;

      if (deepLink != null) {
        Navigator.pushNamed(context, deepLink.path);
      }
    }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });

    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      Navigator.pushNamed(context, deepLink.path);
    }
  }

  Future<void> _createDynamicLink(bool short) async {
    setState(() {
      _isCreatingLink = true;
    });

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://techinfolite.page.link',
      link: Uri.parse('https://techinfolite.com'),
      androidParameters: AndroidParameters(
        packageName: 'com.techinfolite.bitcoin_earn',
        minimumVersion: 0,
      ),
      dynamicLinkParametersOptions: DynamicLinkParametersOptions(
        shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
      ),
      iosParameters: IosParameters(
        bundleId: 'com.techinfolite.bitcoin_earn',
        minimumVersion: '0',
      ),
    );

    Uri url;
    if (short) {
      final ShortDynamicLink shortLink = await parameters.buildShortLink();
      url = shortLink.shortUrl;
    } else {
      url = await parameters.buildUrl();
    }

    setState(() {
      _linkMessage = url.toString();
      _isCreatingLink = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      showBottomNav: true,
      imageName: 'refer',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Share Your Code',
            style: kMainTextStyle.copyWith(fontSize: 30),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Earn 500 mBTC by referring your friends\n and up to 30% of their earnings.',
            style: kSubtitleText,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 25,
          ),
          MainButton(
            label: 'Refer and Earn',
            onPress: () async {
              !_isCreatingLink ? _createDynamicLink(true) : null;
              if (_linkMessage != null) {
                await Share.share(_linkMessage);
              }
            },
          ),
          SizedBox(
            height: 50,
          ),
          InkWell(
            child: Text(
              _linkMessage ?? '',
              style: const TextStyle(color: Colors.blue),
            ),
            onTap: () async {
              if (_linkMessage != null) {
                await launch(_linkMessage);
              }
            },
            onLongPress: () {
              Clipboard.setData(ClipboardData(text: _linkMessage));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Copied Link!')),
              );
            },
          ),
          Text(_linkMessage == null ? '' : _testString),
          Text(
            'Copy Code Below',
            style: kSubtitleText,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            textAlign: TextAlign.center,
            decoration: kInputDecoration.copyWith(
              hintText: _linkMessage ?? '',
              hintStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
