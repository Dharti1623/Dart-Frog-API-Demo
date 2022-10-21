import 'package:dart_frog/dart_frog.dart';
import 'package:new_frog_demo_api/source/category_data_source.dart';

// we will create a request to read our dataSource
Future<Response> onRequest(RequestContext context,String catId) async {
  // reading the context of our dataSource
  final dataRepository = context.read<DataSource>();
  final request = context.request;
  switch(request.method){
    case HttpMethod.get:
      final category = await dataRepository.fetchCategory(catId);
      return Response.json(body: {'data' : category});
      break;
    case HttpMethod.delete:
      final data = await dataRepository.deleteCategory(catId);
      return Response.json(body: {'message' : "Deleted successfully"});
      break;
    case HttpMethod.put:
      List values = [];
      final data = await context.request.json();
      data.forEach((key, value) {
        values.add('$key="$value"');
      });
      final result = await dataRepository.updateCategory(values,catId);
      return Response.json(body: {'message' : result});
      break;
    case HttpMethod.post:
      const msg = 'Please remove Id you want to insert data';
      return Response.json(body: {'error' : msg} );
      break;
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
      return Response.json(body: {'message' : 'Method not found'});
      break;
  }
}

