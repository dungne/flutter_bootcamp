import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = currenciesList.first;

  int BTCRate = 0;
  int ETHRate = 0;
  int LTCRate = 0;

  @override
  void initState() {
    super.initState();
    updateRate();
  }

  void updateRate() async {
    CoinData coinData = CoinData();
    for (String coin in cryptoList) {
      var data = await coinData.getCoinData(coin, selectedCurrency);
      setState(() {
        double tempRate = data['rate'];
        switch (coin) {
          case 'BTC':
            BTCRate = tempRate.toInt();
            break;

          case 'ETH':
            ETHRate = tempRate.toInt();
            break;

          case 'LTC':
            LTCRate = tempRate.toInt();
            break;
        }
      });
    }

  }

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> list = [];
    for (String currency in currenciesList) {
      list.add(DropdownMenuItem<String>(
        child: Text(currency),
        value: currency,));
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: list,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          BTCRate = 0;
          ETHRate = 0;
          LTCRate = 0;
          updateRate();
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> list = [];
    for (String currency in currenciesList) {
      list.add(Text(currency));
    }

    return  CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (index) {
        selectedCurrency = currenciesList[index];
        BTCRate = 0;
        ETHRate = 0;
        LTCRate = 0;
        updateRate();
      },
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $BTCRate $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = $ETHRate $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 LTC = $LTCRate $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),)
          ],
      ),
    );
  }
}


