class Proddiv {
  String proddiv, alias;
  bool ischecked = false;

  Proddiv(this.alias, this.proddiv);

  Proddiv.fromJson(Map json): 
    proddiv = json['prod_div'],
    alias = json['alias'];

  Map toJson() {
    return {
      'prod_div' : proddiv,
      'alias' : alias
    };
  }
}