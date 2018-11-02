class DatiGovIt::Downloader
  PACKAGE_LIST_URL = "https://www.dati.gov.it/api/3/action/package_list"
  PACKAGE_SHOW_URL = "https://www.dati.gov.it/api/3/action/package_show?id="
  FILE_DIR_PATH = "#{Rails.root}/lib/data/dati_gov_it"

  def get_package_list
    log "#{__method__} - START"
    packages = HTTParty.get(PACKAGE_LIST_URL)["result"].sort - DatiGovIt::Package.pluck(:name)
    packages.each { |package|
      DatiGovIt::Package.new(name: package).save 
      log "#{package} added to packages list"
    }
    log "#{packages.count} new packages added"
    log "#{__method__} - END"
  end

  def get_packages
    log "#{__method__} - START"
    packages = DatiGovIt::Package.where(title: nil)
    total = DatiGovIt::Package.all.count
    packages.each_with_index do |package, i|
      progress = ((i*100).to_f / total).round(2)
      result = HTTParty.get(PACKAGE_SHOW_URL + package.name)
      if result.code == 404
        log "#{package.name} not found (#{progress}%)"
        package.update_attributes(_web_error: "404")
      else
        log "saving #{package.name} (#{progress}%)" 
        values = result["result"].except("id")
        values["gov_id"] = result["result"]["id"]
        package.update_attributes(values)
      end
    end
    log "#{__method__} - END"
  end

private
  def log(message)
    Rails.logger.info(message)
  end
end
