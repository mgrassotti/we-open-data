namespace :dati_gov_it do
  task download: :environment do
    DatiGovIt::DownloadWorker.perform_async
  end

  task reset: :environment do
    DatiGovIt::Package.destroy_all
  end
end
