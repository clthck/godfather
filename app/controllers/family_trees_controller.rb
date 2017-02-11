class FamilyTreesController < ApplicationController
  def index
    @people = Person.free
    @family_tree = FamilyTree.first_or_create
  end

  def update
    @family_tree = FamilyTree.find(params[:id])
    @family_tree.assign_attributes family_tree_params
    @family_tree.save
  end

  protected

  def family_tree_params
    params.require(:family_tree).permit(:raw_data)
  end
end
