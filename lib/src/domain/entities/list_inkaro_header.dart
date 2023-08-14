class ListInkaroHeader {
  String inkaroContractId,
      noAccount,
      startPeriode,
      endPeriode,
      nikKTP,
      npwp,
      namaStaff,
      jabatan,
      anRekening,
      bank,
      namaBank,
      nomorRekening,
      telpKonfirmasi,
      intervalPembayaran,
      approvalSM,
      status,
      customerShipName,
      address,
      phone,
      contactPerson,
      salesName,
      createBy,
      createDate,
      reasonSM,
      notes;

  ListInkaroHeader.fromJson(Map json)
      : inkaroContractId = json['id_inkaro_contract'],
        noAccount = json['CUSTOMER_SHIP_NUMBER'],
        startPeriode = json['start_periode'] ?? '',
        endPeriode = json['end_periode'] ?? '',
        nikKTP = json['nik_ktp'],
        npwp = json['npwp'],
        namaStaff = json['nama_staff'],
        jabatan = json['jabatan'],
        anRekening = json['an_rekening'],
        bank = json['bank'],
        namaBank = json['nama_bank'],
        nomorRekening = json['nomor_rekening'],
        telpKonfirmasi = json['telp_konfirmasi'],
        intervalPembayaran = json['interval_pembayaran'],
        approvalSM = json['approval_sm'],
        status = json['status'],
        customerShipName = json['CUSTOMER_SHIP_NAME'],
        address = json['ADDRESS'],
        phone = json['PHONE'],
        contactPerson = json['CONTACT_PERSON'],
        salesName = json['SALES_NAME'],
        createBy = json['create_by'],
        createDate = json['create_date'],
        reasonSM = json['reason_sm'],
        notes = json['notes'];

  Map toJson() {
    return {
      'id_inkaro_contract': inkaroContractId,
      'CUSTOMER_SHIP_NUMBER': noAccount,
      'nama_usaha': startPeriode,
      'alamat_usaha': endPeriode,
      'nik_ktp': nikKTP,
      'npwp': npwp,
      'nama_staff': namaStaff,
      'jabatan': jabatan,
      'an_rekening': anRekening,
      'bank': bank,
      'nama_bank': namaBank,
      'nomor_rekening': nomorRekening,
      'telp_konfirmasi': telpKonfirmasi,
      'interval_pembayaran': intervalPembayaran,
      'approval_sm': approvalSM,
      'status': status,
      'CUSTOMER_SHIP_NAME': customerShipName,
      'ADDRESS': address,
      'PHONE': phone,
      'CONTACT_PERSON': contactPerson,
      'SALES_NAME': salesName,
      'create_by': createBy,
      'create_date': createDate,
      'notes': notes
    };
  }
}
