class ImportController < ApplicationController
  before_filter :set_events, only: %i(webcatalog twitter)
  def webcatalog
  end

  def webcatalog_submit
    importer = Importers::WebcatalogManual.new(Event.find(params[:event_id]))
    @import_log = importer.import_raw_entries(JSON.parse(params[:json]))
  rescue JSON::ParserError
    flash[:error] = 'Parse error...'
    redirect_to webcatalog_import_path
  end

# def twitter
# end

# def twitter_submit
#   importer = Importers::TwitterKoba.new(Event.find(params[:event_id]))
#   @import_log = importer.import_csv(JSON.parse(params[:csv]))
# end

end
