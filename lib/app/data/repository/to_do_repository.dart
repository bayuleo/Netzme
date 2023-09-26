import 'package:boiler_plate_getx/app/data/model/index.dart';
import 'package:boiler_plate_getx/app/data/remote/to_do_data_source.dart';
import 'package:get/get.dart';

abstract class ToDoRepository {
  Future<ResponseGeneral> addData(ParamToDo param);
  Future<ResponseListToDo> getData(String userEmail);
  Future<ResponseGeneral> updateData(ResponseToDo param);
  Future<ResponseGeneral> deleteData(ResponseToDo param);
}

class ToDoRepositoryImpl implements ToDoRepository {
  final _toDoDataSource = Get.find<ToDoDataSource>();

  @override
  Future<ResponseGeneral> addData(ParamToDo param) async {
    return await _toDoDataSource.addData(param);
  }

  @override
  Future<ResponseListToDo> getData(String userEmail) async {
    return await _toDoDataSource.getData(userEmail);
  }

  @override
  Future<ResponseGeneral> updateData(ResponseToDo param) async {
    return await _toDoDataSource.updateData(param);
  }

  @override
  Future<ResponseGeneral> deleteData(ResponseToDo param) async {
    return await _toDoDataSource.deleteData(param);
  }
}
