# == Schema Information
#
# Table name: services
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  path        :string
#  description :text
#  version     :string
#  data_source :string
#

class Service < ApplicationRecord
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

  def subpaths
    read_attribute(:subpaths).split("; ")
  end
end
