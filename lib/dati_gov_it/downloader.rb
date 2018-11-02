class DatiGovIt::Downloader
  PACKAGE_LIST_URL = "https://www.dati.gov.it/api/3/action/package_list"
  PACKAGE_SHOW_URL = "https://www.dati.gov.it/api/3/action/package_show?id="
  FILE_DIR_PATH = "#{Rails.root}/lib/data/dati_gov_it"

  def get_package_list
    log "#{__method__} - START"
    packages = HTTParty.get(PACKAGE_LIST_URL)["result"].sort
    packages.each { |package| 
      unless DatiGovIt::Package.where(name: package).any?
        DatiGovIt::Package.new(name: package).save 
      end
      }
    log "#{packages.count} packages saved"
    log "#{__method__} - END"
  end

  def get_packages
    log "#{__method__} - START"
    packages = DatiGovIt::Package.all
    total = packages.length
    packages.each_with_index do |package, i|
      # next if DatiGovIt::Package.where(name: package).any?
      progress = (i.to_f / total).round(2)
      result = HTTParty.get(PACKAGE_SHOW_URL + package.name)
      if result.code == 404
        log "#{package} not found (#{progress}%)"
        package.update_attributes(_web_error: "404")
      else
        log "saving #{package.name} (#{progress}%)" 
        package.update_attributes(result["result"])
      end
    end
    log "#{__method__} - END"
  end

private
  def log(message)
    Rails.logger.info(message)
    puts message
  end
end
