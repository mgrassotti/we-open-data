class DatiGovIt::Package
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :id, type: String
  field :name, type: String
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
  field :_catalog_source_url, type: String
  field :_web_error, type: String
end
