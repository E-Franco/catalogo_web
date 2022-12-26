abstract class ProductFailure implements Exception {}

class CreateProductError implements ProductFailure {}
class UpdateProductError implements ProductFailure {}
class DeleteProductError implements ProductFailure {}
class GetProductsError implements ProductFailure {}

class UploadImageError implements ProductFailure {}
class DeleteImageError implements ProductFailure {}
