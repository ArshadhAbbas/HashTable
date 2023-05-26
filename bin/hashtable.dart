class HashTable {
  int size;
  late List<List<dynamic>> table;
  HashTable(this.size) {
    table = List.generate(size, (_) => []);
  }
  int hash(String key) {
    int total = 0;
    for (int i = 0; i < key.length; i++) {
      total = total + key.codeUnitAt(i);
    }
    return total % size;
  }


  void set(String key, dynamic value) {
    int index = hash(key);
    List<dynamic> list = table[index];
    for (int i = 0; i < list.length; i++) {
      if (list[i][0] == key) {
        list[i][1] = value;
        return;
      }
    }
    list.add([key, value]);
  }


  void get(String key) {
    int index = hash(key);
    List<dynamic> list = table[index];
    for (int i = 0; i < list.length; i++) {
      if (list[i][0] == key) {
        print(list[i][1]);
        return;
      }
    }
    print("No");
  }


  void remove(String key) {
    int index = hash(key);
    List<dynamic> list = table[index];
    for (int i = 0; i < list.length; i++) {
      if (list[i][0] == key) {
        list.removeAt(i);
      }
    }
  }


  void display() {
    for (int i = 0; i < table.length; i++) {
      List<dynamic> list = table[i];
      for (int j = 0; j < list.length; j++) {
        print("$i: ${list[j][0]}=${list[j][1]}");
      }
    }
  }
}


void main() {
  HashTable table = HashTable(10);
  table.set("Name", "Akhil");
  table.set("Age", 25);
  table.set("Place", "Pattambi");
  table.display();
  print("____________________");
  table.get("Age");
  print('____________________');
  table.remove("Place");
  table.display();
}


