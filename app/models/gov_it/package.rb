class GovIt::Package
  include Mongoid::Document
  # include Mongoid::Attributes::Dynamic

  field :gov_id, type: String
  field :name, type: String
  index({ name: 1 }, { unique: true, name: "name_index" })
  field :title, type: String
  field :maintainer, type: String
  field :author_email, type: String
  field :maintainer_email, type: String
  field :license_url, type: String
  field :license_id, type: String
  field :notes, type: String
  field :url, type: String
  field :state, type: String
  field :log_message, type: String
  field :revision_timestamp, type: String
  field :metadata_created, type: String
  field :metadata_modified, type: String
  field :creator_user_id, type: String
  field :type, type: String
  field :resources, type: Array
  field :tags, type: Array
  field :groups, type: Array
  field :organization, type: Array
  field :extras, type: Array
  field :_catalog_parent_name, type: String
  index({ _catalog_parent_name: 1 }, { name: "_catalog_parent_name_index" })
  field :_catalog_source_url, type: String
  field :_web_error, type: String

  def self.populated_fields
    total_documents = GovIt::Package.all.count
    self.new.fields.keys.inject({}) do |res, field|
      total = GovIt::Package.where(field.to_sym.nin => ["", nil]).count
      res[field] = "#{((total*100).to_f / total_documents).round(2)}%"
      res
    end
  end

  def self.values_per_field
    self.new.fields.keys.inject({}) do |res, field|
      keys = GovIt::Package.all.group_by(&(field.to_sym)).keys
      res[field] = keys.count > 5 ? ">5" : keys
      res
    end
  end

  def self.count_by_catalog_parent_name
    @catalog_parent_names ||= self.all.group_by(&:_catalog_parent_name).keys.inject({
      "All" => self.all.count
    }) do |res, key|
      res[key] = self.where(_catalog_parent_name: key).count if key
      res
    end.sort_by{|v| -v[1]}
  end
end
