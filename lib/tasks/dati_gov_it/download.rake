namespace :dati_gov_it do
  task download: :environment do
    d = DatiGovIt::Downloader.new
    d.get_package_list
    d.get_packages
  end

  task reset: :environment do
    DatiGovIt::Package.destroy_all
  end
end
