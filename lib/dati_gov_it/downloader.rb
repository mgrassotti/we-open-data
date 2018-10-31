class DatiGovIt::Downloader
  PACKAGE_LIST_URL = "https://www.dati.gov.it/api/3/action/package_list"
  PACKAGE_SHOW_URL = "https://www.dati.gov.it/api/3/action/package_show?id="
  FILE_DIR_PATH = "#{Rails.root}/lib/data/dati_gov_it"

  def get_package_list
    log "#{__method__} - START"
    @packages = HTTParty.get(PACKAGE_LIST_URL)["result"].sort
    File.open(FILE_DIR_PATH + "/package_list", 'w') do |writer|
      @packages.each { |package| writer.puts package }
    end
    log "#{@packages.count} packages saved"
    log "#{__method__} - END"
  end

  def get_packages
    log "#{__method__} - START"
    @packages ||= File.read(FILE_DIR_PATH + "/package_list").split("\n")
    total = @packages.length
    @packages.each_with_index do |package, i|
      next if DatiGovIt::Package.where(name: package).any?
      progress = (i.to_f / total).round(2)
      result = HTTParty.get(PACKAGE_SHOW_URL + package)
      if result.code == 404
        log "#{package} not found (#{progress}%)"
        File.open(FILE_DIR_PATH + "/404_packages", 'a') { |writer|
          writer.puts package
        }
      else
        log "saving #{package} (#{progress}%)" 
        new_package = DatiGovIt::Package.new(result["result"])
        unless new_package.save
          log "#{package} not saved" 
        end
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
