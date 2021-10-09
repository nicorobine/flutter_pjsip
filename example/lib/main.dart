import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pjsip/flutter_pjsip.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _calltateText = '';
  FlutterPjsip _pjsip;

  @override
  void initState() {
    super.initState();
    initSipPlugin();
    _permissionHandler();
  }

  /// 权限管理
  _permissionHandler() async {
    Map<Permission, PermissionStatus> statuses = await [Permission.microphone].request();

    List<Permission> deniedPermissions = [];
    List<Permission> permanentlyDeniedPermissions = [];

    for (Permission permission in statuses.keys) {
      var status = statuses[permission];
      switch (status) {
        case PermissionStatus.denied: // 拒绝
          deniedPermissions.add(permission);
          break;
        case PermissionStatus.permanentlyDenied: // Android不再提醒
          permanentlyDeniedPermissions.add(permission);
          break;
        case PermissionStatus.undetermined: // 未申请
        case PermissionStatus.restricted:
        case PermissionStatus.granted:
          break;
      }
    }
  }

  void initSipPlugin() {
    _pjsip = FlutterPjsip.instance;
    _pjsip.onSipStateChanged.listen((map) {
      final state = map['call_state'];
      final remoteUri = map['remote_uri'];
      print('收到状态: $state');
      switch (state) {
        case "CALLING":
          break;

        case "INCOMING":
          break;

        case "EARLY":
          break;

        case "CONNECTING":
          break;

        case "CONFIRMED":
          break;

        case "DISCONNECTED":
          break;

        default:
          break;
      }

      setState(() {
        this._calltateText = state;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Sip初始化'),
              onPressed: () => _sipInit(),
            ),
            RaisedButton(
              child: Text('Sip登录'),
              onPressed: () => _sipLogin(),
            ),
            RaisedButton(
              child: Text('Sip打电话'),
              onPressed: () => _sipCall(),
            ),
            RaisedButton(
              child: Text('Sip登出'),
              onPressed: () => _sipLogout(),
            ),
            RaisedButton(
              child: Text('Sip销毁'),
              onPressed: () => _sipDeinit(),
            ),
            RaisedButton(
              child: Text('Sip接听'),
              onPressed: () => _sipReceive(),
            ),
            RaisedButton(
              child: Text('Sip拒接/挂断'),
              onPressed: () => _sipRefuse(),
            ),
            RaisedButton(
              child: Text('Sip免提'),
              onPressed: () => _sipHandsFree(),
            ),
            RaisedButton(
              child: Text('Sip静音'),
              onPressed: () => _sipMute(),
            ),
            RaisedButton(
              child: Text('Sip通道销毁'),
              onPressed: () => _sipDispose(),
            ),
            Text('电话状态监听：$_calltateText'),
          ],
        ),
      ),
    );
  }

  Future<void> _sipInit() async {
    bool initSuccess = await _pjsip.pjsipInit();
    showToast('初始化', initSuccess);
  }

  Future<void> _sipLogin() async {
    bool loginSuccess =
    await _pjsip.pjsipLogin(username: '1025', password: '1', ip: '39.107.68.193', port: '9017');
    showToast('登录', loginSuccess);
  }

  Future<void> _sipCall() async {
    bool callSuccess = await _pjsip.pjsipCall(username: '1026', ip: '39.107.68.193', port: '9017');
    showToast('打电话', callSuccess);
  }

  Future<void> _sipLogout() async {
    bool logoutSuccess = await _pjsip.pjsipLogout();
    showToast('登出', logoutSuccess);
  }

  Future<void> _sipDeinit() async {
    bool initSuccess = await _pjsip.pjsipDeinit();
    showToast('销毁', initSuccess);
  }

  Future<void> _sipReceive() async {
    bool receiveSuccess = await _pjsip.pjsipReceive();
    showToast('接听', receiveSuccess);
  }

  Future<void> _sipRefuse() async {
    bool refuseSuccess = await _pjsip.pjsipRefuse();
    showToast('拒接/挂断', refuseSuccess);
  }

  Future<void> _sipHandsFree() async {
    bool handsFreeSuccess = await _pjsip.pjsipHandsFree();
    showToast('免提状态更改', handsFreeSuccess);
  }

  Future<void> _sipMute() async {
    bool muteSuccess = await _pjsip.pjsipMute();
    showToast('静音状态更改', muteSuccess);
  }

  Future<void> _sipDispose() async {
    await _pjsip.dispose();
    showToast('通道销毁', true);
  }

  void showToast(String method, bool success) {
    String successText = success ? '成功' : '失败';
    Fluttertoast.showToast(msg: '$method $successText');
  }
}
