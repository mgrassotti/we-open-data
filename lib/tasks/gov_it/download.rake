namespace :gov_it do
  task download: :environment do
    GovIt::DownloadWorker.perform_async
  end

  task reset: :environment do
    GovIt::Package.destroy_all
  end
end
