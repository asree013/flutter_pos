import 'dart:io';

void main() {
  writeFile('parunyu');
}

readFile() {
  File('./tranning/files/file.txt').readAsString().then((String txt) {
    print(txt);
  });
}

writeFile(String str) async {
  var filename = './tranning/files/$str.txt';

  final result = await File(filename).writeAsString(str);


}