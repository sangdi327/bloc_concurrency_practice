class PictureRepository {
  List<String> pictureList = ['animal_top.jpg', 'cat.jpg', 'racoon.jpg'];
  List<int> pictureDelay = [2500, 1500, 3500];

  Future<String> animalPictures(int index) async {
    print(index % 3);
    await Future.delayed(Duration(milliseconds: pictureDelay[index % 3]));
    print('result : ${pictureList[index % 3]}');
    return pictureList[index % 3];
  }
}
