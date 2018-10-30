class DatiGovIt::DownloadWorker
  include Sidekiq::Worker

  def perform
    d = DatiGovIt::Downloader.new
    d.get_package_list
    d.get_packages
  end
end
