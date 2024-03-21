import 'Loại sản phẩm.dart';

class DataListType {
   static final List<DataType> listType = [];
   static void addType() {
     listType.add(DataType(type: 1, name: 'manfashion', imageUrl: 'assets/icons/thoitrangnu.png'));
     listType.add(DataType(type: 2, name: 'womanfashion', imageUrl: 'assets/icons/thoitrangnam.png'));
     listType.add(DataType(type: 3, name: 'pcaccessory', imageUrl: 'assets/icons/maytinh.png'));
     listType.add(DataType(type: 4, name: 'kid', imageUrl: 'assets/icons/treem.png'));
     listType.add(DataType(type: 5, name: 'sport', imageUrl: 'assets/icons/thethao.png'));
     listType.add(DataType(type: 6, name: 'vehicle', imageUrl: 'assets/icons/oto.png'));
     listType.add(DataType(type: 7, name: 'jewelry', imageUrl: 'assets/icons/trangsuc.png'));
     listType.add(DataType(type: 8, name: 'phoneaccessory', imageUrl: 'assets/icons/dienthoai.png'));
     listType.add(DataType(type: 9, name: 'housedecor', imageUrl: 'assets/icons/trangtrinha.png'));
     listType.add(DataType(type: 10, name: 'toy', imageUrl: 'assets/icons/dochoi.png'));
     listType.add(DataType(type: 11, name: 'flashsaletype', imageUrl: 'assets/icons/flashsale.png'));
     listType.add(DataType(type: 12, name: 'cosmetic', imageUrl: 'assets/icons/mypham.png'));
   }
}