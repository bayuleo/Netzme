## Json to model generator

1. Create/copy `.json` files into `lib/json/`
   - lib/json/dog.json
   ```json
   {
     "name": "string",
     "age": 0,
     "isAlive": true,
     "breed?": "$dog_breed"
   }
   ```
   - lib/json/dog_breed.json
   ```json
   {
     "name": "string"
   }
   ```
   > **_NOTE:_** <b>breed?</b> means breed is nullable
2. Run the following command<br/>

   ```sh
   flutter pub run json_to_model -s lib/json -o lib/app/data/model
   ```

3. Usage

   ```dart
    import 'package:mantra_mobile/app/data/model/index.dart';

    const myDog = Dog(
      name: "Thunder",
      age: 2,
      isAlive: true,
      breed: DogBreed(name: "Rottweiler"),
    );

    final myOtherDog = Dog.fromJson(const {
      "name": "Bulk",
      "age": 2,
      "isAlive": true,
    });

    print(myDog.toJson());
    print(myOtherDog.toJson());
   ```

[Package Docs](https://pub.dev/packages/json_to_model)
