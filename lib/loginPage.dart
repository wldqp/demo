
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _username = '';
  var _password = '';
  var _isShowPwd = false;//是否显示密码
  var _isShowClear = false;//是否显示输入框尾部的清除图标
  var _isShowEye = false;//是否显示密码框尾部的眼睛图标
  TextEditingController _uscontroller = TextEditingController();
  TextEditingController _pwdcontroller = TextEditingController();

  GlobalKey _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    _uscontroller.addListener(() {
      if(_uscontroller.text.isNotEmpty){
        _isShowClear = true;
      } else {
        _isShowClear = false;
      }
      //必须加这句，才有效果
      setState(() {

      });
    });
    _pwdcontroller.addListener(() {
      if(_pwdcontroller.text.isNotEmpty){
        _isShowEye = true;
      }else{
        _isShowEye = false;
      }
      setState(() {

      });
    });
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _uscontroller.dispose();
    _pwdcontroller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(minWidth: 0, maxWidth: 750, minHeight: 0, maxHeight: 500),
        /*width: 300,8
        height: 200,*/
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
        ),
        child: loginPage(),
      ),
    );
  }

  Form loginPage(){
    return Form(
      key: _formKey,
      child: Column(
        children: [
          //设置圆形图片
          ClipOval(
          ),
          _usernameTextField(),
          const SizedBox(height: 12.0),
          _passwordTextField(),
          const SizedBox(height: 12.0),
          _submit(),
        ],
      ),
    );
  }
  TextFormField _usernameTextField(){

    return TextFormField(
      controller: _uscontroller,
      //设置输入键盘类型
      keyboardType: TextInputType.number,
      decoration: InputDecoration(

        icon: Icon(Icons.account_box),
        suffixIcon: (_isShowClear)
            ? IconButton(
          icon: Icon(Icons.clear),
          onPressed: (){
            _uscontroller.clear();
          },) : null,

        hintText: "账号/手机/邮箱",
        // labelText: "account",
      ),
      validator: _validatorUsername,
      onSaved: (username){
        _username = username!;
      },
    );
  }

  String? _validatorUsername(String? value){
    if(value!.trim().length > 0){
      var accountReg = RegExp("[1-9][0-9]{8,10}");
      if(!accountReg.hasMatch(value)){
        return "请输入正确的手机号";
      };
    }else{
      return "请输入手机号/邮箱";
    }
    return null;
  }
  TextFormField _passwordTextField(){

    return TextFormField(
      controller: _pwdcontroller,
      keyboardType: TextInputType.visiblePassword,
      //隐藏输入字符
      obscureText: !_isShowPwd,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        hintText: "密码",
        suffixIcon: (_isShowEye) ? IconButton(
          icon: Icon((_isShowPwd) ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _isShowPwd = !_isShowPwd;
            });
          },
        ) : null,
      ),
      validator: _validatorPassword,
      onSaved: (password){
        _password = password!;
      },
    );
  }

  String? _validatorPassword(String? password){
    if(password!.trim().length > 0){
      var accountReg = RegExp("[/w]{6,}");
      if(!accountReg.hasMatch(password)){
        return "请输入正确格式的密码";
      }
    }else{
      return "请输入密码";
    }
    return null;
  }

  Container _submit(){
    return Container(
      width: 200,
      decoration: BoxDecoration(),
      child: ElevatedButton(
        child: Text("登录",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        // style: ButtonStyle(backgroundColor: Color(Colors.amber)),
        onPressed: (){
          if((_formKey.currentState as FormState).validate()){
            print("验证通过");
            (_formKey.currentState as FormState).reset();
          };
          Navigator.pop(context);
        },
      ),
    );
  }
}
