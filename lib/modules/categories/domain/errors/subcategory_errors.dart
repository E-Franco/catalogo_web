abstract class SubCategoryFailure implements Exception {}

class CreateSubCategoryError implements SubCategoryFailure {}
class UpdateSubCategoryError implements SubCategoryFailure {}
class DeleteSubCategoryError implements SubCategoryFailure {}
class GetSubCategoriesError implements SubCategoryFailure {}
