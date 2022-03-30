import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sample/src/app/pages/econtract/search_contract.dart';
import 'package:sample/src/app/utils/custom.dart';
import 'package:sample/src/domain/entities/monitoring.dart';

SliverToBoxAdapter areaLoading() {
  return SliverToBoxAdapter(
    child: Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Center(
          child: CircularProgressIndicator(),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            'Processing ...',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    ),
  );
}

SliverPadding areaHeaderMonitoring() {
  return SliverPadding(
    padding: EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 5,
    ),
    sliver: SliverToBoxAdapter(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Kontrak segera berakhir',
              style: TextStyle(
                fontSize: 23,
                fontFamily: 'Segoe ui',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ]),
    ),
  );
}

SliverPadding areaMonitoring(List<Monitoring> item, BuildContext context,
    String ttdPertama, String username, String divisi) {
  return SliverPadding(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
    sliver: SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return itemMonitoring(
              item, index, context, ttdPertama, username, divisi);
        },
        childCount: item.length,
      ),
    ),
  );
}

SliverPadding areaMonitoringNotFound(BuildContext context) {
  return SliverPadding(
    padding: EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 0,
    ),
    sliver: SliverToBoxAdapter(
      child: Column(
        children: [
          Center(
            child: Image.asset(
              'assets/images/not_found.png',
              width: 300,
              height: 300,
            ),
          ),
          Text(
            'Data tidak ditemukan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.red[600],
              fontFamily: 'Montserrat',
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: ArgonButton(
              height: 40,
              width: 130,
              borderRadius: 30.0,
              color: Colors.blue[600],
              child: Text(
                "Search Contract",
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
                  startLoading();
                  waitingLoad();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SearchContract(),
                    ),
                  );
                  stopLoading();
                }
              },
            ),
          ),
        ],
      ),
    ),
  );
}

SliverPadding areaButtonMonitoring(BuildContext context, bool isShow) {
  return SliverPadding(
    padding: EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 10,
    ),
    sliver: SliverToBoxAdapter(
      child: isShow
          ? Center(
              child: ArgonButton(
                height: 40,
                width: 130,
                borderRadius: 30.0,
                color: Colors.blue[600],
                child: Text(
                  "Selengkapnya",
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
                    startLoading();
                    waitingLoad();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SearchContract(),
                      ),
                    );
                    stopLoading();
                  }
                },
              ),
            )
          : SizedBox(
              height: 5,
            ),
    ),
  );
}

Widget itemMonitoring(List<Monitoring> item, int index, BuildContext context,
    String ttdPertama, String username, String divisi) {
  return InkWell(
    child: Container(
      margin: EdgeInsets.symmetric(
        vertical: 7,
      ),
      padding: EdgeInsets.all(
        15,
      ),
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.black26,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item[index].namaUsaha,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Segoe Ui',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    capitalize(item[index].status.toLowerCase()),
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Segoe Ui',
                      fontWeight: FontWeight.w600,
                      color: Colors.orange[800],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Sisa Kontrak',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    getEndDays(input: item[index].endDateContract),
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Segoe Ui',
                      fontWeight: FontWeight.w600,
                      color: Colors.red[700],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
    onTap: () {
      getCustomerContractNew(
        context: context,
        divisi: divisi,
        username: username,
        ttdPertama: ttdPertama,
        idCust: item[index].idCustomer,
        isSales: true,
        isContract: false,
      );
    },
  );
}
