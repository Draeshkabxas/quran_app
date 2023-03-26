/// id : 1
/// jozz : 1
/// page : "1"
/// sura_no : 1
/// sura_name_en : "Al-Fātiḥah"
/// sura_name_ar : "الفَاتِحة"
/// line_start : 2
/// line_end : 2
/// aya_no : 1
/// aya_text : "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ ﰀ"

class Ayah {
  Ayah({
      num? id, 
      num? jozz, 
      String? page, 
      num? suraNo, 
      String? suraNameEn, 
      String? suraNameAr, 
      num? lineStart, 
      num? lineEnd, 
      num? ayaNo, 
      String? ayaText,}){
    _id = id;
    _jozz = jozz;
    _page = page;
    _suraNo = suraNo;
    _suraNameEn = suraNameEn;
    _suraNameAr = suraNameAr;
    _lineStart = lineStart;
    _lineEnd = lineEnd;
    _ayaNo = ayaNo;
    _ayaText = ayaText;
}

  Ayah.fromJson(dynamic json) {
    _id = json['id'];
    _jozz = json['jozz'];
    _page = json['page'].toString();
    _suraNo = json['sura_no'];
    _suraNameEn = json['sura_name_en'];
    _suraNameAr = json['sura_name_ar'];
    _lineStart = json['line_start'];
    _lineEnd = json['line_end'];
    _ayaNo = json['aya_no'];
    _ayaText = json['aya_text'];
  }
  num? _id;
  num? _jozz;
  String? _page;
  num? _suraNo;
  String? _suraNameEn;
  String? _suraNameAr;
  num? _lineStart;
  num? _lineEnd;
  num? _ayaNo;
  String? _ayaText;
Ayah copyWith({  num? id,
  num? jozz,
  String? page,
  num? suraNo,
  String? suraNameEn,
  String? suraNameAr,
  num? lineStart,
  num? lineEnd,
  num? ayaNo,
  String? ayaText,
}) => Ayah(  id: id ?? _id,
  jozz: jozz ?? _jozz,
  page: page ?? _page,
  suraNo: suraNo ?? _suraNo,
  suraNameEn: suraNameEn ?? _suraNameEn,
  suraNameAr: suraNameAr ?? _suraNameAr,
  lineStart: lineStart ?? _lineStart,
  lineEnd: lineEnd ?? _lineEnd,
  ayaNo: ayaNo ?? _ayaNo,
  ayaText: ayaText ?? _ayaText,
);
  num? get id => _id;
  num? get jozz => _jozz;
  String? get page => _page;
  num? get suraNo => _suraNo;
  String? get suraNameEn => _suraNameEn;
  String? get suraNameAr => _suraNameAr;
  num? get lineStart => _lineStart;
  num? get lineEnd => _lineEnd;
  num? get ayaNo => _ayaNo;
  String? get ayaText => _ayaText;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['jozz'] = _jozz;
    map['page'] = _page;
    map['sura_no'] = _suraNo;
    map['sura_name_en'] = _suraNameEn;
    map['sura_name_ar'] = _suraNameAr;
    map['line_start'] = _lineStart;
    map['line_end'] = _lineEnd;
    map['aya_no'] = _ayaNo;
    map['aya_text'] = _ayaText;
    return map;
  }

}