class City
  include Mongoid::Document

  field :nome, type: String
  field :codice, type: String
  field :zona, type: Hash
  field :regione, type: Hash
  field :cm, type: Hash
  field :provincia, type: Hash
  field :sigla, type: String
  field :codiceCatastale, type: String
  field :cap, type: Array
  field :popolazione, type: Integer
end
