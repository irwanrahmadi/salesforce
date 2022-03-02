import 'dart:convert';

import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sample/src/app/utils/custom.dart';
import 'package:sample/src/domain/entities/contract.dart';
import 'package:sample/src/domain/entities/discount.dart';
import 'package:http/http.dart' as http;

class DetailContract extends StatefulWidget {
  Contract item;
  String div;
  String ttd;
  String username;
  bool isMonitoring;

  DetailContract(
      this.item, this.div, this.ttd, this.username, this.isMonitoring);

  @override
  _DetailContractState createState() => _DetailContractState();
}

class _DetailContractState extends State<DetailContract> {
  Future<List<Discount>> getDiscountData(int idCust) async {
    List<Discount> list;
    var url =
        'http://timurrayalab.com/salesforce/server/api/discount/getByIdCustomer?id_customer=$idCust';
    var response = await http.get(url);

    print('Response status: ${response.statusCode}');

    var data = json.decode(response.body);
    final bool sts = data['status'];

    if (sts) {
      var rest = data['data'];
      print(rest);
      list = rest.map<Discount>((json) => Discount.fromJson(json)).toList();
      print("List Size: ${list.length}");
    }

    return list;
  }

  approveCustomer(bool isAr, String idCust, String ttd, String username) async {
    var url = !isAr
        ? 'http://timurrayalab.com/salesforce/server/api/approval/approveSM'
        : 'http://timurrayalab.com/salesforce/server/api/approval/approveAM';

    var response = await http.post(
      url,
      body: !isAr
          ? {
              'id_customer': idCust,
              'ttd_sales_manager': ttd,
              'nama_sales_manager': username,
            }
          : {
              'id_customer': idCust,
              'ttd_ar_manager': ttd,
              'nama_ar_manager': username,
            },
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var res = json.decode(response.body);
    final bool sts = res['status'];
    final String msg = res['message'];

    handleStatus(context, capitalize(msg), sts);
  }

  rejectCustomer(bool isAr, String idCust, String ttd, String username) async {
    var url = !isAr
        ? 'http://timurrayalab.com/salesforce/server/api/approval/rejectSM'
        : 'http://timurrayalab.com/salesforce/server/api/approval/rejectAM';

    var response = await http.post(
      url,
      body: !isAr
          ? {
              'id_customer': idCust,
              'ttd_sales_manager': ttd,
              'nama_sales_manager': username,
            }
          : {
              'id_customer': idCust,
              'ttd_ar_manager': ttd,
              'nama_ar_manager': username,
            },
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var res = json.decode(response.body);
    final bool sts = res['status'];
    final String msg = res['message'];

    handleStatus(context, capitalize(msg), sts);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 35,
              bottom: 15,
            ),
            child: Center(
              child: Text(
                'Perjanjian Kerjasama Pembelian',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Segoe ui',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            child: Text(
              'Pihak Pertama',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Nama : ',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                widget.item.namaPertama,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Jabatan : ',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                widget.item.jabatanPertama,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Telp : ',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 29,
              ),
              Text(
                '021-4610154',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Fax : ',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 34,
              ),
              Text(
                '021-4610151-52',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Alamat : ',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 7,
              ),
              Expanded(
                child: Text(
                  'Jl. Rawa Kepiting No. 4 Kawasan Industri Pulogadung, Jakarta Timur',
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            child: Text(
              'Pihak Kedua',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Nama : ',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                widget.item.namaKedua,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Jabatan : ',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                'Owner',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Telp : ',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 29,
              ),
              Text(
                widget.item.telpKedua,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Fax : ',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 34,
              ),
              Text(
                widget.item.faxKedua.isNotEmpty ? '-' : widget.item.faxKedua,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Alamat : ',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 7,
              ),
              Expanded(
                child: Text(
                  widget.item.alamatKedua,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            child: Text(
              'Target Pembelian yang disepakati : ',
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 180,
                child: Text(
                  'Target Lensa Nikon : ',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  convertToIdr(int.parse(widget.item.tpNikon), 0),
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 180,
                child: Text(
                  'Target Lensa Leinz : ',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  convertToIdr(int.parse(widget.item.tpLeinz), 0),
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 180,
                child: Text(
                  'Target Lensa Oriental : ',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  convertToIdr(int.parse(widget.item.tpOriental), 0),
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 180,
                child: Text(
                  'Target Lensa Moe : ',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  convertToIdr(int.parse(widget.item.tpMoe), 0),
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            child: Text(
              'Jangka waktu pembayaran : ',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 180,
                child: Text(
                  'Jangka Waktu Nikon : ',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  widget.item.pembNikon,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 180,
                child: Text(
                  'Jangka Waktu Leinz : ',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  widget.item.pembLeinz,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 180,
                child: Text(
                  'Jangka Waktu Oriental : ',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  widget.item.pembOriental,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 180,
                child: Text(
                  'Jangka Waktu Moe : ',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  widget.item.pembMoe,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Terhitung sejak tanggal : ${convertDateIndo(widget.item.startContract)}',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Berakhir pada tanggal : ${convertDateIndo(widget.item.endContract)}',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          areaDiskon(widget.item),
          SizedBox(
            height: 20,
          ),
          widget.isMonitoring
              ? SizedBox(
                  height: 5,
                )
              : handleAction(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget areaDiskon(Contract item) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              child: Text(
                'Kontrak Diskon : ',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 300,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: Text(
                  'Deskripsi produk',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 100,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: Text(
                  'Diskon',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 150,
          child: SizedBox(
            height: 30,
            child: FutureBuilder(
                future: getDiscountData(int.parse(item.idCustomer)),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());
                    default:
                      return snapshot.data != null
                          ? listDiscWidget(snapshot.data, snapshot.data.length)
                          : Column(
                              children: [
                                Center(
                                  child: Image.asset(
                                    'assets/images/not_found.png',
                                    width: 120,
                                    height: 120,
                                  ),
                                ),
                                Text(
                                  'Item Discount tidak ditemukan',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red[600],
                                    fontFamily: 'Montserrat',
                                  ),
                                )
                              ],
                            );
                  }
                }),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget listDiscWidget(List<Discount> item, int len) {
    return Container(
      child: ListView.builder(
          itemCount: len,
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 8,
          ),
          itemBuilder: (context, position) {
            return SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 320,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: Text(
                        item[position].prodDesc != null
                            ? item[position].prodDesc
                            : '-',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Segoe ui',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: Text(
                        item[position].discount != null
                            ? '${item[position].discount} %'
                            : '-',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Segoe ui',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget handleAction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          alignment: Alignment.centerRight,
          child: ArgonButton(
            height: 40,
            width: 100,
            borderRadius: 30.0,
            color: Colors.red[700],
            child: Text(
              "Reject",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
            loader: Container(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
            onTap: (startLoading, stopLoading, btnState) {
              if (btnState == ButtonState.Idle) {
                setState(() {
                  startLoading();
                  waitingLoad();
                  widget.div == "AR"
                      ? rejectCustomer(true, widget.item.idCustomer, widget.ttd,
                          widget.username)
                      : rejectCustomer(false, widget.item.idCustomer,
                          widget.ttd, widget.username);
                });
              }
            },
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          alignment: Alignment.centerRight,
          child: ArgonButton(
            height: 40,
            width: 100,
            borderRadius: 30.0,
            color: Colors.blue[600],
            child: Text(
              "Approve",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
            loader: Container(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
            onTap: (startLoading, stopLoading, btnState) {
              if (btnState == ButtonState.Idle) {
                setState(() {
                  startLoading();
                  waitingLoad();
                  widget.div == "AR"
                      ? approveCustomer(true, widget.item.idCustomer,
                          widget.ttd, widget.username)
                      : approveCustomer(false, widget.item.idCustomer,
                          widget.ttd, widget.username);
                });
              }
            },
          ),
        ),
      ],
    );
  }
}