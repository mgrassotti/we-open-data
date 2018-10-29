class Service
  include Mongoid::Document

  field :name, type: String 
  field :path, type: String 
  field :subpaths, type: Array  
  field :description, type: String 
  field :version, type: String 
  field :data_source, type: String 

  def as_json(params={})
    super(params.merge({
      except: [:id, :path, :subpaths]
    })).merge({
      url: url(params[:base_url]),
      urls: urls(params[:base_url])
    })
  end

  def url(base_url)
    base_url + path
  end

  def urls(base_url)
    subpaths.map{|subpath| url(base_url) + subpath }
  end
end
