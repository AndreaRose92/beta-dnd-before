class FeatureSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :api_index, :desc, :level, :dnd_class

  def dnd_class
    DndClass.find_by(id: self.object.dnd_class_id).name
  end
end
