class GovIt::DownloadWorker
  include Sidekiq::Worker

  def perform
    d = GovIt::Downloader.new
    d.get_package_list
    d.get_packages
  end
end
