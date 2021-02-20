import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Payment Card'),
        backgroundColor: Color(0xFF20BF06),
      ),
      backgroundColor: Colors.white,
      body: new ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.only(top: 5.0),
                ),
                new TextField(
                  decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.black),
                    labelText: 'Card name',
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    enabledBorder: new OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderSide:
                      new BorderSide(color: Colors.black, width: 2.0),
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 15.0),
                ),
                new TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(23),
                    MaskedTextInputFormatter(
                      mask: 'xxxx xxxx xxxx xxxx xxx',
                      separator: ' ',
                    ),
                  ],
                  decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.payment, color: Colors.black),
                    labelText: 'Number',
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    enabledBorder: new OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderSide:
                      new BorderSide(color: Colors.black, width: 2.0),
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 15.0),
                ),
                new TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                  ],
                  decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.payment_rounded, color: Colors.black),
                    labelText: 'CVV',
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    enabledBorder: new OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderSide:
                      new BorderSide(color: Colors.black, width: 2.0),
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 15.0),
                ),
                new TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(5),
                    MaskedTextInputFormatter(
                      mask: 'xx/xx',
                      separator: '/',
                    ),
                  ],
                  decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.date_range, color: Colors.black),
                    labelText: 'Expiry Date',
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    enabledBorder: new OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderSide:
                      new BorderSide(color: Colors.black, width: 2.0),
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 30.0),
                ),
                Container(
                  width: 150,
                  height: 50,
                  child: new RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: new Text(
                      'Pay',
                      style:
                      TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    color: Color(0xFF20BF06),
                    onPressed: () {
                      Navigator.pushNamed(context, '/MyBlog');
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskedTextInputFormatter({
    @required this.mask,
    @required this.separator,
  }) { assert(mask != null); assert (separator != null); }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if(newValue.text.length > 0) {
      if(newValue.text.length > oldValue.text.length) {
        if(newValue.text.length > mask.length) return oldValue;
        if(newValue.text.length < mask.length && mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text: '${oldValue.text}$separator${newValue.text.substring(newValue.text.length-1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}