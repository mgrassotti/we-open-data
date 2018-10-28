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
      except: [:path, :subpaths]
    })).merge({
      url: params[:url] + path,
      urls: subpaths.map{|subpath| params[:url] + path + subpath }
    })
  end

  def subpaths
    read_attribute(:subpaths).split("; ")
  end
end
