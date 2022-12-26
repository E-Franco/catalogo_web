abstract class CategoryFailure implements Exception {}

class CreateCategoryError implements CategoryFailure {}
class UpdateCategoryError implements CategoryFailure {}
class DeleteCategoryError implements CategoryFailure {}
class GetCategoriesError implements CategoryFailure {}
